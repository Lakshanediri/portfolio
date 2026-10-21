import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/contact_section.dart';
import '../components/experience_section.dart';
import '../components/hero_section.dart';
import '../components/matrix_rain.dart';
import '../components/projects_section.dart';
import '../components/site_footer.dart';
import '../components/stacks_section.dart';

class Home extends StatelessComponent {
  const Home({super.key});

  @override
  Component build(BuildContext context) {
    return Component.fragment([
      main_(id: 'top', [
        const HeroSection(),
        const StacksSection(),
        div(classes: 'dark-zone', [
          const MatrixRain(extraClass: 'matrix--band'),
          const ProjectsSection(),
          const ExperienceSection(),
          const ContactSection(),
        ]),
      ]),
      const SiteFooter(),
    ]);
  }
}
