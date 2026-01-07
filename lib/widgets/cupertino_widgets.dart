import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

class CupertinoWidgetsPage extends StatefulWidget {
  const CupertinoWidgetsPage({super.key});

  @override
  State<CupertinoWidgetsPage> createState() => _CupertinoWidgetsPageState();
}

class _CupertinoWidgetsPageState extends State<CupertinoWidgetsPage> {
  bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino (iOS) Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetShowcase(
            data: WidgetData(
              title: 'CupertinoButton',
              widget: Column(
                children: [
                  CupertinoButton(
                    child: const Text('Button'),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 8),
                  CupertinoButton.filled(
                    child: const Text('Filled Button'),
                    onPressed: () {},
                  ),
                ],
              ),
              sourceCode: '''
CupertinoButton(
  child: const Text('Button'),
  onPressed: () {},
)

CupertinoButton.filled(
  child: const Text('Filled Button'),
  onPressed: () {},
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/cupertino/CupertinoButton-class.html',
              description:
                  'Le bouton style iOS. Il s\'estompe lorsqu\'on appuie dessus. '
                  'Utilisez .filled pour une version avec fond coloré.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'CupertinoSwitch',
              widget: CupertinoSwitch(
                value: _switchValue,
                onChanged: (bool value) {
                  setState(() {
                    _switchValue = value;
                  });
                },
              ),
              sourceCode: '''
CupertinoSwitch(
  value: _switchValue,
  onChanged: (bool value) {
    setState(() {
      _switchValue = value;
    });
  },
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/cupertino/CupertinoSwitch-class.html',
              description:
                  'Le commutateur style iOS. Similaire au Switch Material mais avec le design et les animations natifs d\'Apple.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'CupertinoActivityIndicator',
              widget: const CupertinoActivityIndicator(radius: 20),
              sourceCode: '''
CupertinoActivityIndicator(radius: 20)''',
              docUrl:
                  'https://api.flutter.dev/flutter/cupertino/CupertinoActivityIndicator-class.html',
              description:
                  'L\'indicateur de chargement spinner style iOS. Il tourne indéfiniment.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'CupertinoIcons',
              widget: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(CupertinoIcons.share, size: 30),
                  Icon(CupertinoIcons.book, size: 30),
                  Icon(CupertinoIcons.phone, size: 30),
                  Icon(CupertinoIcons.settings, size: 30),
                ],
              ),
              sourceCode: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: const [
    Icon(CupertinoIcons.share, size: 30),
    Icon(CupertinoIcons.book, size: 30),
    Icon(CupertinoIcons.phone, size: 30),
    Icon(CupertinoIcons.settings, size: 30),
  ],
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/cupertino/CupertinoIcons-class.html',
              description:
                  'Exemples d\'icônes du pack CupertinoIcons, reproduisant le style système iOS (SF Symbols).',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'CupertinoAlertDialog',
              widget: CupertinoButton(
                child: const Text('Show Alert'),
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text('Alert'),
                      content: const Text('Ceci est une alerte style iOS.'),
                      actions: [
                        CupertinoDialogAction(
                          child: const Text('OK'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
              sourceCode: '''
showCupertinoDialog(
  context: context,
  builder: (context) => CupertinoAlertDialog(...),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/cupertino/CupertinoAlertDialog-class.html',
              description:
                  'Une alerte modale au style iOS. Les actions sont généralement présentées en bas, séparées par des lignes.',
            ),
          ),
        ],
      ),
    );
  }
}
