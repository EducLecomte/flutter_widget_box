import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/main.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';

class AnimationWidgetsPage extends StatefulWidget {
  const AnimationWidgetsPage({super.key});

  @override
  State<AnimationWidgetsPage> createState() => _AnimationWidgetsPageState();
}

class _AnimationWidgetsPageState extends State<AnimationWidgetsPage> {
  // Propriétés pour AnimatedContainer
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  // Propriété pour AnimatedOpacity
  bool _visible = true;

  // Propriété pour AnimatedAlign
  bool _alignedTop = true;

  // Propriété pour AnimatedCrossFade
  bool _showFirst = true;

  // Propriété pour AnimatedDefaultTextStyle
  bool _isLargeText = false;

  // Propriété pour AnimatedSwitcher
  int _count = 0;

  void _animateContainer() {
    setState(() {
      final random = Random();
      _width = random.nextDouble() * 200 + 50;
      _height = random.nextDouble() * 200 + 50;
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextDouble() * 50);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Widgets'),
        actions: const [ThemeSwitchButton()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              WidgetShowcase(
                data: WidgetData(
                  title: 'AnimatedContainer',
                  widget: Column(
                    children: [
                      AnimatedContainer(
                        width: _width,
                        height: _height,
                        decoration: BoxDecoration(
                          color: _color,
                          borderRadius: _borderRadius,
                        ),
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _animateContainer,
                        child: const Text('Animer le conteneur'),
                      ),
                    ],
                  ),
                  sourceCode: '''
AnimatedContainer(
  width: _width,
  height: _height,
  decoration: BoxDecoration(
    color: _color,
    borderRadius: _borderRadius,
  ),
  duration: const Duration(seconds: 1),
  curve: Curves.fastOutSlowIn,
)

ElevatedButton(
  onPressed: _animateContainer,
  child: const Text('Animer le conteneur'),
)''',
                  docUrl:
                      'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
                  description:
                      'Une version animée du widget Container. '
                      'Il change automatiquement ses propriétés (taille, couleur, bordure) avec une interpolation fluide sur la durée spécifiée.',
                ),
              ),
              WidgetShowcase(
                data: WidgetData(
                  title: 'AnimatedOpacity',
                  widget: Column(
                    children: [
                      AnimatedOpacity(
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: const FlutterLogo(size: 100),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                          });
                        },
                        child: const Text('Afficher/Masquer'),
                      ),
                    ],
                  ),
                  sourceCode: '''
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 500),
  child: const FlutterLogo(size: 100),
)

ElevatedButton(
  onPressed: () { setState(() { _visible = !_visible; }); },
  child: const Text('Afficher/Masquer'),
)''',
                  docUrl:
                      'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
                  description:
                      'Rend son enfant partiellement ou totalement transparent avec une animation. '
                      'Très performant car il modifie uniquement l\'opacité sans avoir à redessiner l\'enfant.',
                ),
              ),
              WidgetShowcase(
                data: WidgetData(
                  title: 'AnimatedAlign',
                  widget: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 100,
                        color: Colors.grey[200],
                        child: AnimatedAlign(
                          alignment: _alignedTop
                              ? Alignment.topLeft
                              : Alignment.bottomRight,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeInOut,
                          child: const FlutterLogo(size: 40),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _alignedTop = !_alignedTop;
                          });
                        },
                        child: const Text('Changer l\'alignement'),
                      ),
                    ],
                  ),
                  sourceCode: '''
Container(
  width: 200,
  height: 100,
  color: Colors.grey[200],
  child: AnimatedAlign(
    alignment: _alignedTop ? Alignment.topLeft : Alignment.bottomRight,
    duration: const Duration(seconds: 1),
    curve: Curves.easeInOut,
    child: const FlutterLogo(size: 40),
  ),
)

ElevatedButton(
  onPressed: () { setState(() { _alignedTop = !_alignedTop; }); },
  child: const Text('Changer l\\'alignement'),
)''',
                  docUrl:
                      'https://api.flutter.dev/flutter/widgets/AnimatedAlign-class.html',
                  description:
                      'Déplace son enfant vers une nouvelle position d\'alignement (par exemple de haut-gauche à bas-droite) '
                      'en animant le changement.',
                ),
              ),
              WidgetShowcase(
                data: WidgetData(
                  title: 'AnimatedCrossFade',
                  widget: Column(
                    children: [
                      AnimatedCrossFade(
                        duration: const Duration(seconds: 1),
                        firstChild: Container(
                          height: 100,
                          width: 100,
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: const Text(
                            'Premier',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        secondChild: Container(
                          height: 100,
                          width: 100,
                          color: Colors.green,
                          alignment: Alignment.center,
                          child: const Text(
                            'Second',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        crossFadeState: _showFirst
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _showFirst = !_showFirst;
                          });
                        },
                        child: const Text('CrossFade'),
                      ),
                    ],
                  ),
                  sourceCode: '''
AnimatedCrossFade(
  duration: const Duration(seconds: 1),
  firstChild: Container(
    height: 100,
    width: 100,
    color: Colors.blue,
    child: const Center(child: Text('Premier')),
  ),
  secondChild: Container(
    height: 100,
    width: 100,
    color: Colors.green,
    child: const Center(child: Text('Second')),
  ),
  crossFadeState: _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
)

ElevatedButton(
  onPressed: () { setState(() { _showFirst = !_showFirst; }); },
  child: const Text('CrossFade'),
)''',
                  docUrl:
                      'https://api.flutter.dev/flutter/widgets/AnimatedCrossFade-class.html',
                  description:
                      'Effectue une transition en fondu enchaîné (cross-fade) entre deux enfants différents. '
                      'Idéal pour basculer en douceur entre deux états (ex: chargement / contenu).',
                ),
              ),
              WidgetShowcase(
                data: WidgetData(
                  title: 'AnimatedDefaultTextStyle',
                  widget: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        child: Center(
                          child: AnimatedDefaultTextStyle(
                            style: _isLargeText
                                ? const TextStyle(
                                    fontSize: 40,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  )
                                : const TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal,
                                  ),
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceOut,
                            child: const Text('Flutter'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isLargeText = !_isLargeText;
                          });
                        },
                        child: const Text('Changer le style'),
                      ),
                    ],
                  ),
                  sourceCode: '''
AnimatedDefaultTextStyle(
  style: _isLargeText
      ? const TextStyle(fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold)
      : const TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.normal),
  duration: const Duration(milliseconds: 500),
  curve: Curves.bounceOut,
  child: const Text('Flutter'),
)

ElevatedButton(
  onPressed: () { setState(() { _isLargeText = !_isLargeText; }); },
  child: const Text('Changer le style'),
)''',
                  docUrl:
                      'https://api.flutter.dev/flutter/widgets/AnimatedDefaultTextStyle-class.html',
                  description:
                      'Anime les changements de style de texte (taille, couleur, poids) pour tous les widgets Text descendants '
                      'qui utilisent le DefaultTextStyle.',
                ),
              ),
              WidgetShowcase(
                data: WidgetData(
                  title: 'AnimatedSwitcher',
                  widget: Column(
                    children: [
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                                return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                );
                              },
                          child: Text(
                            '$_count',
                            key: ValueKey<int>(_count),
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _count += 1;
                          });
                        },
                        child: const Text('Incrémenter'),
                      ),
                    ],
                  ),
                  sourceCode: '''
AnimatedSwitcher(
  duration: const Duration(milliseconds: 500),
  transitionBuilder: (Widget child, Animation<double> animation) {
    return ScaleTransition(scale: animation, child: child);
  },
  child: Text(
    '\$_count',
    key: ValueKey<int>(_count),
    style: Theme.of(context).textTheme.headlineMedium,
  ),
)

ElevatedButton(
  onPressed: () { setState(() { _count += 1; }); },
  child: const Text('Incrémenter'),
)''',
                  docUrl:
                      'https://api.flutter.dev/flutter/widgets/AnimatedSwitcher-class.html',
                  description:
                      'Effectue une transition animée lorsqu\'on remplace un enfant par un autre. '
                      'Par défaut c\'est un fondu, mais on peut personnaliser la transition (ici une mise à l\'échelle/Scale).',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
