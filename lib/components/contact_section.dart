import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ContactSection extends StatelessComponent {
  const ContactSection({super.key});

  static const _email = 'lakshanedirisingheedu2022@gmail.com';
  static const _github = 'https://github.com/Lakshanediri';
  static const _linkedin = 'https://www.linkedin.com/in/lakshanedirisinghe';

  @override
  Component build(BuildContext context) {
    return section(id: 'contact', classes: 'section contact', [
      div(classes: 'wrap', [
        div(classes: 'section-head', [
          div([
            p(classes: 'eyebrow', [.text('Get in touch')]),
            h2([
              .text("Let's connect & "),
              em([.text('collaborate')]),
            ]),
          ]),
          span(classes: 'verified-pill', [
            span(classes: 'i i-check', []),
            .text('Open to new opportunities · quick reply'),
          ]),
        ]),
        div(classes: 'contact-grid', [
          _panel(),
          _form(),
        ]),
      ]),
    ]);
  }

  static Component _panel() {
    return div(classes: 'contact-panel', [
      h2([
        .text("Let's build something "),
        em([.text('extraordinary')]),
        .text(' together'),
      ]),
      p([
        .text(
          "I'm a mobile application engineer and software engineering "
          'undergraduate at the Open University of Sri Lanka. I build Android '
          'and Flutter products end to end — from data layer to interface — '
          'and I am always open to a good conversation or a new project.',
        ),
      ]),
      div(classes: 'contact-list', [
        a(href: 'mailto:$_email', [
          span(classes: 'ic', [span(classes: 'i i-mail', [])]),
          span([
            span(classes: 'cl-label', [.text('Email')]),
            span(classes: 'cl-value', [.text(_email)]),
          ]),
        ]),
        _info(
          icon: 'i-pin',
          label: 'Location',
          value: 'Sri Lanka — remote friendly',
        ),
        _info(
          icon: 'i-clock',
          label: 'Timezone',
          value: 'UTC +05:30 · replies within 24h',
        ),
        _info(
          icon: 'i-bolt',
          label: 'Availability',
          value: 'Open to Flutter / Android roles',
        ),
      ]),
      div(classes: 'contact-socials', [
        _social(icon: 'i-code', label: 'GitHub', href: _github),
        _social(icon: 'i-users', label: 'LinkedIn', href: _linkedin),
        a(href: 'mailto:$_email', classes: 'social', [
          span(classes: 'i i-mail', []),
          .text('Email'),
        ]),
      ]),
    ]);
  }

  static Component _info({
    required String icon,
    required String label,
    required String value,
  }) {
    return div([
      span(classes: 'ic', [span(classes: 'i $icon', [])]),
      span([
        span(classes: 'cl-label', [.text(label)]),
        span(classes: 'cl-value', [.text(value)]),
      ]),
    ]);
  }

  static Component _social({
    required String icon,
    required String label,
    required String href,
  }) {
    return a(href: href, classes: 'social', attributes: {'target': '_blank', 'rel': 'noopener'}, [
      span(classes: 'i $icon', []),
      .text(label),
    ]);
  }

  static Component _form() {
    return div(classes: 'contact-card', [
      div(classes: 'form-head', [
        span([.text('Project brief')]),
        span(classes: 'mono', [.text('01 — 04')]),
      ]),
      div(classes: 'form-grid', [
        _field(
          label: 'Your name',
          name: 'name',
          placeholder: 'e.g. Alex Chen',
        ),
        _field(
          label: 'Your email',
          name: 'email',
          placeholder: 'alex@example.com',
          type: InputType.email,
        ),
        _field(
          label: 'Project type',
          name: 'project',
          placeholder: 'App idea · internship · full-time role',
          full: true,
        ),
        div(classes: 'field full', [
          span([.text('Message')]),
          textarea(
            name: 'message',
            rows: 4,
            placeholder: "Hi Lakshan, I'd like to talk about …",
            attributes: {'aria-label': 'Message'},
            const [],
          ),
        ]),
      ]),
      div(classes: 'form-foot', [
        span(classes: 'note', [
          span(classes: 'i i-check', []),
          .text('Opens your mail app — no data stored'),
        ]),
        a(
          href: 'mailto:$_email?subject=Project%20inquiry',
          classes: 'btn btn-send',
          [
            .text('Send message'),
            span(classes: 'i i-send', []),
          ],
        ),
      ]),
      div(classes: 'form-extra', [
        div([b([.text('24h')]), span([.text('Typical reply')])]),
        div([b([.text('CV')]), span([.text('On request')])]),
        div([b([.text('Remote')]), span([.text('Worldwide')])]),
      ]),
    ]);
  }

  static Component _field({
    required String label,
    required String name,
    required String placeholder,
    InputType type = InputType.text,
    bool full = false,
  }) {
    return div(classes: full ? 'field full' : 'field', [
      span([.text(label)]),
      input(
        type: type,
        name: name,
        attributes: {'placeholder': placeholder, 'aria-label': label},
      ),
    ]);
  }
}
