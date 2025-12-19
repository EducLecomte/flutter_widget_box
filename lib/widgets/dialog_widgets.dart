import 'package:flutter/material.dart';

class DialogWidgetsPage extends StatelessWidget {
  const DialogWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialogs, Alerts & Panels'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () => _showAlertDialog(context),
            child: const Text('Afficher AlertDialog'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showSimpleDialog(context),
            child: const Text('Afficher SimpleDialog'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showSnackBar(context),
            child: const Text('Afficher SnackBar'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showBottomSheet(context),
            child: const Text('Afficher BottomSheet'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => _showAboutDialog(context),
            child: const Text('Afficher AboutDialog'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Titre de l\'AlertDialog'),
          content: const Text('Ceci est le contenu de la boîte de dialogue.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Choisissez une option'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () { Navigator.of(context).pop(); },
              child: const Text('Option 1'),
            ),
            SimpleDialogOption(
              onPressed: () { Navigator.of(context).pop(); },
              child: const Text('Option 2'),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Ceci est un SnackBar !'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return const SizedBox(
          height: 200,
          child: Center(
            child: Text('Ceci est un BottomSheet'),
          ),
        );
      },
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: 'Flutter Widgetbox',
      applicationVersion: '1.0.0',
      applicationLegalese: '© 2025 Gemini Code Assist',
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 15),
          child: Text('Ceci est une application de démonstration des widgets Flutter.'),
        )
      ],
    );
  }
}