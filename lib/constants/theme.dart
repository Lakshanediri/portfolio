import 'package:jaspr/dom.dart';

/// Brand accent shared by Dart-rendered components.
const primaryColor = Color('#0FB9A0');

/// Global styling for this project lives in `web/styles/*.css` and is linked
/// from the document head, so no component-level style rules are needed.
///
/// This getter is kept so the generated Jaspr options stay valid.
@css
List<StyleRule> get styles => [];
