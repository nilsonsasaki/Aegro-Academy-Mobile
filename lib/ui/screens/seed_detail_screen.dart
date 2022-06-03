import 'package:flutter/material.dart';

class SeedDetailScreen extends StatelessWidget {
  SeedDetailScreen({Key? key}) : super(key: key);

  static const routeName = '/seedsDetailScreen';

  final Map<String, String> seedsDetails = {
    'Name:': 'Value',
    'Manufacturer:': 'Value',
    'Manufactured at:': 'Value',
    'Expires in:': 'Value',
    'Created at:': 'Value'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seed Details'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(seedsDetails.keys.elementAt(0)),
                      trailing: Text(seedsDetails.values.elementAt(0)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(seedsDetails.keys.elementAt(1)),
                      trailing: Text(seedsDetails.values.elementAt(1)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(seedsDetails.keys.elementAt(2)),
                      trailing: Text(seedsDetails.values.elementAt(2)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(seedsDetails.keys.elementAt(3)),
                      trailing: Text(seedsDetails.values.elementAt(3)),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: Text(seedsDetails.keys.elementAt(4)),
                      trailing: Text(seedsDetails.values.elementAt(4)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 10),
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Return'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
