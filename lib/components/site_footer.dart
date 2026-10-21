import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'matrix_rain.dart';

class SiteFooter extends StatelessComponent {
  const SiteFooter({super.key});

  static const _email = 'lakshanedirisingheedu2022@gmail.com';
  static const _github = 'https://github.com/Lakshanediri';
  static const _linkedin = 'https://www.linkedin.com/in/lakshanedirisinghe';

  @override
  Component build(BuildContext context) {
    return footer(classes: 'site-footer', [
      const MatrixRain(extraClass: 'matrix--footer'),
      div(classes: 'wrap', [
        div(classes: 'footer-grid', [
          div(classes: 'footer-brand', [
            a(href: '#top', classes: 'brand', [
              span(classes: 'brand-mark', [.text('LE')]),
              span(classes: 'brand-text', [
                span(classes: 'brand-name', [.text('lakshan.dev')]),
                span(classes: 'brand-role', [.text('Mobile application engineer')]),
              ]),
            ]),
            p([
              .text(
                'Software engineering undergraduate building thoughtful '
                'Android and Flutter products — open to new opportunities '
                'and internships.',
              ),
            ]),
            span(classes: 'status', [
              span(classes: 'pulse', []),
              .text('Available for Flutter / Android roles'),
            ]),
          ]),
          _column('Navigate', [
            (label: 'About', href: '#about', icon: null),
            (label: 'Skills', href: '#skills', icon: null),
            (label: 'Projects', href: '#projects', icon: null),
            (label: 'Experience', href: '#experience', icon: null),
            (label: 'Contact', href: '#contact', icon: null),
          ]),
          _column('Tech stack', [
            (label: 'Flutter & Dart', href: '#skills', icon: 'i i-arrow'),
            (label: 'Android (Java)', href: '#skills', icon: 'i i-arrow'),
            (label: 'Kotlin', href: '#skills', icon: 'i i-arrow'),
            (label: 'Supabase & Firebase', href: '#skills', icon: 'i i-arrow'),
          ]),
          _column('Connect', [
            (label: 'GitHub', href: _github, icon: 'i i-external'),
            (label: 'LinkedIn', href: _linkedin, icon: 'i i-external'),
            (label: _email, href: 'mailto:$_email', icon: 'i i-mail'),
            (label: 'Download CV', href: 'cv.pdf', icon: 'i i-down'),
          ]),
        ]),
        div(classes: 'footer-bottom', [
          span([.text('© 2026 Lakshan Edirisinghe — mobile application engineer')]),
          span(classes: 'mid', [
            .text('Built with '),
            span(classes: 'i i-spark', []),
            .text(' Jaspr & Dart'),
          ]),
          a(href: '#top', classes: 'to-top', [
            .text('Back to top'),
            span(classes: 'i i-up', []),
          ]),
        ]),
      ]),
    ]);
  }

  static Component _column(
    String title,
    List<({String label, String href, String? icon})> links,
  ) {
    return div(classes: 'footer-col', [
      h4([.text(title)]),
      ul([
        for (final link in links)
          li([
            a(
              href: link.href,
              attributes: link.href.startsWith('http')
                  ? const {'target': '_blank', 'rel': 'noopener'}
                  : const {},
              [
                .text(link.label),
                if (link.icon != null) span(classes: link.icon!, []),
              ],
            ),
          ]),
      ]),
    ]);
  }
}
