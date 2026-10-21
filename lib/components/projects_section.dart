import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class ProjectsSection extends StatelessComponent {
  const ProjectsSection({super.key});

  static const _github = 'https://github.com/Lakshanediri';

  @override
  Component build(BuildContext context) {
    return section(id: 'projects', classes: 'section projects', [
      div(classes: 'wrap', [
        div(classes: 'section-head', [
          div([
            p(classes: 'eyebrow', [
              span(classes: 'idx', [.text('02')]),
              .text(' / Selected projects'),
            ]),
            h2([
              .text('Featured '),
              em([.text('mobile')]),
              .text(' projects'),
            ]),
          ]),
          span(classes: 'verified-pill', [
            span(classes: 'i i-check', []),
            .text('Academic builds & work in progress'),
          ]),
        ]),
        div(classes: 'feature-grid', [
          _procutCard(),
          _pitchFinderCard(),
        ]),
        div(classes: 'compact-grid', [
          for (final project in _compactProjects) _compactCard(project),
        ]),
      ]),
    ]);
  }

  static Component _procutCard() {
    return article(classes: 'feature', [
      _featureTop(
        icon: 'i-clock',
        title: 'ProCutNation',
        subtitle: 'Android focus & productivity app',
        badges: const [('Java', false), ('Android', false), ('University', true)],
      ),
      div(classes: 'app-preview', [
        span(classes: 'scan', attributes: {'aria-hidden': 'true'}, const []),
        span(classes: 'preview-tag', [.text('ProCutNation · focus')]),
        span(classes: 'preview-status', [.text('Timer on')]),
        div(classes: 'vault', attributes: {'aria-hidden': 'true'}, [
          span(classes: 'ring r1', []),
          span(classes: 'ring r2', []),
          span(classes: 'ring r3', []),
          span(classes: 'core', [span(classes: 'i i-clock', [])]),
          span(classes: 'keychip a', [
            span(classes: 'i i-check', []),
            .text('Light sensor'),
          ]),
          span(classes: 'keychip b', [.text('XP · Levels')]),
        ]),
      ]),
      p(classes: 'feature-copy', [
        .text('A native Android app that helps students beat procrastination: a '),
        strong([.text('Pomodoro timer')]),
        .text(
          ' that pauses when a notification arrives or the phone is picked up, '
          'a light-sensor nudge, and XP, levels and a dino-pet store to keep '
          'the streak alive. Google Maps surfaces quiet study spots nearby.',
        ),
      ]),
      div(classes: 'metrics', [
        _metric('25 min', 'Focus blocks'),
        _metric('05', 'Sensor & Maps features'),
        _metric('XP', 'Levels & rewards'),
      ]),
      _featureFoot(
        tags: const ['Java', 'Android', 'Sensors', 'Google Maps'],
      ),
    ]);
  }

  static Component _pitchFinderCard() {
    return article(classes: 'feature', [
      _featureTop(
        icon: 'i-bolt',
        iconClass: 'app-icon violet',
        title: 'Pitch Finder',
        subtitle: 'Cross-platform app · Supabase backend',
        badges: const [('Flutter', false), ('Supabase', false), ('In progress', true)],
      ),
      div(classes: 'app-preview', [
        span(classes: 'scan', attributes: {'aria-hidden': 'true'}, const []),
        span(classes: 'preview-tag', [.text('Pitch Finder · live')]),
        span(classes: 'preview-status', [.text('In sync')]),
        div(classes: 'wallet', attributes: {'aria-hidden': 'true'}, [
          div(classes: 'wallet-card', [
            div(classes: 'wc-label', [.text('Matches this week')]),
            div(classes: 'wc-balance', [.text('06')]),
            div(classes: 'wc-row', [
              span([.text('Colombo · 2.4 km')]),
              span(classes: 'wc-chip', []),
            ]),
          ]),
          div(classes: 'wallet-spark', [
            for (var i = 0; i < 6; i++) span([]),
          ]),
          span(classes: 'cash-pill', [
            span(classes: 'i i-check', []),
            .text('Supabase live'),
          ]),
        ]),
      ]),
      p(classes: 'feature-copy', [
        .text('A cross-platform Flutter app with '),
        strong([.text('Supabase handling auth and data')]),
        .text(
          '. Real-time listings, a clean Material 3 interface and offline-friendly '
          'reads, with the app built end-to-end as I learn Flutter.',
        ),
      ]),
      div(classes: 'metrics', [
        _metric('Flutter', 'Cross-platform UI'),
        _metric('Supabase', 'Auth + database'),
        _metric('M3', 'Material 3 design'),
      ]),
      _featureFoot(
        tags: const ['Flutter', 'Dart', 'Supabase', 'Material 3'],
      ),
    ]);
  }

  static Component _featureTop({
    required String icon,
    required String title,
    required String subtitle,
    required List<(String, bool)> badges,
    String iconClass = 'app-icon',
  }) {
    return div(classes: 'feature-top', [
      span(classes: iconClass, [span(classes: 'i $icon', [])]),
      div(classes: 'feature-id', [
        h3([.text(title)]),
        p([.text(subtitle)]),
      ]),
      div(classes: 'feature-badges', [
        for (final badge in badges)
          span(classes: badge.$2 ? 'badge live' : 'badge', [.text(badge.$1)]),
      ]),
    ]);
  }

  static Component _metric(String value, String label) {
    return div(classes: 'metric', [
      b([.text(value)]),
      span([.text(label)]),
    ]);
  }

  static Component _featureFoot({required List<String> tags}) {
    return div(classes: 'feature-foot', [
      div(classes: 'tag-row', [
        for (final tag in tags) span(classes: 'tag', [.text(tag)]),
      ]),
      div(classes: 'store-row', [
        a(
          href: _github,
          classes: 'store',
          attributes: const {'target': '_blank', 'rel': 'noopener'},
          [
            span(classes: 'i i-code', []),
            .text('GitHub'),
          ],
        ),
        a(href: 'cv.pdf', classes: 'store', attributes: {'download': ''}, [
          span(classes: 'i i-down', []),
          .text('CV'),
        ]),
      ]),
    ]);
  }

  static Component _compactCard(_CompactProject project) {
    final content = [
      div(classes: 'compact-top', [
        span(classes: 'compact-icon', [span(classes: 'i ${project.icon}', [])]),
        h4([.text(project.title)]),
        if (project.href != null) span(classes: 'compact-arrow i i-arrow', []),
      ]),
      p([.text(project.description)]),
      div(classes: 'tag-row', [
        for (final tag in project.tags) span(classes: 'tag', [.text(tag)]),
      ]),
    ];

    if (project.href == null) return div(classes: 'compact', content);
    return a(
      href: project.href!,
      classes: 'compact',
      attributes: const {'target': '_blank', 'rel': 'noopener'},
      content,
    );
  }

  static const _compactProjects = [
    _CompactProject(
      icon: 'i-users',
      title: 'Chess Night',
      description:
          'A collaborative chess game in Godot Engine with real-time multiplayer and synchronised game state.',
      tags: ['Godot', 'GDScript', 'Multiplayer'],
      href: _github,
    ),
    _CompactProject(
      icon: 'i-code',
      title: 'Portfolio Website',
      description:
          'This site — a fully static Jaspr build with a pure-CSS theme switch and no client JavaScript required.',
      tags: ['Jaspr', 'Dart', 'CSS'],
      href: _github,
    ),
    _CompactProject(
      icon: 'i-terminal',
      title: 'LeetCode & HackerRank',
      description:
          'Practising data structures and algorithms in Java and Python, one problem at a time.',
      tags: ['DSA', 'Java', 'Python'],
    ),
    _CompactProject(
      icon: 'i-spark',
      title: 'YouTube Dev Logs',
      description:
          'Sharing mobile builds, experiments and what I learn while studying software engineering.',
      tags: ['Video', 'Dev logs'],
    ),
  ];
}

class _CompactProject {
  const _CompactProject({
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
    this.href,
  });

  final String icon;
  final String title;
  final String description;
  final List<String> tags;
  final String? href;
}
