import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

class HeroSection extends StatelessComponent {
  const HeroSection({super.key});

  @override
  Component build(BuildContext context) {
    return section([
      h1([
        Component.text('Mobile application Engineer')
      ]),
      p([
        Component.text('Hi, I am Mobile Application Engineer.  ')
      ]),
      p([
        Component.text('I am making mobile applications Using Flutter.')
      ]),
      p([
        Component.text('I am making mobile games Using Godot.')
      ]),
      div(classes: 'button-container',[
          button(
            classes: 'btn primary',
            [Component.text("Hire ME")]
          ),
          button(
            classes: 'btn secondry',
            [Component.text("Download CV")]
          )
      ]),
      div(classes: "Image-container", [
        img(
          src: "images/Profile_pic.jpeg",
          alt: "My Profile Picture" 
        )
      ])
    ]);
  }


}
