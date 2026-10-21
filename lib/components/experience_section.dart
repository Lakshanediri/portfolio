import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ExperienceSection extends StatelessComponent {
  const ExperienceSection({super.key});

  @override
  Component build(BuildContext context) {
    return section(id: 'experience', classes: 'section experience', [
      div(classes: 'wrap', [
        div(classes: 'section-head', [
          div([
            p(classes: 'eyebrow', [
              span(classes: 'idx', [.text('03')]),
              .text(' / Education & hands-on work'),
            ]),
            h2([
              .text('Education & '),
              em([.text('project')]),
              .text(' experience'),
            ]),
          ]),
          span(classes: 'xp-meta-badge', [
            span(classes: 'i i-layers', []),
            .text('OUSL · 2022 — 2028'),
          ]),
        ]),
        div(classes: 'timeline', [
          _entry(
            period: '2024 — Present',
            role: 'Independent Mobile Developer',
            company: 'Self-directed projects',
            place: 'Sri Lanka — remote',
            bullets: [
              [
                .text('Built '),
                strong([.text('ProCutNation')]),
                .text(
                  ', a native Android app in Java with a Pomodoro focus timer, '
                  'light-sensor nudges, XP and levels, a dino-pet store and '
                  'Google Maps study spots.',
                ),
              ],
              [
                .text('Building '),
                strong([.text('Pitch Finder')]),
                .text(
                  ', a cross-platform Flutter app using Supabase for both '
                  'authentication and data.',
                ),
              ],
              [
                .text('Building '),
                strong([.text('Chess Night')]),
                .text(
                  ', a real-time multiplayer chess game with Godot Engine and '
                  'GDScript.',
                ),
              ],
            ],
            tags: const ['Java', 'Flutter', 'Supabase', 'Godot', 'Git'],
          ),
          _entry(
            period: '2022 — 2028 (expected)',
            role: 'BSc Software Engineering',
            company: 'Open University of Sri Lanka',
            place: 'Sri Lanka · Undergraduate',
            bullets: [
              [
                .text(
                  'Coursework across data structures and algorithms, '
                  'object-oriented programming, databases and software '
                  'engineering practice.',
                ),
              ],
              [
                .text(
                  'Practising problem solving on LeetCode and HackerRank, and '
                  'contributing to open-source and collaborative projects.',
                ),
              ],
              [
                .text(
                  'Strong foundation in version-control workflows with Git and '
                  'GitHub, with a growing interest in cyber security.',
                ),
              ],
            ],
            tags: const ['DSA', 'OOP', 'MySQL', 'Git', 'Cyber security'],
          ),
        ]),
        div(classes: 'kpi-strip', [
          _kpi('03', '', 'Projects in build'),
          _kpi('01', '', 'Native Android app'),
          _kpi('05', '+', 'Languages written'),
          _kpi('2028', '', 'BSc SE expected'),
        ]),
      ]),
    ]);
  }

  static Component _entry({
    required String period,
    required String role,
    required String company,
    required String place,
    required List<List<Component>> bullets,
    required List<String> tags,
  }) {
    return article(classes: 'xp', [
      span(classes: 'xp-dot', attributes: {'aria-hidden': 'true'}, const []),
      div(classes: 'xp-meta', [
        span(classes: 'xp-period', [.text(period)]),
        h3([.text(role)]),
        p(classes: 'xp-company', [.text(company)]),
        span(classes: 'xp-place', [
          span(classes: 'i i-pin', []),
          .text(place),
        ]),
      ]),
      div(classes: 'xp-body', [
        ul([
          for (final bullet in bullets) li(bullet),
        ]),
        div(classes: 'tag-row', [
          for (final tag in tags) span(classes: 'tag', [.text(tag)]),
        ]),
      ]),
    ]);
  }

  static Component _kpi(String value, String unit, String label) {
    return div(classes: 'kpi', [
      b([
        .text(value),
        if (unit.isNotEmpty) em([.text(unit)]),
      ]),
      span([.text(label)]),
    ]);
  }
}
