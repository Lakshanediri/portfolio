import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class StacksSection extends StatelessComponent {
  const StacksSection({super.key});

  static const _stacks = [
    _Stack(
      icon: 'i-phone',
      title: 'Core mobile',
      subtitle: 'Flutter & Android',
      rows: [
        ('Flutter & Dart', 'Building'),
        ('Android (Java)', 'Native'),
        ('Kotlin', 'Learning'),
        ('Sensors & Maps', 'Used'),
        ('Timers & gamification', 'Shipped'),
      ],
      foot: 'Flutter · Dart · Java · Kotlin',
    ),
    _Stack(
      icon: 'i-cloud',
      title: 'Backend & data',
      subtitle: 'Supabase & Firebase',
      rows: [
        ('Supabase', 'Auth + DB'),
        ('Firebase Auth', 'Auth'),
        ('MySQL', 'Coursework'),
        ('REST & JSON', 'APIs'),
        ('Realtime state', 'Multiplayer'),
      ],
      foot: 'Supabase · Firebase · MySQL',
    ),
    _Stack(
      icon: 'i-code',
      title: 'Web & tooling',
      subtitle: 'Frontend & workflow',
      rows: [
        ('React & Vue', 'Frontend'),
        ('HTML · CSS · JS/TS', 'Frontend'),
        ('Tailwind & Bootstrap', 'UI'),
        ('Git & GitHub', 'Daily'),
        ('Postman & Figma', 'Workflow'),
      ],
      foot: 'React · Vue · Tailwind',
    ),
    _Stack(
      icon: 'i-layers',
      title: 'Foundations',
      subtitle: 'CS & security',
      rows: [
        ('Data structures & algorithms', 'Practising'),
        ('Object-oriented design', 'Solid'),
        ('Version control workflows', 'Daily'),
        ('Cyber security basics', 'Learning'),
        ('LeetCode & HackerRank', 'Practice'),
      ],
      foot: 'DSA · OOP · Git · Security',
    ),
  ];

  @override
  Component build(BuildContext context) {
    return section(id: 'skills', classes: 'section stacks', [
      div(classes: 'wrap', [
        div(classes: 'section-head', [
          div([
            p(classes: 'eyebrow', [.text('Architecture & capabilities')]),
            h2([
              .text('Interactive '),
              em([.text('engineering')]),
              .text(' stacks'),
            ]),
          ]),
          p(classes: 'section-note', [
            .text('Flutter · Android · Supabase'),
            br(),
            .text('Git workflows · CS fundamentals'),
          ]),
        ]),
        div(classes: 'stack-grid', [
          for (var i = 0; i < _stacks.length; i++) _stackCard(_stacks[i], i + 1),
        ]),
        div(classes: 'tool-strip', [
          div(classes: 'dots', [
            for (final tool in ['Flutter 3.x', 'Dart 3.x', 'Java · Kotlin', 'Supabase', 'Godot 4'])
              span([.text(tool)]),
          ]),
          span([.text('Open to Flutter / Android roles')]),
        ]),
      ]),
    ]);
  }

  static Component _stackCard(_Stack stack, int index) {
    return article(classes: 'stack-card', [
      div(classes: 'stack-top', [
        span(classes: 'stack-icon', [span(classes: 'i ${stack.icon}', [])]),
        span(classes: 'stack-idx', [.text('STACK / ${index.toString().padLeft(2, '0')}')]),
      ]),
      h3([
        .text(stack.title),
        span([.text(stack.subtitle)]),
      ]),
      ul(classes: 'stack-list', [
        for (final row in stack.rows)
          li([
            .text(row.$1),
            span(classes: 'tag', [.text(row.$2)]),
          ]),
      ]),
      p(classes: 'stack-foot', [.text(stack.foot)]),
    ]);
  }
}

class _Stack {
  const _Stack({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.rows,
    required this.foot,
  });

  final String icon;
  final String title;
  final String subtitle;
  final List<(String, String)> rows;
  final String foot;
}
