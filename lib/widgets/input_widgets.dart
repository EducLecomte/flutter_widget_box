import 'package:flutter/material.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text('TextField'),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Entrez du texte',
              hintText: 'Placeholder',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          const Text('Checkbox'),
          CheckboxListTile(
            title: const Text('Cochez-moi'),
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          ),
          const SizedBox(height: 24),
          const Text('Radio Buttons'),
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
          const SizedBox(height: 24),
          const Text('Switch'),
          SwitchListTile(
            title: const Text('Activer/Désactiver'),
            value: _switchValue,
            onChanged: (bool value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          const SizedBox(height: 24),
          const Text('Slider'),
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
          ),
        ],
      ),
    );
  }
}