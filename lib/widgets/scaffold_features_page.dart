import 'package:flutter/material.dart';

class ScaffoldFeaturesPage extends StatefulWidget {
  const ScaffoldFeaturesPage({super.key});

  @override
  State<ScaffoldFeaturesPage> createState() => _ScaffoldFeaturesPageState();
}

class _ScaffoldFeaturesPageState extends State<ScaffoldFeaturesPage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Icon(Icons.home, size: 150, color: Colors.blue),
    Icon(Icons.search, size: 150, color: Colors.green),
    Icon(Icons.person, size: 150, color: Colors.orange),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // DefaultTabController fournit un TabController au Scaffold et à ses enfants.
    return DefaultTabController(
      length: 3, // Le nombre d'onglets
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fonctionnalités du Scaffold'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              tooltip: 'Notifications',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pas de nouvelles notifications.')));
              },
            ),
          ],
          // La TabBar est placée en bas de l'AppBar
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'Transport'),
              Tab(icon: Icon(Icons.directions_transit), text: 'Voyage'),
              Tab(icon: Icon(Icons.directions_bike), text: 'Vélo'),
            ],
          ),
        ),
        // Le corps est maintenant un TabBarView pour afficher le contenu des onglets
        body: TabBarView(
          children: [
            // Le contenu du premier onglet
            const Center(child: Text('Contenu de l\'onglet Transport')),
            // Le contenu du deuxième onglet
            const Center(child: Text('Contenu de l\'onglet Voyage')),
            // Le contenu du troisième onglet
            const Center(child: Text('Contenu de l\'onglet Vélo')),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Tiroir de navigation (Drawer)',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Accueil'),
                onTap: () {
                  Navigator.pop(context); // Ferme le drawer
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Paramètres'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text('Retour au menu principal'),
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Action du bouton flottant !')),
            );
          },
          tooltip: 'Ajouter',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}