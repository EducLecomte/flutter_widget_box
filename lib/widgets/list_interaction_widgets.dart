import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';

class ListInteractionWidgetsPage extends StatefulWidget {
  const ListInteractionWidgetsPage({super.key});

  @override
  State<ListInteractionWidgetsPage> createState() => _ListInteractionWidgetsPageState();
}

class _ListInteractionWidgetsPageState extends State<ListInteractionWidgetsPage> {
  final List<int> _items = List<int>.generate(6, (index) => index);
  int? _selectedChoiceChip;
  final List<String> _selectedFilterChips = [];
  final List<String> _dismissItems = List.generate(5, (i) => 'Élément $i  (Glissez-moi)');



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lists & Interaction Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
           body: SingleChildScrollView(

        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
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
            ),_buildSectionTitle(context, 'ReorderableListView'),
            ReorderableListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                    key: ValueKey(_items[index]),
                    tileColor: index.isEven ? Colors.green[50] : Colors.green[100],
                    title: Text('Item ${_items[index]}'),
                    trailing: const Icon(Icons.drag_handle),
                  ),
              ],
            ),
            _buildSectionTitle(context, 'ExpansionTile'),
            const Card(
              child: ExpansionTile(
                leading: Icon(Icons.info),
                title: Text('Cliquez pour voir les détails'),
                children: [
                  ListTile(title: Text('Détail numéro 1')),
                  ListTile(title: Text('Détail numéro 2')),
                ],
              ),
            ),
            _buildSectionTitle(context, 'Dismissible (Swipe to delete)'),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _dismissItems.length,
              itemBuilder: (context, index) {
                final item = _dismissItems[index];
                return Dismissible(
                  key: Key(item),
                  background: Container(color: Colors.red, alignment: Alignment.centerRight, padding: const EdgeInsets.only(right: 20), child: const Icon(Icons.delete, color: Colors.white)),
                  onDismissed: (direction) {
                    setState(() {
                      _dismissItems.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Élément $index supprimé')));
                  },
                  child: Card(
                    child: ListTile(title: Text(item)),
                  ),
                );
              },
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