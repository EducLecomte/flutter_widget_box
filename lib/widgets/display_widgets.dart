import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

class DisplayWidgetsPage extends StatelessWidget {
  const DisplayWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Widgets'),
        actions: const [ThemeSwitchButton()],
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
            WidgetShowcase(
              title: 'Tooltip',
              widget: Tooltip(
                message: 'Ceci est une info-bulle',
                child: ElevatedButton(onPressed: null, child: const Text('Survolez pour voir')),
              ),
              sourceCode: '''
Tooltip(
  message: 'Info-bulle',
  child: Widget(),
)''',
              docUrl: 'https://api.flutter.dev/flutter/material/Tooltip-class.html',
            ),
            WidgetShowcase(
              title: 'Badge',
              widget: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Badge(label: Text('3'), child: Icon(Icons.notifications, size: 30)),
                  Badge(child: Icon(Icons.shopping_cart, size: 30)),
                ],
              ),
              sourceCode: '''
Badge(
  label: Text('3'),
  child: Icon(Icons.notifications),
)''',
              docUrl: 'https://api.flutter.dev/flutter/material/Badge-class.html',
            ),
            WidgetShowcase(
              title: 'ClipRRect (Arrondi)',
              widget: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  color: Colors.orange,
                  width: 100,
                  height: 100,
                  child: const Center(child: Text('Arrondi', style: TextStyle(color: Colors.white))),
                ),
              ),
              sourceCode: '''
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Container(color: Colors.orange),
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/ClipRRect-class.html',
            ),
            WidgetShowcase(
              title: 'Transform (Rotation)',
              widget: Transform.rotate(
                angle: -0.2,
                child: Container(
                  color: Colors.purple,
                  padding: const EdgeInsets.all(16),
                  child: const Text('Rotation', style: TextStyle(color: Colors.white)),
                ),
              ),
              sourceCode: '''
Transform.rotate(
  angle: -0.2,
  child: Container(...),
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/Transform-class.html',
            ),
            WidgetShowcase(
              title: 'RichText',
              widget: RichText(
                text: TextSpan(
                  text: 'Vous pouvez mélanger ',
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(text: 'gras', style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(text: ', '),
                    TextSpan(text: 'italique', style: TextStyle(fontStyle: FontStyle.italic)),
                    TextSpan(text: ' et '),
                    TextSpan(text: 'couleur', style: TextStyle(color: Colors.blue)),
                    TextSpan(text: ' !'),
                  ],
                ),
              ),
              sourceCode: '''
RichText(
  text: TextSpan(
    text: 'Base ',
    style: DefaultTextStyle.of(context).style,
    children: const <TextSpan>[
      TextSpan(text: 'Gras', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
)''',
              docUrl: 'https://api.flutter.dev/flutter/widgets/RichText-class.html',
            ),
          ],
        ),
      ),
    );
  }
}