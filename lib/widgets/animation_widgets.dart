import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_widgetbox/widgets/widget_showcase.dart';

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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(children: [
            WidgetShowcase(
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
              docUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedContainer-class.html',
            ),
            WidgetShowcase(
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
              docUrl: 'https://api.flutter.dev/flutter/widgets/AnimatedOpacity-class.html',
            ),
          ]),
          ),
        ),
      )
    ;
  }
}