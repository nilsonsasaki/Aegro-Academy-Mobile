import 'package:flutter/material.dart';
import 'package:seeds_catalog/screens/loginScreen.dart';

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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            prefixIcon: const Icon(Icons.search),
                            contentPadding: const EdgeInsets.only(left: 10),
                            hintText: 'Seed name',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 3,
                                  color: Colors.green,
                                ),
                                borderRadius: BorderRadius.circular(15)),
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
                            // tileColor: Colors.green,
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
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () {
                    //TODO: add create entry behaviour
                    print('Create new seed pressed');
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
