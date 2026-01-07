import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

class ListInteractionWidgetsPage extends StatefulWidget {
  const ListInteractionWidgetsPage({super.key});

  @override
  State<ListInteractionWidgetsPage> createState() =>
      _ListInteractionWidgetsPageState();
}

class _ListInteractionWidgetsPageState
    extends State<ListInteractionWidgetsPage> {
  final List<String> _items = List<String>.generate(
    6,
    (index) => 'Item ${index + 1}',
  );
  int? _selectedChoiceChip;
  final List<String> _selectedFilterChips = [];

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
              data: WidgetData(
                title: 'ChoiceChip',
                widget: Wrap(
                  spacing: 8.0,
                  children: List.generate(3, (int index) {
                    return ChoiceChip(
                      label: Text('Item $index'),
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
ChoiceChip(
  label: Text('Item \$index'),
  selected: _selectedChoiceChip == index,
  onSelected: (bool selected) {
    setState(() {
      _selectedChoiceChip = selected ? index : null;
    });
  },
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/ChoiceChip-class.html',
                description:
                    'Un composant de sélection unique (comme un Radio button). '
                    'Permet de choisir une option parmi plusieurs mutuellement exclusives.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'FilterChip',
                widget: Wrap(
                  spacing: 8.0,
                  children: [
                    FilterChip(
                      label: const Text('Filter 1'),
                      selected: _selectedFilterChips.contains('Filter 1'),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedFilterChips.add('Filter 1');
                          } else {
                            _selectedFilterChips.remove('Filter 1');
                          }
                        });
                      },
                    ),
                    FilterChip(
                      label: const Text('Filter 2'),
                      selected: _selectedFilterChips.contains('Filter 2'),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            _selectedFilterChips.add('Filter 2');
                          } else {
                            _selectedFilterChips.remove('Filter 2');
                          }
                        });
                      },
                    ),
                  ],
                ),
                sourceCode: '''
FilterChip(
  label: const Text('Filter 1'),
  selected: _selectedFilterChips.contains('Filter 1'),
  onSelected: (bool selected) {
    setState(() {
      if (selected) {
        _selectedFilterChips.add('Filter 1');
      } else {
        _selectedFilterChips.remove('Filter 1');
      }
    });
  },
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/FilterChip-class.html',
                description:
                    'Un composant de sélection multiple (comme une Checkbox). '
                    'Utilisé pour activer ou désactiver des filtres ou des options cumulables.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'ActionChip',
                widget: ActionChip(
                  avatar: const Icon(Icons.favorite),
                  label: const Text('Action Chip'),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Action Chip pressed!')),
                    );
                  },
                ),
                sourceCode: '''
ActionChip(
  avatar: const Icon(Icons.favorite),
  label: const Text('Action Chip'),
  onPressed: () { ... },
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/ActionChip-class.html',
                description:
                    'Un bouton compact qui déclenche une action. '
                    'Souvent utilisé pour des actions contextuelles ou secondaires.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'ReorderableListView',
                widget: SizedBox(
                  height: 200,
                  child: ReorderableListView(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (oldIndex < newIndex) {
                          newIndex -= 1;
                        }
                        final String item = _items.removeAt(oldIndex);
                        _items.insert(newIndex, item);
                      });
                    },
                    children: [
                      for (int index = 0; index < _items.length; index++)
                        ListTile(
                          key: Key(_items[index]),
                          title: Text(_items[index]),
                          trailing: const Icon(Icons.drag_handle),
                        ),
                    ],
                  ),
                ),
                sourceCode: '''
ReorderableListView(
  onReorder: (int oldIndex, int newIndex) { ... },
  children: [ ... ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/ReorderableListView-class.html',
                description:
                    'Une liste dont les éléments peuvent être réorganisés par glisser-déposer. '
                    'Nécessite la gestion manuelle de la liste sous-jacente dans le callback onReorder.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'ListTile',
                widget: const ListTile(
                  leading: Icon(Icons.map),
                  title: Text('Map'),
                  subtitle: Text('Navigate to destination'),
                  trailing: Icon(Icons.chevron_right),
                ),
                sourceCode: '''
ListTile(
  leading: Icon(Icons.map),
  title: Text('Map'),
  subtitle: Text('Navigate to destination'),
  trailing: Icon(Icons.chevron_right),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/ListTile-class.html',
                description:
                    'Un widget de ligne de liste polyvalent, souvent utilisé dans les ListView. '
                    'Il peut afficher un titre, un sous-titre, un widget principal (leading) et un widget secondaire (trailing).',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
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
                description:
                    'ExpansionTile est un élément de liste qui peut être étendu pour révéler plus de détails ou replié pour gagner de la place. '
                    'Il est parfait pour créer des listes à plusieurs niveaux, des FAQ, ou des formulaires longs '
                    'en masquant la complexité jusqu\'à ce que l\'utilisateur en ait besoin.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Dismissible',
                widget: Dismissible(
                  key: const Key('dismissible_item'),
                  onDismissed: (direction) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item dismissed')),
                    );
                  },
                  background: Container(color: Colors.red),
                  child: const ListTile(
                    title: Text('Swipe me to dismiss'),
                    tileColor: Colors.grey,
                  ),
                ),
                sourceCode: '''
Dismissible(
  key: const Key('dismissible_item'),
  onDismissed: (direction) { ... },
  background: Container(color: Colors.red),
  child: const ListTile(
    title: Text('Swipe me to dismiss'),
  ),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Dismissible-class.html',
                description:
                    'Permet de supprimer un élément de liste par glissement (swipe). '
                    'Fournit un feedback visuel avec une couleur d\'arrière-plan.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
