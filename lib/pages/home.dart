import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/hero_section.dart';

class Home extends StatelessComponent {
  const Home({super.key});


  @override
  Component build(BuildContext context) {
    return section([
      const HeroSection()
    ]);
  }
}
