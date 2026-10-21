# Lakshan Edirisinghe — Portfolio

A dark/light portfolio for a mobile application engineer, built with
[Jaspr](https://jaspr.site) and Dart. Rendering is fully static (server-side
pre-rendered) — the layout, theme switch, matrix rain and most animations need
no client-side JavaScript. The phone in the hero is a small interactive app,
progressively enhanced by `web/js/phone-app.js` (without it the feed still
scrolls and the page reads fine).

**Live:** <https://lakshanediri.github.io/portfolio/>

## Running

Requires the Dart SDK 3.10+ (or the Flutter SDK, which bundles it) and the
Jaspr CLI:

```bash
dart pub global activate jaspr_cli
dart pub get
jaspr serve
```

The dev server runs on `http://localhost:8080`.

> `jaspr serve` also runs `build_runner`, which regenerates
> `lib/main.*.options.dart` whenever you add a component annotated with
> `@client` or `@css`.

## Building

```bash
jaspr build
```

The static site is written to `build/jaspr/`. Deploy that folder to any static
host (Netlify, Vercel, GitHub Pages, Cloudflare Pages, …).

### GitHub Pages

The site is published to a project page, so the build must know its path:

```bash
jaspr build --dart-define=SITE_BASE=/portfolio/
```

`.github/workflows/deploy.yml` does exactly that on every push to `main` and
deploys `build/jaspr/` with `actions/deploy-pages`. `SITE_BASE` only changes the
`<base href>` in the pre-rendered HTML (it defaults to `/` for local builds and
root-domain hosts); every asset is referenced relatively, so no other path
needs rewriting.

## Project structure

```
lib/
  app.dart                      # header + page shell
  main.server.dart              # <head> (fonts, stylesheet, meta) + pre-render
  pages/home.dart               # section order of the landing page
  components/
    header.dart                 # sticky nav, anchor links, theme switch
    hero_section.dart           # headline, stats, interactive phone mockup
    matrix_rain.dart            # generated code-rain columns
    stacks_section.dart         # 01 — engineering stacks
    projects_section.dart       # 02 — featured & compact projects
    experience_section.dart     # 03 — education & project timeline
    contact_section.dart        # 04 — contact panel + project brief
    site_footer.dart

web/
  styles/                       # the whole design system, plain CSS
    base.css  header.css  hero.css  phone-app.css  matrix.css
    stacks.css  projects.css  experience.css  contact.css  footer.css
    theme.css  responsive.css
    main.css                    # @import entry point
  js/phone-app.js               # phone mockup: tilt, hero transition, back
  images/                       # profile photo + favicon
  cv.pdf                        # linked from "Download CV"

assets/
  profile_original.jpeg         # original full-resolution photo (not served)
```

## Editing content

All copy lives in the Dart components in `lib/components/`, so there is no CMS
or JSON layer to keep in sync. Typical edits:

| What | Where |
| --- | --- |
| Name, brand, email | `header.dart`, `hero_section.dart`, `contact_section.dart`, `site_footer.dart` |
| GitHub / LinkedIn URLs | `projects_section.dart`, `contact_section.dart`, `site_footer.dart` |
| Stats, phone mockup | `hero_section.dart` (hero copy + `_buildHome`) |
| Phone project screens | `hero_section.dart` (`_buildDetail` calls) |
| Skill columns | `stacks_section.dart` (`_stacks`) |
| Featured / compact projects | `projects_section.dart` (`_compactProjects`) |
| Education and project entries | `experience_section.dart` |
| CV download | replace `web/cv.pdf` |

The contact form is intentionally front-end only: "Send message" opens the
visitor's mail client via a `mailto:` link. Point it at a form service (Formspree,
Netlify Forms, …) if you need submissions without email.

## Design notes

- **Typography** — Sora for display, JetBrains Mono for the technical labels.
- **Palette** — deep navy (`#061320`), mint/teal accents (`#0fb9a0`, `#35e6c4`)
  and a cool paper background (`#eef1f7`).
- **Theme switch** — implemented in pure CSS with a hidden checkbox and
  `body:has(#theme-toggle:checked)`, so it works without JavaScript.
- **Theme-aware bands** — the projects/experience/contact band and the footer
  are deep navy in dark mode and switch to the paper tone in light mode; the
  app cards keep their dark surfaces in both themes.
- **Icons** — CSS masks (`web/styles/base.css`, `--i-*` variables), so every
  icon inherits `currentColor` and adds no requests.
- **Motion** — hero entrance and scroll reveals use CSS animations with
  `animation-timeline: view()` where supported, and respect
  `prefers-reduced-motion`.
- **Phone mockup** — a server-rendered app UI inside the hero: the feed scrolls
  natively, and `web/js/phone-app.js` adds the pointer tilt, the shared-element
  (FLIP) transition from a project thumbnail to the detail banner and the
  push/pop navigation. Tilt and transitions are skipped on touch devices and
  with `prefers-reduced-motion`; the detail screens are `inert` while hidden and
  `Escape` returns to the feed.

## Fonts

Loaded from Google Fonts in `lib/main.server.dart`. To self-host, drop the
woff2 files into `web/fonts/`, add `@font-face` rules and remove the
`fonts.googleapis.com` links.
