import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

class DisplayWidgetsPage extends StatelessWidget {
  const DisplayWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetShowcase(
              title: 'Text (Simple)',
              widget: Text(
                'Ceci est un widget Text simple.',
                style: TextStyle(fontSize: 16),
              ),
              sourceCode: '''
const Text(
  'Ceci est un widget Text simple.',
  style: TextStyle(fontSize: 16),
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
            ),
            WidgetShowcase(
              title: 'Text (Stylisé)',
              widget: Text(
                'Texte stylisé',
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              sourceCode: '''
Text(
  'Texte stylisé',
  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/Text-class.html',
            ),
            WidgetShowcase(
              title: 'Icon',
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.home, size: 40, color: Colors.blue),
                  Icon(Icons.settings, size: 40, color: Colors.grey),
                  Icon(Icons.favorite, size: 40, color: Colors.red),
                ],
              ),
              sourceCode: '''
const Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.home, size: 40, color: Colors.blue),
    Icon(Icons.settings, size: 40, color: Colors.grey),
    Icon(Icons.favorite, size: 40, color: Colors.red),
  ],
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/Icon-class.html',
            ),
            WidgetShowcase(
              title: 'Image.network',
              widget: Center(
                child: Image.network(
                  'https://www.pedagogeek.fr/img/sunpx.jpg',
                  height: 100,
                ),
              ),
              sourceCode: '''
Image.network(
  'https://www.pedagogeek.fr/img/sunpx.jpg',
  height: 100,
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
            ),
            WidgetShowcase(
              title: 'Image.asset',
              widget: Center(child: Image.asset('assets/images/flutter_logo.png', height: 100)),
              sourceCode: '''
Image.asset('assets/images/flutter_logo.png', height: 100)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/Image-class.html',
            ),
            WidgetShowcase(
              title: 'Progress Indicators',
              widget: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 100, child: LinearProgressIndicator()),
                ],
              ),
              sourceCode: '''
const Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    CircularProgressIndicator(),
    SizedBox(width: 100, child: LinearProgressIndicator()),
  ],
)''',
              docUrl: 'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
            ),
          ],
        ),
      ),
    );
  }
}