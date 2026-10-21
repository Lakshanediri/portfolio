/* =========================================================================
   phone-app.js — interactive app mockup inside the hero

   Adds:
     · pointer-driven 3D tilt + depth parallax (desktop, fine pointers)
     · tap a project  -> thumbnail expands into the detail banner (FLIP)
     · iOS-style push/pop slide between the feed and a detail screen
     · back button / Escape to return to the feed

   The markup is server-rendered and fully usable without this file
   (the feed still scrolls; cards simply do nothing).
   ========================================================================= */
(() => {
  "use strict";

  const hero = document.querySelector(".hero");
  if (!hero) return;

  const phone = hero.querySelector(".phone");
  const screen = hero.querySelector(".phone-screen");
  const home = hero.querySelector(".app-home");
  const visual = hero.querySelector(".hero-visual");
  if (!phone || !screen || !home) return;

  const details = Array.from(hero.querySelectorAll(".app-detail"));
  const reduced = window.matchMedia("(prefers-reduced-motion: reduce)");
  const finePointer = window.matchMedia("(hover: hover) and (pointer: fine)");

  const HOME_SHIFT = 0.24; // keep in sync with .app-home.is-behind
  const DURATION = 460;

  /* ------------------------------------------------------------- tilt */
  let paused = false;
  let targetX = 0;
  let targetY = 0;
  let currentX = 0;
  let currentY = 0;
  let frame = 0;

  const clearParallax = () => {
    hero.style.setProperty("--hvx", "0px");
    hero.style.setProperty("--hvy", "0px");
  };

  const clearTilt = () => {
    targetX = 0;
    targetY = 0;
    clearParallax();
  };

  const tick = () => {
    frame = 0;
    currentX += (targetX - currentX) * 0.14;
    currentY += (targetY - currentY) * 0.14;

    const settled =
      Math.abs(targetX - currentX) < 0.02 && Math.abs(targetY - currentY) < 0.02;
    if (settled) {
      currentX = targetX;
      currentY = targetY;
    }

    if (currentX === 0 && currentY === 0) {
      phone.style.transform = "";
    } else {
      phone.style.transform =
        "perspective(1100px) rotateX(" +
        currentY.toFixed(2) +
        "deg) rotateY(" +
        currentX.toFixed(2) +
        "deg)";
    }

    if (!settled) frame = requestAnimationFrame(tick);
  };

  const kick = () => {
    if (!frame) frame = requestAnimationFrame(tick);
  };

  const onPointerMove = (event) => {
    if (paused) return;
    const rect = hero.getBoundingClientRect();
    if (!rect.width || !rect.height) return;

    // -0.5 .. 0.5 from the hero centre
    const nx = (event.clientX - rect.left) / rect.width - 0.5;
    const ny = (event.clientY - rect.top) / rect.height - 0.5;

    targetY = nx * 12; // rotateY
    targetX = -ny * 10; // rotateX

    hero.style.setProperty("--hvx", (nx * 10).toFixed(2) + "px");
    hero.style.setProperty("--hvy", (ny * 10).toFixed(2) + "px");
    kick();
  };

  const onPointerLeave = () => {
    if (paused) return;
    clearTilt();
    kick();
  };

  if (!reduced.matches && finePointer.matches) {
    hero.addEventListener("pointermove", onPointerMove, { passive: true });
    hero.addEventListener("pointerleave", onPointerLeave, { passive: true });
  }

  /* -------------------------------------------------------- navigation */
  let active = null;
  let busy = false;

  const artOf = (node) => node.querySelector(".ap-art");

  const rectInScreen = (el) => {
    const s = screen.getBoundingClientRect();
    const r = el.getBoundingClientRect();
    // the visual may be CSS-scaled (mobile); work in local phone pixels
    const scale = screen.offsetWidth ? s.width / screen.offsetWidth : 1;
    return {
      left: (r.left - s.left) / scale,
      top: (r.top - s.top) / scale,
      width: r.width / scale,
      height: r.height / scale,
    };
  };

  /* Clone the artwork and animate it from one rect to another.
     Positions are relative to .phone-screen so the clone lives inside it. */
  const flyArt = (source, from, to, duration) =>
    new Promise((resolve) => {
      const clone = source.cloneNode(true);
      clone.classList.add("flip-art");
      clone.setAttribute("aria-hidden", "true");
      clone.style.left = from.left + "px";
      clone.style.top = from.top + "px";
      clone.style.width = from.width + "px";
      clone.style.height = from.height + "px";
      screen.appendChild(clone);

      const animation = clone.animate(
        [
          {
            left: from.left + "px",
            top: from.top + "px",
            width: from.width + "px",
            height: from.height + "px",
            borderRadius: "11px",
            fontSize: "18px",
          },
          {
            left: to.left + "px",
            top: to.top + "px",
            width: to.width + "px",
            height: to.height + "px",
            borderRadius: "0px",
            fontSize: "52px",
          },
        ],
        {
          duration,
          easing: "cubic-bezier(0.22, 0.75, 0.28, 1)",
          fill: "both",
        },
      );

      const done = () => {
        clone.remove();
        resolve();
      };
      animation.onfinish = done;
      animation.oncancel = done;
    });

  const openProject = (card) => {
    if (busy || active) return;
    const id = card.dataset.project;
    const detail = details.find((node) => node.dataset.project === id);
    if (!detail) return;

    // straighten the phone so the measurements below are untransformed
    paused = true;
    clearTilt();
    phone.style.transform = "";

    const art = artOf(card);
    if (!art) return;

    const scroller = detail.querySelector(".detail-scroll");
    if (scroller) scroller.scrollTop = 0;

    const banner = detail.querySelector(".detail-banner");
    const from = rectInScreen(art);
    const to = {
      left: 0,
      top: 0,
      width: screen.clientWidth,
      height: banner ? banner.offsetHeight : 196,
    };

    active = detail;
    detail.inert = false;
    detail.removeAttribute("aria-hidden");
    detail.classList.add("is-active");
    home.inert = true;
    home.classList.add("is-behind");
    if (visual) visual.classList.add("is-detail");

    if (reduced.matches) {
      detail.focus({ preventScroll: true });
      return;
    }

    busy = true;
    detail.classList.add("is-flying"); // hide the real banner while the clone flies
    flyArt(art, from, to, DURATION).then(() => {
      detail.classList.remove("is-flying");
      busy = false;
      detail.focus({ preventScroll: true });
    });
  };

  const closeProject = () => {
    if (busy || !active) return;

    const detail = active;
    const id = detail.dataset.project;
    const card = home.querySelector('.app-project[data-project="' + id + '"]');
    const banner = detail.querySelector(".detail-banner");
    const art = card ? artOf(card) : null;

    // bring the card back into view before measuring the return flight
    if (card && art) {
      const top = card.offsetTop;
      const bottom = top + card.offsetHeight;
      const limit = home.scrollHeight - home.clientHeight;
      if (top < home.scrollTop + 56) {
        home.scrollTop = Math.max(0, Math.min(top - 76, limit));
      } else if (bottom > home.scrollTop + home.clientHeight - 40) {
        home.scrollTop = Math.max(
          0,
          Math.min(bottom - home.clientHeight + 56, limit),
        );
      }
    }

    let target = null;
    if (card && art) {
      // the feed is still shifted left; add the shift back for the final rect
      const r = rectInScreen(art);
      const shift = home.offsetWidth * HOME_SHIFT;
      target = {
        left: r.left + shift,
        top: r.top,
        width: r.width,
        height: r.height,
      };
    }

    const from = {
      left: 0,
      top: 0,
      width: screen.clientWidth,
      height: banner ? banner.offsetHeight : 196,
    };

    active = null;
    detail.classList.remove("is-active");
    detail.setAttribute("aria-hidden", "true");
    detail.inert = true;
    home.classList.remove("is-behind");
    home.inert = false;
    if (visual) visual.classList.remove("is-detail");
    paused = false;

    if (reduced.matches || !target || !banner) {
      if (card) card.focus({ preventScroll: true });
      return;
    }

    busy = true;
    detail.classList.add("is-flying");
    card.classList.add("is-flying-art");
    flyArt(banner, from, target, 400).then(() => {
      detail.classList.remove("is-flying");
      card.classList.remove("is-flying-art");
      busy = false;
      card.focus({ preventScroll: true });
    });
  };

  /* ------------------------------------------------------------ events */
  home.addEventListener("click", (event) => {
    const card = event.target.closest && event.target.closest(".app-project");
    if (card && home.contains(card)) openProject(card);
  });

  details.forEach((detail) => {
    detail.inert = true;
    const back = detail.querySelector(".detail-back");
    if (back) back.addEventListener("click", closeProject);
  });

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape" && active) {
      event.preventDefault();
      closeProject();
    }
  });
})();
