import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgetbox/widgets/widget_data.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetShowcase extends StatelessWidget {
  final WidgetData data;

  const WidgetShowcase({super.key, required this.data});

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
            _WidgetShowcaseHeader(data: data),
            const Divider(),
            const SizedBox(height: 16),
            Center(child: data.widget),
          ],
        ),
      ),
    );
  }
}

class _WidgetShowcaseHeader extends StatelessWidget {
  final WidgetData data;

  const _WidgetShowcaseHeader({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(data.title, style: Theme.of(context).textTheme.titleLarge),
        _WidgetShowcaseActions(data: data),
      ],
    );
  }
}

class _WidgetShowcaseActions extends StatelessWidget {
  final WidgetData data;

  const _WidgetShowcaseActions({required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (data.description != null)
          IconButton(
            icon: const Icon(Icons.info_outline),
            tooltip: 'Description & Usage',
            onPressed: () => _showDescription(context),
          ),
        IconButton(
          icon: const Icon(Icons.copy),
          tooltip: 'Copier le code',
          onPressed: () => _copyToClipboard(context),
        ),
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
    );
  }

  void _showDescription(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Description & Usage'),
        content: SingleChildScrollView(child: Text(data.description!)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Fermer'),
          ),
        ],
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
            data.sourceCode,
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
    Clipboard.setData(ClipboardData(text: data.sourceCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code copié dans le presse-papier !'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _launchDocUrl() async {
    final uri = Uri.parse(data.docUrl);
    if (!await launchUrl(uri)) {
      debugPrint('Could not launch ${data.docUrl}');
    }
  }
}
