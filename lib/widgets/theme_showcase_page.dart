import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';

class ThemeShowcasePage extends StatelessWidget {
  const ThemeShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final useMaterial3 = Theme.of(context).useMaterial3;

    return Scaffold(
      appBar: AppBar(
        title: Text(useMaterial3 ? 'Material 3' : 'Material 2'),
        actions: const [ThemeSwitchButton()],
      ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(
                'Actions Flottantes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Standard',
                    heroTag: 'fab_standard',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                    label: const Text('Extended'),
                    heroTag: 'fab_extended',
                  ),
                  FloatingActionButton.small(
                    onPressed: () {},
                    heroTag: 'fab_small',
                    child: const Icon(Icons.mic),
                  ),
                ],
              ),
              const Divider(height: 48),
              Text(
                'Contrôles de Sélection',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Switch(value: true, onChanged: (v) {}),
                  const SizedBox(width: 24),
                  Switch(value: false, onChanged: (v) {}),
                  const Spacer(),
                  Checkbox(value: true, onChanged: (v) {}),
                  const SizedBox(width: 24),
                  Radio(value: true, groupValue: true, onChanged: (v) {}),
                ],
              ),
              const Divider(height: 48),
              Text(
                'Cartes (Cards)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              const Row(
                children: [
                  Expanded(
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        child: Center(child: Text('Elevated Card')),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: SizedBox(
                        height: 100,
                        child: Center(child: Text('Outlined Card')),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(height: 48),
              Text(
                'Chips',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  const Chip(
                    label: Text('Chip Standard'),
                    avatar: CircleAvatar(child: Text('C')),
                  ),
                  InputChip(
                    label: const Text('Input Chip'),
                    selected: true,
                    onSelected: (v) {},
                    avatar: const Icon(Icons.person),
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.settings),
                    label: const Text('Action Chip'),
                    onPressed: () {},
                  ),
                  FilterChip(
                    label: const Text('Filter Chip'),
                    selected: true,
                    onSelected: (v) {},
                  ),
                ],
              ),
              const Divider(height: 48),
              Text(
                'Boutons (Buttons)',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
                  FilledButton(onPressed: () {}, child: const Text('Filled')),
                  FilledButton.tonal(onPressed: () {}, child: const Text('Tonal')),
                  OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
                  TextButton(onPressed: () {}, child: const Text('Text')),
                ],
              ),
              const Divider(height: 48),
              Text(
                'Autres Widgets',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: 24),
                  Expanded(child: Slider(value: 0.5, onChanged: (v) {})),
                ],
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Champ de texte',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
              ),
              const SizedBox(height: 64), // Espace pour le FAB du Scaffold
            ]),
          ),
        ),
      );
  }
}