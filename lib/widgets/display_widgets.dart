import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

class DisplayWidgetsPage extends StatelessWidget {
  const DisplayWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetShowcase(
              data: WidgetData(
                title: 'Text (Simple)',
                widget: Text(
                  'Ceci est un widget Text simple.',
                  style: TextStyle(fontSize: 16),
                ),
                sourceCode: '''
const Text(
  'Ceci est un widget Text simple.',
  style: TextStyle(fontSize: 16),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Text-class.html',
                description:
                    'Le widget de base pour afficher une chaîne de caractères. '
                    'Il s\'adapte automatiquement au style du thème parent et gère le retour à la ligne.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Text (Stylisé)',
                widget: Text(
                  'Texte stylisé',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                sourceCode: '''
Text(
  'Texte stylisé',
  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color: Colors.purple,
        fontWeight: FontWeight.bold,
      ),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Text-class.html',
                description:
                    'Permet de personnaliser finement l\'apparence du texte via la propriété style. '
                    'On peut modifier la couleur, la taille, la police, l\'espacement et plus encore.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Icon',
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.home, size: 40, color: Colors.blue),
                    Icon(Icons.settings, size: 40, color: Colors.grey),
                    Icon(Icons.favorite, size: 40, color: Colors.red),
                  ],
                ),
                sourceCode: '''
const Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Icon(Icons.home, size: 40, color: Colors.blue),
    Icon(Icons.settings, size: 40, color: Colors.grey),
    Icon(Icons.favorite, size: 40, color: Colors.red),
  ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Icon-class.html',
                description:
                    'Affiche un glyphe d\'une police d\'icônes (comme Material Icons). '
                    'Les icônes sont vectorielles, donc redimensionnables sans perte de qualité et colorables à volonté.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Image.network',
                widget: Center(
                  child: Image.network(
                    'https://www.pedagogeek.fr/img/sunpx.jpg',
                    height: 100,
                  ),
                ),
                sourceCode: '''
Image.network(
  'https://www.pedagogeek.fr/img/sunpx.jpg',
  height: 100,
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Image-class.html',
                description:
                    'Télécharge et affiche une image depuis une URL réseau. '
                    'Il gère automatiquement la mise en cache et le chargement asynchrone.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Image.asset',
                widget: Center(
                  child: Image.asset(
                    'assets/images/flutter_logo.png',
                    height: 100,
                  ),
                ),
                sourceCode: '''
Image.asset('assets/images/flutter_logo.png', height: 100)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Image-class.html',
                description:
                    'Affiche une image incluse directement dans les ressources (assets) de l\'application. '
                    'L\'image doit être déclarée dans le fichier pubspec.yaml.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Progress Indicators',
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(width: 100, child: LinearProgressIndicator()),
                  ],
                ),
                sourceCode: '''
const Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    CircularProgressIndicator(),
    SizedBox(width: 100, child: LinearProgressIndicator()),
  ],
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html',
                description:
                    'Indicateurs visuels pour signaler une tâche en cours. '
                    'CircularProgressIndicator (rond) et LinearProgressIndicator (barre) peuvent être indéterminés (animation continue) ou déterminés (progression fixe).',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Tooltip',
                widget: Tooltip(
                  message: 'Ceci est une info-bulle',
                  child: ElevatedButton(
                    onPressed: null,
                    child: const Text('Survolez pour voir'),
                  ),
                ),
                sourceCode: '''
Tooltip(
  message: 'Info-bulle',
  child: Widget(),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/Tooltip-class.html',
                description:
                    'Un petit message contextuel qui apparaît lors d\'un appui long (mobile) ou survol (desktop). '
                    'Utile pour expliquer la fonction d\'un bouton sans texte.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Badge',
                widget: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Badge(
                      label: Text('3'),
                      child: Icon(Icons.notifications, size: 30),
                    ),
                    Badge(child: Icon(Icons.shopping_cart, size: 30)),
                  ],
                ),
                sourceCode: '''
Badge(
  label: Text('3'),
  child: Icon(Icons.notifications),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/material/Badge-class.html',
                description:
                    'Une petite pastille (souvent rouge) attachée à un widget parent (souvent une icône). '
                    'Idéal pour afficher un compteur de notifications ou un statut "nouveau".',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'ClipRRect (Arrondi)',
                widget: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.orange,
                    width: 100,
                    height: 100,
                    child: const Center(
                      child: Text(
                        'Arrondi',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                sourceCode: '''
ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Container(color: Colors.orange),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/ClipRRect-class.html',
                description:
                    'Un widget qui découpe son enfant avec des coins arrondis. '
                    'Très utile pour arrondir des images ou des conteneurs qui n\'ont pas de propriété borderRadius native.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'Transform (Rotation)',
                widget: Transform.rotate(
                  angle: -0.2,
                  child: Container(
                    color: Colors.purple,
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Rotation',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                sourceCode: '''
Transform.rotate(
  angle: -0.2,
  child: Container(
    color: Colors.purple,
    padding: const EdgeInsets.all(16),
    child: const Text('Rotation', style: TextStyle(color: Colors.white)),
  ),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/Transform-class.html',
                description:
                    'Applique une transformation géométrique à son enfant (rotation, mise à l\'échelle, translation). '
                    'Les transformations sont appliquées juste avant la peinture, ce qui est très performant.',
              ),
            ),
            WidgetShowcase(
              data: WidgetData(
                title: 'RichText',
                widget: RichText(
                  text: TextSpan(
                    text: 'Texte avec ',
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'gras',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ', '),
                      TextSpan(
                        text: 'italique',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                      TextSpan(text: ' et '),
                      TextSpan(
                        text: 'couleur',
                        style: TextStyle(color: Colors.blue),
                      ),
                      TextSpan(text: ' !'),
                    ],
                  ),
                ),
                sourceCode: '''
RichText(
  text: TextSpan(
    text: 'Base ',
    style: DefaultTextStyle.of(context).style,
    children: const <TextSpan>[
      TextSpan(text: 'Gras', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
)''',
                docUrl:
                    'https://api.flutter.dev/flutter/widgets/RichText-class.html',
                description:
                    'Permet d\'afficher un paragraphe avec plusieurs styles différents. '
                    'Le texte est composé de plusieurs TextSpan arborescents.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
