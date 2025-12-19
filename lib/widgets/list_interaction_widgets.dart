import 'package:flutter/material.dart';

class ListInteractionWidgetsPage extends StatefulWidget {
  const ListInteractionWidgetsPage({super.key});

  @override
  State<ListInteractionWidgetsPage> createState() => _ListInteractionWidgetsPageState();
}

class _ListInteractionWidgetsPageState extends State<ListInteractionWidgetsPage> {
  final List<int> _items = List<int>.generate(10, (index) => index);
  int? _selectedChoiceChip;
  List<String> _selectedFilterChips = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists & Interaction Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'ReorderableListView'),
            SizedBox(
              height: 300, // Give a fixed height for demonstration
              child: ReorderableListView(
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final int item = _items.removeAt(oldIndex);
                    _items.insert(newIndex, item);
                  });
                },
                children: <Widget>[
                  for (int index = 0; index < _items.length; index += 1)
                    ListTile(
                      key: Key('$index'),
                      tileColor: index.isEven ? Colors.blue[50] : Colors.blue[100],
                      title: Text('Item ${_items[index]}'),
                      trailing: const Icon(Icons.drag_handle),
                    ),
                ],
              ),
            ),
            _buildSectionTitle(context, 'ChoiceChip'),
            Wrap(
              spacing: 8.0,
              children: List<Widget>.generate(3, (int index) {
                return ChoiceChip(
                  label: Text('Choix ${index + 1}'),
                  selected: _selectedChoiceChip == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedChoiceChip = selected ? index : null;
                    });
                  },
                );
              }).toList(),
            ),
            _buildSectionTitle(context, 'FilterChip'),
            Wrap(
              spacing: 8.0,
              children: <Widget>[
                FilterChip(
                  label: const Text('Filtre A'),
                  selected: _selectedFilterChips.contains('A'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedFilterChips.add('A');
                      } else {
                        _selectedFilterChips.removeWhere((String name) => name == 'A');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Filtre B'),
                  selected: _selectedFilterChips.contains('B'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedFilterChips.add('B');
                      } else {
                        _selectedFilterChips.removeWhere((String name) => name == 'B');
                      }
                    });
                  },
                ),
                FilterChip(
                  label: const Text('Filtre C'),
                  selected: _selectedFilterChips.contains('C'),
                  onSelected: (bool selected) {
                    setState(() {
                      if (selected) {
                        _selectedFilterChips.add('C');
                      } else {
                        _selectedFilterChips.removeWhere((String name) => name == 'C');
                      }
                    });
                  },
                ),
              ],
            ),
            _buildSectionTitle(context, 'ActionChip'),
            Wrap(
              spacing: 8.0,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.add),
                  label: const Text('Ajouter'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Action "Ajouter" cliquée!')),
                    );
                  },
                ),
                ActionChip(
                  avatar: const Icon(Icons.share),
                  label: const Text('Partager'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Action "Partager" cliquée!')),
                    );
                  },
                ),
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