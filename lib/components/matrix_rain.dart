import 'dart:math';

import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

/// Decorative "code rain" layer used behind the dark section band.
///
/// The columns are generated once at build time and animated with pure CSS,
/// so the effect needs no client-side JavaScript.
class MatrixRain extends StatelessComponent {
  const MatrixRain({super.key, this.extraClass});

  /// Optional layout modifier, e.g. `matrix--hero` or `matrix--footer`.
  final String? extraClass;

  static const _pool =
      'ﾊﾐﾋｰｳｼﾅﾓﾆｻﾜｦﾀｹｷｱﾂﾖﾉﾁﾗｾﾎﾃﾏﾘﾕﾙﾚｽﾒﾔｴﾝ'
      '0123456789'
      'ABCDEFGHJKLMNPQRSTUVWXYZ'
      '<>[]{}+=*/';

  @override
  Component build(BuildContext context) {
    return div(
      classes: extraClass == null ? 'matrix' : 'matrix $extraClass',
      attributes: const {'aria-hidden': 'true'},
      [
        for (final column in _columns)
          div(
            classes: 'matrix-col',
            styles: Styles(
              raw: {
                'left': '${column.left.toStringAsFixed(2)}%',
                'font-size': '${column.size.toStringAsFixed(1)}px',
                'opacity': column.opacity.toStringAsFixed(2),
                'animation-duration': '${column.duration.toStringAsFixed(1)}s',
                'animation-delay': '${column.delay.toStringAsFixed(1)}s',
              },
            ),
            [.text(column.glyphs)],
          ),
      ],
    );
  }

  static final List<_Column> _columns = _generate();

  static List<_Column> _generate() {
    final random = Random(20260221);
    const slots = 28;

    final columns = <_Column>[];

    for (var slot = 0; slot < slots; slot++) {
      final length = 12 + random.nextInt(13);
      final glyphs = StringBuffer();
      for (var i = 0; i < length; i++) {
        glyphs.write(_pool[random.nextInt(_pool.length)]);
      }

      final duration = 9 + random.nextDouble() * 9;
      final left =
          (slot + 0.5) * (100 / slots) + (random.nextDouble() - 0.5) * 1.2;

      columns.add(
        _Column(
          left: left,
          duration: duration,
          delay: -random.nextDouble() * duration,
          size: 11 + random.nextDouble() * 6,
          opacity: 0.5 + random.nextDouble() * 0.45,
          glyphs: glyphs.toString(),
        ),
      );
    }

    return columns;
  }
}

class _Column {
  const _Column({
    required this.left,
    required this.duration,
    required this.delay,
    required this.size,
    required this.opacity,
    required this.glyphs,
  });

  final double left;
  final double duration;
  final double delay;
  final double size;
  final double opacity;
  final String glyphs;
}
