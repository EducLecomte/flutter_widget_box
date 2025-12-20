import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

class InputWidgetsPage extends StatefulWidget {
  const InputWidgetsPage({super.key});

  @override
  State<InputWidgetsPage> createState() => _InputWidgetsPageState();
}

class _InputWidgetsPageState extends State<InputWidgetsPage> {
  bool _isChecked = false;
  String? _radioValue = 'option1';
  bool _switchValue = false;
  double _sliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input & Selection Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetShowcase(
            title: 'TextField',
            widget: const TextField(
              decoration: InputDecoration(
                labelText: 'Entrez du texte',
                hintText: 'Placeholder',
                border: OutlineInputBorder(),
              ),
            ),
            sourceCode: '''
const TextField(
  decoration: InputDecoration(
    labelText: 'Entrez du texte',
    hintText: 'Placeholder',
    border: OutlineInputBorder(),
  ),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/TextField-class.html',
          ),
          WidgetShowcase(
            title: 'CheckboxListTile',
            widget: CheckboxListTile(
              title: const Text('Cochez-moi'),
              value: _isChecked,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked = value ?? false;
                });
              },
            ),
            sourceCode: '''
CheckboxListTile(
  title: const Text('Cochez-moi'),
  value: _isChecked,
  onChanged: (bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  },
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/CheckboxListTile-class.html',
          ),
          WidgetShowcase(
            title: 'RadioListTile',
            widget: Column(
              children: [
                RadioListTile<String>(
                  title: const Text('Option 1'),
                  value: 'option1',
                  groupValue: _radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text('Option 2'),
                  value: 'option2',
                  groupValue: _radioValue,
                  onChanged: (String? value) {
                    setState(() {
                      _radioValue = value;
                    });
                  },
                ),
              ],
            ),
            sourceCode: '''
RadioListTile<String>(
  title: const Text('Option 1'),
  value: 'option1',
  groupValue: _radioValue,
  onChanged: (String? value) {
    setState(() {
      _radioValue = value;
    });
  },
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/RadioListTile-class.html',
          ),
          WidgetShowcase(
            title: 'SwitchListTile',
            widget: SwitchListTile(
              title: const Text('Activer/Désactiver'),
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            sourceCode: '''
SwitchListTile(
  title: const Text('Activer/Désactiver'),
  value: _switchValue,
  onChanged: (bool value) {
    setState(() {
      _switchValue = value;
    });
  },
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
          ),
          WidgetShowcase(
            title: 'Slider',
            widget: Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            sourceCode: '''
Slider(
  value: _sliderValue,
  min: 0,
  max: 100,
  divisions: 10,
  label: _sliderValue.round().toString(),
  onChanged: (double value) {
    setState(() {
      _sliderValue = value;
    });
  },
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/Slider-class.html',
          ),
        ],
      ),
    );
  }
}