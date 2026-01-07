import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

class ScaffoldFeaturesPage extends StatefulWidget {
  const ScaffoldFeaturesPage({super.key});

  @override
  State<ScaffoldFeaturesPage> createState() => _ScaffoldFeaturesPageState();
}

class _ScaffoldFeaturesPageState extends State<ScaffoldFeaturesPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Le Scaffold principal de la page
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fonctionnalités du Scaffold'),
        actions: const [ThemeSwitchButton()],
      ),
      // Le Drawer est défini ici pour que le bouton dans le corps puisse l'ouvrir
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu Drawer',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              onTap: () => Navigator.of(context).pop(),
            ),
            ListTile(
              leading: const Icon(Icons.arrow_back),
              title: const Text('Retour au menu principal'),
              onTap: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          WidgetShowcase(
            data: WidgetData(
              title: 'AppBar',
              widget: Material(
                child: AppBar(
                  title: Text('Exemple d\'AppBar'),
                  actions: [Icon(Icons.search)],
                ),
              ),
              sourceCode: '''
Scaffold(
  appBar: AppBar(
    title: const Text('Titre'),
    actions: <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {},
      ),
    ],
  ),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/AppBar-class.html',
              description:
                  'La barre d\'application supérieure standard. Elle affiche le titre, des actions (boutons à droite) et le bouton de menu (leading). '
                  'Elle s\'adapte automatiquement au thème (couleur, élévation).',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'Drawer',
              widget: Builder(
                // Le Builder fournit un nouveau BuildContext qui connaît le Scaffold parent.
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Text('Ouvrir le Drawer'),
                ),
              ),
              sourceCode: '''
Scaffold(
  // ... appBar
  drawer: Drawer(
    child: ListView(
      children: <Widget>[
        DrawerHeader(child: Text('Titre du Drawer')),
        ListTile(title: Text('Item 1')),
        ListTile(title: Text('Item 2')),
      ],
    ),
  ),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/Drawer-class.html',
              description:
                  'Un panneau de navigation qui glisse horizontalement depuis le bord de l\'écran. '
                  'Souvent utilisé pour un menu principal accessible via l\'icône "hamburger" de l\'AppBar.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'BottomNavigationBar',
              widget: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Accueil',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Recherche',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'Profil',
                  ),
                ],
              ),
              sourceCode: '''
Scaffold(
  // ...
  bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: (index) => setState(() => _selectedIndex = index),
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
      BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
    ],
  ),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html',
              description:
                  'Une barre de navigation inférieure permettant de basculer rapidement entre les rubriques principales de l\'application. '
                  'Idéalement entre 3 et 5 destinations.',
            ),
          ),
          WidgetShowcase(
            data: WidgetData(
              title: 'FloatingActionButton',
              widget: const FloatingActionButton(
                onPressed: null,
                child: Icon(Icons.add),
              ),
              sourceCode: '''
Scaffold(
  // ...
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    tooltip: 'Ajouter',
    child: const Icon(Icons.add),
  ),
)''',
              docUrl:
                  'https://api.flutter.dev/flutter/material/FloatingActionButton-class.html',
              description:
                  'Le bouton d\'action principal de l\'écran, flottant au-dessus du contenu. '
                  'Ici montré intégré dans le Scaffold via la propriété floatingActionButton.',
            ),
          ),
        ],
      ),
    );
  }
}
