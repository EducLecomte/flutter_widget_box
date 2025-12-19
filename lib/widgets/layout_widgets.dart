import 'package:flutter/material.dart';

class LayoutWidgetsPage extends StatelessWidget {
  const LayoutWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Widgets'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle(context, 'Container'),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                border: Border.all(color: Colors.blue.shade800),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Un Container avec décoration'),
            ),
            _buildSectionTitle(context, 'Row & Column'),
            const Text('Row (avec défilement horizontal) :'),
            SingleChildScrollView(
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
            const SizedBox(height: 16),
            const Text('Column (dans un SingleChildScrollView vertical) :'),
            const Column(
              children: [
                Text('Element 1'),
                Text('Element 2'),
                Text('Element 3'),
              ],
            ),
            _buildSectionTitle(context, 'Stack'),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(width: 100, height: 100, color: Colors.red),
                Container(width: 80, height: 80, color: Colors.green),
                Container(width: 60, height: 60, color: Colors.blue),
              ],
            ),
            _buildSectionTitle(context, 'Expanded'),
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
            ),
            _buildSectionTitle(context, 'Card'),
            const Card(
              child: ListTile(
                leading: Icon(Icons.album),
                title: Text('Titre de la carte'),
                subtitle: Text('Sous-titre de la carte'),
              ),
            ),
            _buildSectionTitle(context, 'Wrap'),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: List.generate(10, (index) => Chip(
                label: Text('Tag ${index + 1}'),
                backgroundColor: Colors.teal[100],
              )),
          ),
          _buildSectionTitle(context, 'GridView'),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            children: List.generate(9, (index) {
              return Container(
                color: Colors.green[100 * (index % 9 + 1)],
                child: Center(
                  child: Text('Item ${index + 1}'),
                ),
              );
            }),
            ),
            _buildSectionTitle(context, 'Table'),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge),
          const Divider(),
        ],
      ),
    );
  }
}