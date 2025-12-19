import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

class ThemeShowcasePage extends StatefulWidget {
  const ThemeShowcasePage({super.key});

  @override
  State<ThemeShowcasePage> createState() => _ThemeShowcasePageState();
}

class _ThemeShowcasePageState extends State<ThemeShowcasePage> {
  bool _useMaterial3 = true;

  @override
  Widget build(BuildContext context) {
    // Crée un ThemeData dynamique basé sur le switch M2/M3
    final themeData = ThemeData(
      useMaterial3: _useMaterial3,
      // Pour M3, on utilise un ColorScheme basé sur une "seed color"
      // Pour M2, on utilise un ColorScheme basé sur un "swatch"
      colorScheme: _useMaterial3
          ? ColorScheme.fromSeed(seedColor: Colors.green)
          : ColorScheme.fromSwatch(primarySwatch: Colors.green),
      appBarTheme: AppBarTheme(
        backgroundColor: _useMaterial3
            ? ColorScheme.fromSeed(seedColor: Colors.green).inversePrimary
            : Colors.green,
      ),
    );

    // Le widget Theme applique le ThemeData à tous ses descendants
    return Theme(
      data: themeData,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_useMaterial3 ? 'Material 3' : 'Material 2'),
          actions: [
            const Text('M2'),
            Switch(
              value: _useMaterial3,
              onChanged: (value) {
                setState(() {
                  _useMaterial3 = value;
                });
              },
            ),
            const Text('M3'),
            const SizedBox(width: 8),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(children: [
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                      'Ces widgets utilisent le thème sélectionné. Observez les changements de style !'),
                ),
              ),
              const SizedBox(height: 24),
              WidgetShowcase(
                title: 'TextField',
                widget: const TextField(
                  decoration: InputDecoration(
                    labelText: 'Champ de saisie',
                    border: OutlineInputBorder(),
                  ),
                ),
                sourceCode: '''
const TextField(
  decoration: InputDecoration(
    labelText: 'Champ de saisie',
    border: OutlineInputBorder(),
  ),
)''',
                docUrl: 'https://api.flutter.dev/flutter/material/TextField-class.html',
              ),
              WidgetShowcase(
                title: 'ElevatedButton',
                widget: ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                ),
                sourceCode: '''
ElevatedButton(
  onPressed: () {},
  child: const Text('ElevatedButton'),
)''',
                docUrl: 'https://api.flutter.dev/flutter/material/ElevatedButton-class.html',
              ),
              WidgetShowcase(
                title: 'OutlinedButton',
                widget: OutlinedButton(
                  onPressed: () {},
                  child: const Text('OutlinedButton'),
                ),
                sourceCode: '''
OutlinedButton(
  onPressed: () {},
  child: const Text('OutlinedButton'),
)''',
                docUrl: 'https://api.flutter.dev/flutter/material/OutlinedButton-class.html',
              ),
              WidgetShowcase(
                title: 'Chip',
                widget: const Chip(
                  label: Text('Chip'),
                  avatar: CircleAvatar(child: Text('A')),
                ),
                sourceCode: '''
const Chip(
  label: Text('Chip'),
  avatar: CircleAvatar(child: Text('A')),
)''',
                docUrl: 'https://api.flutter.dev/flutter/material/Chip-class.html',
              ),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Le SnackBar utilisera aussi le thème local
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('FAB cliqué ! (Thème: ${_useMaterial3 ? 'M3' : 'M2'})'),
              ),
            );
          },
          child: const Icon(Icons.add_reaction_outlined),
        ),
      ),
    );
  }
}