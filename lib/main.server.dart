/// The entrypoint for the **server** environment.
///
/// The [main] method will only be executed on the server during pre-rendering.
/// To run code on the client, check the `main.client.dart` file.
library;

import 'package:jaspr/dom.dart';
// Server-specific Jaspr import.
import 'package:jaspr/server.dart';

// Imports the [App] component.
import 'app.dart';

// This file is generated automatically by Jaspr, do not remove or edit.
import 'main.server.options.dart';

void main() {
  // Initializes the server environment with the generated default options.
  Jaspr.initializeApp(options: defaultServerOptions);

  // Starts the app.
  runApp(
    Document(
      title: 'Lakshan Edirisinghe — Mobile Application Engineer',
      lang: 'en',
      viewport: 'width=device-width, initial-scale=1',
      meta: {
        'description':
            'Mobile application engineer building reliable Android and Flutter products with Java, Kotlin, Dart and Supabase. Software engineering undergraduate at the Open University of Sri Lanka.',
        'theme-color': '#eef1f7',
      },
      head: [
        link(rel: 'preconnect', href: 'https://fonts.googleapis.com'),
        link(
          rel: 'preconnect',
          href: 'https://fonts.gstatic.com',
          attributes: {'crossorigin': ''},
        ),
        link(
          rel: 'stylesheet',
          href:
              'https://fonts.googleapis.com/css2?family=Sora:wght@300;400;500;600;700&family=JetBrains+Mono:wght@400;500;600&display=swap',
        ),
        link(rel: 'stylesheet', href: 'styles/main.css'),
        link(rel: 'icon', href: 'images/favicon.svg', type: 'image/svg+xml'),
        link(rel: 'alternate icon', href: 'favicon.ico'),
        script(src: 'js/phone-app.js', defer: true),
      ],
      body: const App(),
    ),
  );
}
