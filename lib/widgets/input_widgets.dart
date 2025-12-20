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
  String _dropdownValue = 'Option 1';
  RangeValues _rangeValues = const RangeValues(20, 80);
  Set<String> _selectedSegments = {'Day'};
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  final _formKey = GlobalKey<FormState>();

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
          WidgetShowcase(
            title: 'RangeSlider',
            widget: RangeSlider(
              values: _rangeValues,
              min: 0,
              max: 100,
              divisions: 10,
              labels: RangeLabels(
                _rangeValues.start.round().toString(),
                _rangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _rangeValues = values;
                });
              },
            ),
            sourceCode: '''
RangeSlider(
  values: _rangeValues,
  min: 0,
  max: 100,
  divisions: 10,
  labels: RangeLabels(
    _rangeValues.start.round().toString(),
    _rangeValues.end.round().toString(),
  ),
  onChanged: (RangeValues values) {
    setState(() {
      _rangeValues = values;
    });
  },
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/RangeSlider-class.html',
          ),
          WidgetShowcase(
            title: 'DropdownButton',
            widget: DropdownButton<String>(
              value: _dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  _dropdownValue = newValue!;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            sourceCode: '''
DropdownButton<String>(
  value: _dropdownValue,
  onChanged: (String? newValue) {
    setState(() {
      _dropdownValue = newValue!;
    });
  },
  items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
      .map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/DropdownButton-class.html',
          ),
          WidgetShowcase(
            title: 'SegmentedButton (M3)',
            widget: SegmentedButton<String>(
              segments: const <ButtonSegment<String>>[
                ButtonSegment<String>(value: 'Day', label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
                ButtonSegment<String>(value: 'Week', label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
                ButtonSegment<String>(value: 'Month', label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
              ],
              selected: _selectedSegments,
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  _selectedSegments = newSelection;
                });
              },
            ),
            sourceCode: '''
SegmentedButton<String>(
  segments: const <ButtonSegment<String>>[
    ButtonSegment<String>(value: 'Day', label: Text('Day'), icon: Icon(Icons.calendar_view_day)),
    ButtonSegment<String>(value: 'Week', label: Text('Week'), icon: Icon(Icons.calendar_view_week)),
    ButtonSegment<String>(value: 'Month', label: Text('Month'), icon: Icon(Icons.calendar_view_month)),
  ],
  selected: _selectedSegments,
  onSelectionChanged: (Set<String> newSelection) {
    setState(() {
      _selectedSegments = newSelection;
    });
  },
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/SegmentedButton-class.html',
          ),
          WidgetShowcase(
            title: 'Date Picker',
            widget: Column(
              children: [
                Text(_selectedDate == null
                    ? 'Aucune date sélectionnée'
                    : 'Date : ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                      });
                    }
                  },
                  child: const Text('Sélectionner une date'),
                ),
              ],
            ),
            sourceCode: '''
showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/showDatePicker.html',
          ),
          WidgetShowcase(
            title: 'Time Picker',
            widget: Column(
              children: [
                Text(_selectedTime == null
                    ? 'Aucune heure sélectionnée'
                    : 'Heure : ${_selectedTime!.format(context)}'),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null && picked != _selectedTime) {
                      setState(() {
                        _selectedTime = picked;
                      });
                    }
                  },
                  child: const Text('Sélectionner une heure'),
                ),
              ],
            ),
            sourceCode: '''
showTimePicker(
  context: context,
  initialTime: TimeOfDay.now(),
)''',
            docUrl: 'https://api.flutter.dev/flutter/material/showTimePicker.html',
          ),
          WidgetShowcase(
            title: 'Form & Validation',
            widget: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'exemple@email.com',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Veuillez entrer un texte';
                      }
                      if (!value.contains('@')) {
                        return 'Email invalide';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Formulaire valide !')),
                        );
                      }
                    },
                    child: const Text('Valider'),
                  ),
                ],
              ),
            ),
            sourceCode: '''
Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) return 'Requis';
          return null;
        },
      ),
      ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // Traitement
          }
        },
        child: const Text('Valider'),
      ),
    ],
  ),
)''',
            docUrl: 'https://api.flutter.dev/flutter/widgets/Form-class.html',
          ),
         
        ],
      ),
    );
  }
}