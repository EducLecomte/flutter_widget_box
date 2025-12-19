import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/widgets/button_widgets.dart';
import 'package:flutter_widgetbox/widgets/display_widgets.dart';
import 'package:flutter_widgetbox/widgets/input_widgets.dart';
import 'package:flutter_widgetbox/widgets/dialog_widgets.dart';
import 'package:flutter_widgetbox/widgets/layout_widgets.dart';
import 'package:flutter_widgetbox/widgets/animation_widgets.dart';
import 'package:flutter_widgetbox/widgets/scaffold_features_page.dart';
import 'package:flutter_widgetbox/widgets/list_interaction_widgets.dart';
import 'package:flutter_widgetbox/widgets/theme_showcase_page.dart';

void main() {
  runApp(const MyApp());
}

class WidgetCategory {
  final String name;
  final IconData icon;
  final Widget widgetPage;

  WidgetCategory({
    required this.name,
    required this.icon,
    required this.widgetPage,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgetbox',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Utilisation de Material 3 par défaut
      ),
      debugShowCheckedModeBanner: false,
      home: const WidgetBoxHome(),
    );
  }
}

class WidgetBoxHome extends StatelessWidget {
  const WidgetBoxHome({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      WidgetCategory(name: 'Layout', icon: Icons.dashboard_outlined, widgetPage: const LayoutWidgetsPage()),
      WidgetCategory(name: 'Buttons', icon: Icons.touch_app_outlined, widgetPage: const ButtonWidgetsPage()),
      WidgetCategory(name: 'Input & Selections', icon: Icons.input_outlined, widgetPage: const InputWidgetsPage()),
      WidgetCategory(name: 'Display', icon: Icons.visibility_outlined, widgetPage: const DisplayWidgetsPage()),
      WidgetCategory(name: 'Dialogs, Alerts & Panels', icon: Icons.feedback_outlined, widgetPage: const DialogWidgetsPage()),
      WidgetCategory(name: 'Animation', icon: Icons.animation, widgetPage: const AnimationWidgetsPage()),
      WidgetCategory(name: 'Lists & Interaction', icon: Icons.list_alt, widgetPage: const ListInteractionWidgetsPage()),
      WidgetCategory(name: 'Scaffold Features', icon: Icons.web_asset_outlined, widgetPage: const ScaffoldFeaturesPage()),
      WidgetCategory(name: 'Thèmes Material', icon: Icons.palette_outlined, widgetPage: const ThemeShowcasePage()),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/flutter_logo.png',
              height: 28, // Ajustez la taille selon vos besoins
            ),
            const SizedBox(width: 12),
            const Text('Flutter Widgetbox'),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ListTile(
              leading: Icon(category.icon, color: Theme.of(context).colorScheme.primary),
              title: Text(category.name, style: const TextStyle(fontWeight: FontWeight.w500)),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => category.widgetPage),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
