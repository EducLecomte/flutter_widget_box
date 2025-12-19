import 'package:flutter/material.dart';

class DisplayWidgetsPage extends StatelessWidget {
  const DisplayWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Text'),
            const Text(
              'Ceci est un widget Text simple. Vous pouvez le styliser avec différentes polices, couleurs et tailles.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Texte stylisé',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            _buildSectionTitle(context, 'Icon'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Icon(Icons.settings, size: 40, color: Colors.grey),
                Icon(Icons.favorite, size: 40, color: Colors.red),
              ],
            ),
            _buildSectionTitle(context, 'Image'),
            const Text('Depuis le réseau:'),
            Center(
              child: Image.network(
                'https://flutter.dev/images/flutter-logo-sharing.png',
                height: 100,
              ),
            ),
            const SizedBox(height: 8),
            const Text('Depuis les assets (à ajouter dans pubspec.yaml):'),
            Center(child: Image.asset('assets/images/flutter_logo.png', height: 100)),
            _buildSectionTitle(context, 'Progress Indicators'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 100, child: LinearProgressIndicator()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const Divider(),
        ],
      ),
    );
  }
}