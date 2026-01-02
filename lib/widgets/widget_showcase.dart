import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetShowcase extends StatelessWidget {
  /// Le nom du widget à afficher.
  final String title;

  /// L'instance du widget à présenter.
  final Widget widget;

  /// Le code source brut de l'exemple.
  final String sourceCode;

  /// L'URL vers la documentation officielle du widget.
  final String docUrl;

  const WidgetShowcase({
    super.key,
    required this.title,
    required this.widget,
    required this.sourceCode,
    required this.docUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleLarge),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.code),
                      tooltip: 'Voir le code',
                      onPressed: () => _showSourceCode(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.link),
                      tooltip: 'Documentation',
                      onPressed: _launchDocUrl,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 16),
            // Centre le widget de démo pour une meilleure présentation
            Center(child: widget),
          ],
        ),
      ),
    );
  }

  void _showSourceCode(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Code Source'),
        content: SingleChildScrollView(
          child: Text(
            sourceCode,
            style: const TextStyle(fontFamily: 'monospace'),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => _copyToClipboard(context),
            child: const Text('Copier'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: sourceCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copié dans le presse-papier !'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _launchDocUrl() async {
    final uri = Uri.parse(docUrl);
    if (!await launchUrl(uri)) {
      // Idéalement, afficher un SnackBar ou une alerte si l'URL ne peut être lancée.
      debugPrint('Could not launch $docUrl');
    }
  }
}
