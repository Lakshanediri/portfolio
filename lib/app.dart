import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import 'components/header.dart';
import 'pages/home.dart';

/// Root component of the portfolio.
///
/// All visual styling lives in `web/styles/*.css` and is linked from the
/// document head. The getters below are intentionally empty: they only exist
/// so the generated Jaspr options stay valid for component-level styles.
class App extends StatelessComponent {
  const App({super.key});

  @override
  Component build(BuildContext context) {
    return div(classes: 'site', [
      const Header(),
      const Home(),
    ]);
  }

  @css
  static List<StyleRule> get styles => [];
}
