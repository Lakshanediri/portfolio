import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class Header extends StatelessComponent {
  const Header({super.key});

  static const _links = [
    (number: '01', label: 'About', href: '#about'),
    (number: '02', label: 'Skills', href: '#skills'),
    (number: '03', label: 'Projects', href: '#projects'),
    (number: '04', label: 'Experience', href: '#experience'),
    (number: '05', label: 'Contact', href: '#contact'),
  ];

  @override
  Component build(BuildContext context) {
    return header(classes: 'site-header', [
      div(classes: 'wrap', [
        div(classes: 'nav-shell', [
          a(href: '#top', classes: 'brand', [
            span(classes: 'brand-mark', [.text('LE')]),
            span(classes: 'brand-text', [
              span(classes: 'brand-name', [.text('lakshan.dev')]),
              span(classes: 'brand-role', [.text('Mobile application engineer')]),
            ]),
          ]),
          nav(classes: 'nav-links', attributes: {'aria-label': 'Primary'}, [
            for (final link in _links)
              a(href: link.href, [
                span(classes: 'num', [.text(link.number)]),
                .text(link.label),
              ]),
          ]),
          div(classes: 'nav-actions', [
            input(
              type: InputType.checkbox,
              id: 'theme-toggle',
              classes: 'theme-input',
              attributes: {'aria-label': 'Toggle dark mode'},
            ),
            label(htmlFor: 'theme-toggle', classes: 'theme-toggle', [
              span(classes: 'knob', [
                span(classes: 'i i-moon', []),
                span(classes: 'i i-sun', []),
              ]),
            ]),
            a(href: '#contact', classes: 'btn btn-primary nav-cta', [
              .text('Hire me'),
              span(classes: 'i i-arrow', []),
            ]),
          ]),
        ]),
      ]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
