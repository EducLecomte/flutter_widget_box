import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetShowcase(
              data: WidgetData(
                title: 'Container',
                widget: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    border: Border.all(color: Colors.blue.shade800),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text('Un Container avec décoration'),
                ),
                sourceCode: '''
Container(
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.all(8),
  decoration: BoxDecoration(
    color: Colors.blue[100],
    border: Border.all(color: Colors.blue.shade800),
    borderRadius: BorderRadius.circular(8),
  ),
  child: const Text('Un Container avec décoration'),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Container-class.html',
                description:
                    'Le widget couteau-suisse de Flutter. Il combine peinture, positionnement et redimensionnement. '
                    'Utilisez-le pour ajouter padding, margin, bordures, couleurs d\'arrière-plan ou pour contraindre la taille.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Row (défilement horizontal)',
                widget: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(16),
                        color: Colors.lightBlue[100],
                        child: Text('Item ${index + 1}'),
                      ),
                    ),
                  ),
                ),
                sourceCode: '''
SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: List.generate(
      10,
      (index) => Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16),
        color: Colors.lightBlue[100],
        child: Text('Item \${index + 1}'),
      ),
    ),
  ),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Row-class.html',
                description:
                    'Dispose ses enfants horizontalement. C\'est un widget flexible essentiel pour les mises en page. '
                    'L\'exemple inclut un SingleChildScrollView horizontal pour éviter le dépassement (overflow) si le contenu est trop large.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Column',
                widget: const Column(
                  children: [
                    Text('Element 1'),
                    Text('Element 2'),
                    Text('Element 3'),
                  ],
                ),
                sourceCode: '''
const Column(
  children: [
    Text('Element 1'),
    Text('Element 2'),
    Text('Element 3'),
  ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Column-class.html',
                description:
                    'Dispose ses enfants verticalement. Comme la Row, c\'est un pilier de la construction d\'interfaces. '
                    'Utilisez MainAxisAlignment pour contrôler l\'espacement vertical et CrossAxisAlignment pour l\'alignement horizontal.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Stack',
                widget: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 100, height: 100, color: Colors.red),
                    Container(width: 80, height: 80, color: Colors.green),
                    Container(width: 60, height: 60, color: Colors.blue),
                  ],
                ),
                sourceCode: '''
Stack(
  alignment: Alignment.center,
  children: [
    Container(width: 100, height: 100, color: Colors.red),
    Container(width: 80, height: 80, color: Colors.green),
    Container(width: 60, height: 60, color: Colors.blue),
  ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Stack-class.html',
                description:
                    'Superpose ses enfants les uns sur les autres. Le premier enfant est en bas, le dernier en haut. '
                    'Utile pour placer du texte sur une image ou créer des mises en page complexes avec positionnement absolu.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Expanded',
                widget: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 50,
                        color: Colors.amber,
                        child: const Center(child: Text('Flex: 2')),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 50,
                        color: Colors.lightBlue,
                        child: const Center(child: Text('Flex: 1')),
                      ),
                    ),
                  ],
                ),
                sourceCode: '''
Row(
  children: [
    Expanded(
      flex: 2,
      child: Container(height: 50, color: Colors.amber, child: const Center(child: Text('Flex: 2'))),
    ),
    Expanded(
      flex: 1,
      child: Container(height: 50, color: Colors.lightBlue, child: const Center(child: Text('Flex: 1'))),
    ),
  ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Expanded-class.html',
                description:
                    'Utilisé dans une Row ou Column pour qu\'un enfant remplisse l\'espace disponible restant. '
                    'Le paramètre "flex" permet de définir des proportions entre plusieurs enfants Expanded.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Card',
                widget: const Card(
                  child: ListTile(
                    leading: Icon(Icons.album),
                    title: Text('Titre de la carte'),
                    subtitle: Text('Sous-titre de la carte'),
                  ),
                ),
                sourceCode: '''
const Card(
  child: ListTile(
    leading: Icon(Icons.album),
    title: Text('Titre de la carte'),
    subtitle: Text('Sous-titre de la carte'),
  ),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/Card-class.html',
                description:
                    'Un panneau avec des coins légèrement arrondis et une ombre d\'élévation. '
                    'Utilisé pour regrouper des informations connexes, comme dans une liste de contacts ou d\'articles.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Table',
                widget: Table(
                  border: TableBorder.all(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  columnWidths: const <int, TableColumnWidth>{
                    0: IntrinsicColumnWidth(),
                    1: FlexColumnWidth(),
                    2: FixedColumnWidth(64),
                  },
                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                  children: <TableRow>[
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4),
                        ),
                      ),
                      children: const <Widget>[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Produit',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Stock',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Widget A'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Un widget très utile et polyvalent.'),
                        ),
                        Center(
                          child: Icon(
                            Icons.check_circle,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(color: Colors.grey[100]),
                      children: <Widget>[
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Widget B'),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Un autre widget essentiel pour le design.',
                          ),
                        ),
                        Center(
                          child: Icon(Icons.cancel, color: Colors.red[600]),
                        ),
                      ],
                    ),
                  ],
                ),
                sourceCode: '''
Table(
  border: TableBorder.all(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(4),
  ),
  columnWidths: const <int, TableColumnWidth>{
    0: IntrinsicColumnWidth(),
    1: FlexColumnWidth(),
    2: FixedColumnWidth(64),
  },
  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
  children: <TableRow>[
    TableRow(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
      children: const <Widget>[
        Padding(padding: EdgeInsets.all(8.0), child: Text('Produit', style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(8.0), child: Text('Stock', style: TextStyle(fontWeight: FontWeight.bold))),
      ],
    ),
    TableRow(
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(8.0), child: Text('Widget A')),
        const Padding(padding: EdgeInsets.all(8.0), child: Text('Un widget très utile et polyvalent.')),
        Center(child: Icon(Icons.check_circle, color: Colors.green[600])),
      ],
    ),
    TableRow(
      decoration: BoxDecoration(color: Colors.grey[100]),
      children: <Widget>[
        const Padding(padding: EdgeInsets.all(8.0), child: Text('Widget B')),
        const Padding(padding: EdgeInsets.all(8.0), child: Text('Un autre widget essentiel pour le design.')),
        Center(child: Icon(Icons.cancel, color: Colors.red[600])),
      ],
    ),
  ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Table-class.html',
                description:
                    'Utilise l\'algorithme de tableau pour la mise en page. Utile lorsque plusieurs lignes doivent avoir des colonnes de même largeur, '
                    'souvent pour présenter des données structurées.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'GridView',
                widget: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: GridView.count(
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio:
                          1.5, // Rend les cellules plus larges que hautes
                      children: List.generate(9, (index) {
                        return Container(
                          color: Colors.green[100 * (index % 9 + 1)],
                          child: Center(child: Text('Item ${index + 1}')),
                        );
                      }),
                    ),
                  ),
                ),
                sourceCode: '''
ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 400),
  child: GridView.count(
  crossAxisCount: 3,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  mainAxisSpacing: 8.0,
  crossAxisSpacing: 8.0,
  childAspectRatio: 1.5,
  children: List.generate(9, (index) {
    return Container(
      color: Colors.green[100 * (index % 9 + 1)],
      child: Center(
        child: Text('Item \${index + 1}'),
      ),
    );
  })),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/GridView-class.html',
                description:
                    'Une grille défilable de widgets. GridView.count est le constructeur le plus simple, permettant de spécifier un nombre fixe de colonnes. '
                    'Idéal pour les galeries d\'images ou les tableaux de bord.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
