import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

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
        children: [
          WidgetShowcase(
            data: WidgetData(
              title: 'ElevatedButton',
              widget: ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated Button'),
              ),
              sourceCode: '''
ElevatedButton(
  onPressed: () {},
  child: const Text('Elevated Button'),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
              description:
                  'Un bouton avec une élévation (ombre) et une couleur de fond. '
                  'C\'est le bouton standard pour les actions principales.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'TextButton',
              widget: TextButton(
                onPressed: () {},
                child: const Text('Text Button'),
              ),
              sourceCode: '''
TextButton(
  onPressed: () {},
  child: const Text('Text Button'),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/TextButton-class.html',
              description:
                  'Un bouton sans bordure ni élévation. '
                  'Utilisé pour les actions moins importantes ou dans les boîtes de dialogue.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'OutlinedButton',
              widget: OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined Button'),
              ),
              sourceCode: '''
OutlinedButton(
  onPressed: () {},
  child: const Text('Outlined Button'),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
              description:
                  'Un bouton avec une bordure mais sans fond rempli. '
                  'Intermédiaire entre TextButton et ElevatedButton.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/IconButton-class.html',
              description:
                  'Un bouton affichant uniquement une icône. '
                  'Compact, idéal pour les barres d\'outils.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              description:
                  'Le bouton d\'action principal (FAB). '
                  'Il flotte au-dessus du contenu pour encourager l\'action principale de l\'écran.',
            ),
          ),
        ],
      ),
    );
  }
}
