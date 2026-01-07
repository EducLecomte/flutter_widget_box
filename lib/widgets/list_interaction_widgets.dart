import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

class ListInteractionWidgetsPage extends StatefulWidget {
  const ListInteractionWidgetsPage({super.key});

  @override
  State<ListInteractionWidgetsPage> createState() =>
      _ListInteractionWidgetsPageState();
}

class _ListInteractionWidgetsPageState
    extends State<ListInteractionWidgetsPage> {
  final List<int> _items = List<int>.generate(6, (index) => index);
  int? _selectedChoiceChip;
  final List<String> _selectedFilterChips = [];
  final List<String> _dismissItems = List.generate(
    5,
    (i) => 'Élément $i  (Glissez-moi)',
  );

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
            WidgetShowcase(
              title: 'ChoiceChip',
              widget: Wrap(
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
              sourceCode: '''
Wrap(
  spacing: 8.0,
  children: List<Widget>.generate(3, (int index) {
    return ChoiceChip(
      label: Text('Choix \${index + 1}'),
      selected: _selectedChoiceChip == index,
      onSelected: (bool selected) {
        setState(() {
          _selectedChoiceChip = selected ? index : null;
        });
      },
    );
  }).toList(),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/ChoiceChip-class.html',
            ),
            WidgetShowcase(
              title: 'FilterChip',
              widget: Wrap(
                spacing: 8.0,
                children: [
                  FilterChip(
                    label: const Text('Filtre A'),
                    selected: _selectedFilterChips.contains('A'),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedFilterChips.add('A');
                        } else {
                          _selectedFilterChips.removeWhere(
                            (String name) => name == 'A',
                          );
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
                          _selectedFilterChips.removeWhere(
                            (String name) => name == 'B',
                          );
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
                          _selectedFilterChips.removeWhere(
                            (String name) => name == 'C',
                          );
                        }
                      });
                    },
                  ),
                ],
              ),
              sourceCode: '''
Wrap(
  spacing: 8.0,
  children: [
    FilterChip(
      label: const Text('Filtre A'),
      selected: _selectedFilterChips.contains('A'),
      onSelected: (bool selected) {
        setState(() {
          if (selected) _selectedFilterChips.add('A');
          else _selectedFilterChips.remove('A');
        });
      },
    ),
    // ... autres FilterChips
  ],
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/FilterChip-class.html',
            ),
            WidgetShowcase(
              title: 'ActionChip',
              widget: Wrap(
                spacing: 8.0,
                children: [
                  ActionChip(
                    avatar: const Icon(Icons.add),
                    label: const Text('Ajouter'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Action "Ajouter" cliquée!'),
                        ),
                      );
                    },
                  ),
                  ActionChip(
                    avatar: const Icon(Icons.share),
                    label: const Text('Partager'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Action "Partager" cliquée!'),
                        ),
                      );
                    },
                  ),
                ],
              ),
              sourceCode: '''
ActionChip(
  avatar: const Icon(Icons.add),
  label: const Text('Ajouter'),
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Action "Ajouter" cliquée!')),
    );
  },
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/ActionChip-class.html',
            ),
            WidgetShowcase(
              title: 'ReorderableListView',
              widget: SizedBox(
                height: 300, // Hauteur contrainte pour l'exemple
                child: ReorderableListView(
                  physics: const ClampingScrollPhysics(),
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
                        tileColor: index.isEven
                            ? Colors.green[50]
                            : Colors.green[100],
                        title: Text('Item ${_items[index]}'),
                        trailing: const Icon(Icons.drag_handle),
                      ),
                  ],
                ),
              ),
              sourceCode: '''
ReorderableListView(
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
        title: Text('Item \${_items[index]}'),
        trailing: const Icon(Icons.drag_handle),
      ),
  ],
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/ReorderableListView-class.html',
            ),
            WidgetShowcase(
              title: 'ExpansionTile',
              widget: const Card(
                child: ExpansionTile(
                  leading: Icon(Icons.info),
                  title: Text('Cliquez pour voir les détails'),
                  children: [
                    ListTile(title: Text('Détail numéro 1')),
                    ListTile(title: Text('Détail numéro 2')),
                  ],
                ),
              ),
              sourceCode: '''
const Card(
  child: ExpansionTile(
    leading: Icon(Icons.info),
    title: Text('Cliquez pour voir les détails'),
    children: [
      ListTile(title: Text('Détail numéro 1')),
      ListTile(title: Text('Détail numéro 2')),
    ],
  ),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/ExpansionTile-class.html',
            ),
            WidgetShowcase(
              title: 'Dismissible (Swipe to delete)',
              widget: SizedBox(
                height: 300,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: _dismissItems.length,
                  itemBuilder: (context, index) {
                    final item = _dismissItems[index];
                    return Dismissible(
                      key: Key(item),
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          _dismissItems.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Élément $index supprimé')),
                        );
                      },
                      child: Card(child: ListTile(title: Text(item))),
                    );
                  },
                ),
              ),
              sourceCode: '''
Dismissible(
  key: Key(item),
  background: Container(color: Colors.red, ...),
  onDismissed: (direction) {
    setState(() {
      _dismissItems.removeAt(index);
    });
  },
  child: Card(
    child: ListTile(title: Text(item)),
  ),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/widgets/Dismissible-class.html',
            ),
          ],
        ),
      ),
    );
  }
}
