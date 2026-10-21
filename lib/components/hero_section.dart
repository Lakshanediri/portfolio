import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'matrix_rain.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  static const _chips = ['Flutter', 'Dart', 'Android', 'Kotlin', 'Java', 'Supabase'];
  static const _github = 'https://github.com/Lakshanediri';

  @override
  Component build(BuildContext context) {
    return section(id: 'about', classes: 'hero', [
      const MatrixRain(extraClass: 'matrix--hero'),
      div(
        classes: 'hero-bg',
        attributes: {'aria-hidden': 'true'},
        [
          span(classes: 'glow glow-a', []),
          span(classes: 'glow glow-b', []),
          span(classes: 'grid', []),
        ],
      ),
      div(classes: 'wrap hero-grid', [
        div(classes: 'hero-copy', [
          div(classes: 'hero-kicker', [
            span(classes: 'status', [
              span(classes: 'pulse', []),
              .text('Open to new opportunities'),
            ]),
            span(classes: 'mono', [.text('Flutter · Android engineer')]),
          ]),
          h1([
            span(classes: 'line', [.text('Mobile')]),
            span(classes: 'line grad', [.text('Application')]),
            span(classes: 'line', [
              .text('Engineer'),
              span(classes: 'dot', [.text('.')]),
            ]),
          ]),
          p(classes: 'hero-lead', [
            .text(
              'Mobile application engineer focused on building reliable, '
              'user-friendly ',
            ),
            strong([.text('Android and Flutter')]),
            .text(
              ' products. Currently completing a BSc in Software Engineering at '
              'the Open University of Sri Lanka, with hands-on experience across '
              'native Android development, Supabase-backed apps and '
              'sensor-driven features.',
            ),
          ]),
          div(classes: 'hero-stats', [
            _stat(value: '03', unit: '', label: 'Projects in build'),
            _stat(value: '05', unit: '+', label: 'Languages used'),
            _stat(value: '2028', unit: '', label: 'BSc SE expected'),
          ]),
          div(classes: 'hero-actions', [
            a(href: '#projects', classes: 'btn btn-primary', [
              .text('View projects'),
              span(classes: 'i i-arrow', []),
            ]),
            a(
              href: 'cv.pdf',
              classes: 'btn btn-ghost',
              attributes: {'download': ''},
              [
                .text('Download CV'),
                span(classes: 'i i-down', []),
              ],
            ),
            a(href: '#contact', classes: 'btn btn-quiet', [
              .text('Contact'),
              span(classes: 'i i-arrow', []),
            ]),
          ]),
          div(classes: 'hero-stack', [
            span(classes: 'label', [.text('Stack')]),
            for (final chip in _chips) span(classes: 'chip', [.text(chip)]),
          ]),
        ]),
        _buildVisual(),
      ]),
    ]);
  }

  static Component _stat({
    required String value,
    required String unit,
    required String label,
  }) {
    return div(classes: 'stat', [
      span(classes: 'stat-num', [
        .text(value),
        em([.text(unit)]),
      ]),
      span(classes: 'stat-label', [.text(label)]),
    ]);
  }

  static Component _buildVisual() {
    return div(classes: 'hero-visual', [
      span(classes: 'visual-ring', attributes: {'aria-hidden': 'true'}, const []),
      div(classes: 'phone', [
        div(classes: 'phone-screen', [
          div(classes: 'phone-statusbar', [
            span([.text('9:41')]),
            span(classes: 'island', []),
            span(classes: 'bars', [
              for (var i = 0; i < 4; i++) span([]),
            ]),
          ]),
          div(classes: 'app-viewport', [
            _buildHome(),
            _buildDetail(
              id: 'procut',
              icon: 'i-clock',
              eyebrow: 'Android · Java · University',
              title: 'ProCutNation',
              summary:
                  'A native Android productivity app that turns deep work into a '
                  'game — Pomodoro timers, light-sensor nudges and quiet study '
                  'spots nearby.',
              points: const [
                'Pomodoro timer that pauses when a notification arrives or the phone is picked up',
                'XP, levels and a dino-pet store to keep the streak alive',
                'Google Maps to surface quiet study spots nearby',
              ],
              stack: const ['Java', 'Android', 'Sensors', 'Maps'],
              arch: const ['Android UI', 'Sensors', 'Local store'],
              link: _github,
            ),
            _buildDetail(
              id: 'pitch',
              icon: 'i-chart',
              eyebrow: 'Flutter · Supabase · Building',
              title: 'Pitch Finder',
              summary:
                  'A cross-platform app for finding pitches nearby, with '
                  'real-time listings on Supabase and a clean Material 3 '
                  'interface.',
              points: const [
                'Supabase auth and real-time data with offline-friendly reads',
                'Location-aware listings sorted by distance with an H3 grid',
                'Material 3 interface built end-to-end in Flutter',
              ],
              stack: const ['Flutter', 'Dart', 'Supabase', 'H3'],
              arch: const ['Flutter', 'Supabase', 'Postgres'],
              link: _github,
            ),
            _buildDetail(
              id: 'chess',
              icon: 'i-star',
              eyebrow: 'Godot · GDScript · Building',
              title: 'Chess Night',
              summary:
                  'A real-time multiplayer chess game built with the Godot '
                  'engine — board logic, turn sync and matchmaking practice.',
              points: const [
                'Board rules and move validation written in GDScript',
                'Real-time multiplayer turn sync between two players',
                'Practice project for game state, UI and networking',
              ],
              stack: const ['Godot', 'GDScript', 'Multiplayer'],
              arch: const ['Godot', 'ENet', 'Match server'],
              link: _github,
            ),
          ]),
          span(classes: 'phone-homebar', attributes: {'aria-hidden': 'true'}, const []),
        ]),
      ]),
      div(classes: 'float-card float-edu', [
        span(classes: 'fc-label', [
          span(classes: 'i i-layers', []),
          .text('Education'),
        ]),
        span(classes: 'fc-value', [
          .text('BSc SE '),
          small([.text('@ OUSL')]),
        ]),
        span(classes: 'row', [
          span(classes: 'i i-check', []),
          .text('Software Engineering'),
        ]),
        span(classes: 'row', [
          span(classes: 'i i-check', []),
          .text('2022 — 2028'),
        ]),
      ]),
      div(classes: 'float-card float-live', [
        span(classes: 'fc-label', [
          span(classes: 'i i-bolt', []),
          .text('Now building'),
        ]),
        span(classes: 'row', [
          span(classes: 'i i-check', []),
          .text('Pitch Finder · Flutter'),
        ]),
        span(classes: 'row', [
          span(classes: 'i i-check', []),
          .text('Supabase auth & data'),
        ]),
      ]),
      div(classes: 'float-card float-metric', [
        span(classes: 'fc-label', [.text('ProCutNation')]),
        span(classes: 'fc-value', [
          .text('25 '),
          small([.text('MIN FOCUS')]),
        ]),
        span(
          classes: 'bars',
          attributes: {'aria-hidden': 'true'},
          [
            for (var i = 0; i < 6; i++) span([]),
          ],
        ),
      ]),
    ]);
  }

  // ---------------------------------------------------------------- app UI

  static Component _buildHome() {
    return div(classes: 'app-home', [
      div(classes: 'home-head', [
        img(
          src: 'images/profile.jpg',
          alt: 'Lakshan Edirisinghe working on a mobile app',
          classes: 'home-photo',
        ),
        span(classes: 'home-shade', attributes: {'aria-hidden': 'true'}, const []),
        div(classes: 'home-head-copy', [
          span(classes: 'home-status', [
            span(classes: 'pulse', []),
            .text('Open to work'),
          ]),
          strong([.text('Lakshan Edirisinghe')]),
          span(classes: 'home-role', [.text('Mobile application engineer')]),
        ]),
      ]),
      div(classes: 'home-body', [
        div(classes: 'home-stats', [
          _appStat('03', 'Projects'),
          _appStat('05', 'Stacks'),
          _appStat('2028', 'BSc SE'),
        ]),
        div(classes: 'home-block', [
          div(classes: 'home-label', [
            span([.text('Projects')]),
            span(classes: 'home-label-hint', [.text('Tap to open')]),
          ]),
          _projectRow('procut', 'ProCutNation', 'Android · Java', 'i-clock'),
          _projectRow('pitch', 'Pitch Finder', 'Flutter · Supabase', 'i-chart'),
          _projectRow('chess', 'Chess Night', 'Godot · GDScript', 'i-star'),
        ]),
        div(classes: 'home-block', [
          div(classes: 'home-label', [
            span([.text('Now building')]),
          ]),
          div(classes: 'home-card', [
            span(classes: 'home-card-icon', [span(classes: 'i i-bolt', [])]),
            div(classes: 'home-card-copy', [
              strong([.text('Pitch Finder')]),
              span([
                .text(
                  'Real-time pitch listings on Supabase — auth, data and '
                  'offline-friendly reads.',
                ),
              ]),
            ]),
          ]),
        ]),
        div(classes: 'home-block', [
          div(classes: 'home-label', [
            span([.text('Stack')]),
          ]),
          div(classes: 'home-chips', [
            for (final chip in const ['Flutter', 'Dart', 'Kotlin', 'Java', 'Supabase'])
              span(classes: 'home-chip', [.text(chip)]),
          ]),
        ]),
        div(classes: 'home-block', [
          div(classes: 'home-label', [
            span([.text('Education')]),
          ]),
          div(classes: 'home-card', [
            span(classes: 'home-card-icon', [span(classes: 'i i-layers', [])]),
            div(classes: 'home-card-copy', [
              strong([.text('BSc Software Engineering')]),
              span([.text('Open University of Sri Lanka · 2022 — 2028')]),
            ]),
          ]),
        ]),
        div(classes: 'home-actions', [
          a(
            href: _github,
            classes: 'home-btn',
            attributes: const {'target': '_blank', 'rel': 'noopener'},
            [span(classes: 'i i-code', []), .text('GitHub')],
          ),
          a(href: '#contact', classes: 'home-btn home-btn-ghost', [
            span(classes: 'i i-mail', []),
            .text('Message'),
          ]),
        ]),
        div(classes: 'home-note', [.text('Scroll inside · tap a project')]),
      ]),
    ]);
  }

  static Component _appStat(String value, String label) {
    return div(classes: 'home-stat', [
      b([.text(value)]),
      span([.text(label)]),
    ]);
  }

  static Component _projectRow(String id, String name, String meta, String icon) {
    return button(
      type: ButtonType.button,
      classes: 'app-project',
      attributes: {'data-project': id, 'aria-label': 'Open $name'},
      [
        span(classes: 'ap-art ap-art--$id', [
          span(classes: 'i $icon', []),
        ]),
        span(classes: 'ap-info', [
          strong([.text(name)]),
          span([.text(meta)]),
        ]),
        span(
          classes: 'ap-go',
          attributes: {'aria-hidden': 'true'},
          [
            span(classes: 'i i-arrow', []),
          ],
        ),
      ],
    );
  }

  static Component _buildDetail({
    required String id,
    required String icon,
    required String eyebrow,
    required String title,
    required String summary,
    required List<String> points,
    required List<String> stack,
    required List<String> arch,
    required String link,
  }) {
    return div(
      classes: 'app-detail',
      attributes: {'data-project': id, 'aria-hidden': 'true', 'tabindex': '-1'},
      [
        div(classes: 'detail-scroll', [
          div(classes: 'detail-banner ap-art ap-art--$id', [
            span(classes: 'i $icon', []),
          ]),
          div(classes: 'detail-body', [
            span(classes: 'detail-eyebrow', [.text(eyebrow)]),
            h3([.text(title)]),
            p(classes: 'detail-summary', [.text(summary)]),
            div(classes: 'detail-points', [
              for (final point in points)
                span(classes: 'detail-point', [
                  span(classes: 'i i-check', []),
                  .text(point),
                ]),
            ]),
            div(classes: 'detail-label', [.text('Stack')]),
            div(classes: 'detail-chips', [
              for (final item in stack) span(classes: 'detail-chip', [.text(item)]),
            ]),
            div(classes: 'detail-label', [.text('Architecture')]),
            div(classes: 'detail-arch', [
              for (var i = 0; i < arch.length; i++) ...[
                if (i > 0) span(classes: 'arch-arrow', [.text('→')]),
                span(classes: 'arch-node', [.text(arch[i])]),
              ],
            ]),
            a(
              href: link,
              classes: 'detail-link',
              attributes: const {'target': '_blank', 'rel': 'noopener'},
              [.text('View on GitHub'), span(classes: 'i i-external', [])],
            ),
          ]),
        ]),
        button(
          type: ButtonType.button,
          classes: 'detail-back',
          attributes: {'aria-label': 'Back to profile'},
          [span(classes: 'i i-up', [])],
        ),
      ],
    );
  }
}
