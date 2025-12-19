import 'package:flutter/material.dart';

class ButtonWidgetsPage extends StatelessWidget {
  const ButtonWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          alignment: WrapAlignment.center,
          children: [
            _buildButtonSection(
              'ElevatedButton',
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated'),
              ),
            ),
            _buildButtonSection(
              'TextButton',
              TextButton(
                onPressed: () {},
                child: const Text('Text'),
              ),
            ),
            _buildButtonSection(
              'OutlinedButton',
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined'),
              ),
            ),
            _buildButtonSection(
              'IconButton',
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
            ),
            _buildButtonSection(
              'FloatingActionButton',
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonSection(String title, Widget button) {
    return Column(children: [Text(title), const SizedBox(height: 8), button]);
  }
}