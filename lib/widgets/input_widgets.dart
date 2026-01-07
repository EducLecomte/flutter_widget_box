import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

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
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/TextField-class.html',
              description:
                  'Un champ de texte permettant à l\'utilisateur de saisir des informations. '
                  'Il peut être personnalisé avec des décorations (InputDecoration) pour ajouter des labels, des icônes et des bordures.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/CheckboxListTile-class.html',
              description:
                  'Une case à cocher avec un libellé, intégrée dans une ligne de liste (ListTile). '
                  'Idéal pour les paramètres ou les listes de sélection simple (on/off) avec une description claire.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/RadioListTile-class.html',
              description:
                  'Un bouton radio avec un libellé. Permet de sélectionner une option unique parmi plusieurs. '
                  'Comme le CheckboxListTile, il est présenté sous forme de ligne de liste pour une meilleure ergonomie tactile.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/SwitchListTile-class.html',
              description:
                  'Un commutateur (Switch) avec un libellé. Utilisé pour activer ou désactiver une fonctionnalité ou un paramètre. '
                  'L\'effet de bascule est plus explicite qu\'une case à cocher pour les états actifs/inactifs.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/Slider-class.html',
              description:
                  'Une barre de glissement permettant de sélectionner une valeur dans une plage continue ou discrète. '
                  'Utile pour ajuster des paramètres comme le volume, la luminosité ou des quantités.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/RangeSlider-class.html',
              description:
                  'Similaire au Slider, mais avec deux curseurs pour sélectionner une plage de valeurs (min et max). '
                  'Parfait pour les filtres de prix, d\'âge ou de dates.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
                    })
                    .toList(),
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/DropdownButton-class.html',
              description:
                  'Un menu déroulant simple pour choisir une valeur parmi une liste. '
                  'Il est compact lorsqu\'il est fermé et affiche les options dans un menu superposé lorsqu\'il est ouvert.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'SegmentedButton (M3)',
              widget: SegmentedButton<String>(
                segments: const <ButtonSegment<String>>[
                  ButtonSegment<String>(
                    value: 'Day',
                    label: Text('Day'),
                    icon: Icon(Icons.calendar_view_day),
                  ),
                  ButtonSegment<String>(
                    value: 'Week',
                    label: Text('Week'),
                    icon: Icon(Icons.calendar_view_week),
                  ),
                  ButtonSegment<String>(
                    value: 'Month',
                    label: Text('Month'),
                    icon: Icon(Icons.calendar_view_month),
                  ),
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/SegmentedButton-class.html',
              description:
                  'Un ensemble de segments permettant de sélectionner une ou plusieurs options exclusives ou non. '
                  'C\'est une évolution Material 3, souvent utilisée pour changer de vue (ex: Jour/Semaine/Mois).',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'Date Picker',
              widget: Column(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'Aucune date sélectionnée'
                        : 'Date : ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  ),
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/showDatePicker.html',
              description:
                  'Un dialogue modal complet pour la sélection d\'une date. '
                  'Il offre une vue mensuelle et annuelle, adaptative selon la taille de l\'écran.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'Time Picker',
              widget: Column(
                children: [
                  Text(
                    _selectedTime == null
                        ? 'Aucune heure sélectionnée'
                        : 'Heure : \${_selectedTime!.format(context)}',
                  ),
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
              docUrl:
                  'https://api.flutter.dev/flutter/material/showTimePicker.html',
              description:
                  'Un dialogue modal permettant de choisir une heure (heures et minutes). '
                  'Il propose généralement un cadran d\'horloge ou des champs de saisie directe.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
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
                            const SnackBar(
                              content: Text('Formulaire valide !'),
                            ),
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
              description:
                  'Un conteneur pour regrouper plusieurs champs de saisie (TextFormField) et gérer leur validation globale. '
                  'Il permet de vérifier si tous les champs respectent les règles définies avant de soumettre les données.',
            ),
          ),
        ],
      ),
    );
  }
}
