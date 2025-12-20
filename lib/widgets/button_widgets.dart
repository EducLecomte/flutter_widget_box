import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

class ButtonWidgetsPage extends StatelessWidget {
  const ButtonWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children:  [
          WidgetShowcase(
            title: 'ElevatedButton',
            widget: ElevatedButton(
              onPressed: () {},
              child: Text('Elevated'),
            ),
            sourceCode: '''
ElevatedButton(
  onPressed: () {},
  child: const Text('Elevated'),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
          ),
          WidgetShowcase(
            title: 'TextButton',
            widget: TextButton(
              onPressed: () {},
              child: Text('Text'),
            ),
            sourceCode: '''
TextButton(
  onPressed: () {},
  child: const Text('Text'),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/TextButton-class.html',
          ),
          WidgetShowcase(
            title: 'OutlinedButton',
            widget: OutlinedButton(
              onPressed: () {},
              child: Text('Outlined'),
            ),
            sourceCode: '''
OutlinedButton(
  onPressed: () {},
  child: const Text('Outlined'),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
          ),
          WidgetShowcase(
            title: 'IconButton',
            widget: IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            sourceCode: '''
IconButton(
  icon: const Icon(Icons.thumb_up),
  onPressed: () {},
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/IconButton-class.html',
          ),
          WidgetShowcase(
            title: 'FloatingActionButton',
            widget: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            sourceCode: '''
FloatingActionButton(
  onPressed: () {},
  child: const Icon(Icons.add),
)''',
            docUrl:
                'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
          ),
        ],
      ),
    );
  }
}