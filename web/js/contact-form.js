(() => {
  const form = document.querySelector('form.contact-card');
  if (!form) return;

  const note = form.querySelector('.form-foot .note');
  const noteText = note ? note.querySelector('.note-text') : null;
  const noteIcon = note ? note.querySelector('.i') : null;
  const button = form.querySelector('.btn-send');
  if (!note || !noteText || !button) return;

  const defaultNote = noteText.textContent;
  const email = form.getAttribute('data-email') || '';
  let sending = false;

  function setNote(text, kind) {
    note.classList.remove('is-sending', 'is-sent', 'is-error');
    if (kind) note.classList.add('is-' + kind);
    noteText.textContent = text;
    if (noteIcon) {
      noteIcon.className =
        kind === 'sent' ? 'i i-check' : kind === 'error' ? 'i i-mail' : 'i i-send';
    }
  }

  function mailtoFor(data) {
    const subject = 'Portfolio inquiry' + (data.name ? ' — ' + data.name : '');
    const body = [
      'Name: ' + (data.name || ''),
      'Email: ' + (data.email || ''),
      'Project: ' + (data.project || ''),
      '',
      data.message || '',
    ].join('\n');
    return (
      'mailto:' +
      email +
      '?subject=' +
      encodeURIComponent(subject) +
      '&body=' +
      encodeURIComponent(body)
    );
  }

  form.addEventListener('input', () => {
    if (sending) return;
    if (note.classList.contains('is-sent') || note.classList.contains('is-error')) {
      setNote(defaultNote);
    }
  });

  form.addEventListener('submit', async (event) => {
    event.preventDefault();
    if (sending) return;

    const honey = form.querySelector('[name="_honey"]');
    if (honey && honey.value) return; // bot trap

    const data = {};
    new FormData(form).forEach((value, key) => {
      if (key.charAt(0) !== '_') data[key] = String(value);
    });

    sending = true;
    button.disabled = true;
    setNote('Sending…', 'sending');

    try {
      const response = await fetch(form.action, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
        body: JSON.stringify(data),
      });
      const payload = await response.json().catch(() => ({}));

      if (!response.ok || String(payload.success) === 'false') {
        throw new Error(payload.message || 'HTTP ' + response.status);
      }

      const message = String(payload.message || '');
      if (/activat|confirm/i.test(message)) {
        setNote('Almost there — confirm the form from your inbox', 'sent');
      } else {
        setNote("Message sent — I'll reply within 24 hours", 'sent');
      }
      form.reset();
    } catch (error) {
      console.warn('Contact form could not send; falling back to email.', error);
      note.classList.remove('is-sending');
      note.classList.add('is-error');
      if (noteIcon) noteIcon.className = 'i i-mail';
      noteText.textContent = "Couldn't send automatically — ";
      const link = document.createElement('a');
      link.href = mailtoFor(data);
      link.textContent = 'email me instead';
      noteText.appendChild(link);
    } finally {
      sending = false;
      button.disabled = false;
    }
  });
})();
