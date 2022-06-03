import 'package:flutter/material.dart';

import 'package:seeds_catalog/ui/screens/create_seed_screen.dart';
import 'package:seeds_catalog/ui/screens/login_screen.dart';
import 'package:seeds_catalog/ui/screens/seed_detail_screen.dart';

class SeedsListScreen extends StatelessWidget {
  const SeedsListScreen({Key? key}) : super(key: key);

  static const routeName = '/seedsListScreen';
  static const List<String> test = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          print('Filter pressed');
                          //TODO: add filter behaviour
                        },
                        icon: const Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 4),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.search),
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: 'Seed name',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, LoginScreen.routeName);
                        },
                        icon: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ListTile(
                            title: Text(test[index]),
                            subtitle: const Text('data'),
                            trailing: IconButton(
                              icon: const Icon(Icons.refresh),
                              onPressed: () {
                                print('Refresh pressed');
                                //TODO: add refresh behaviour
                              },
                              color: Colors.red.shade700,
                            ),
                            onTap: (){
                              Navigator.pushNamed(context, SeedDetailScreen.routeName);
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Divider(
                          thickness: 2,
                        ),
                      ],
                    );
                  },
                  itemCount: test.length,
                ),
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
                    Navigator.pushNamed(context, CreateSeedScreen.routeName);
                  },
                  child: const Text('Create new entry'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
