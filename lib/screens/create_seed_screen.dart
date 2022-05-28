import 'package:flutter/material.dart';

class CreateSeedScreen extends StatefulWidget {
  const CreateSeedScreen({Key? key}) : super(key: key);

  static const routeName = '/createSeedScreen';

  @override
  State<CreateSeedScreen> createState() => _CreateSeedScreenState();
}

class _CreateSeedScreenState extends State<CreateSeedScreen> {
  final TextEditingController _manufacturingDateController =
      TextEditingController();
  final TextEditingController _expireDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Seed Screen'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Seed name'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Manufacturer Name'),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _manufacturingDateController,
                        readOnly: true,
                        enableInteractiveSelection: false,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: Colors.black,
                        )),
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          ).then((date) {
                            if (date == null) return;
                            _manufacturingDateController.text = date.toString();
                          });
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _expireDateController,
                        readOnly: true,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.arrow_drop_down_sharp,
                              color: Colors.black,
                            )),
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2030),
                          ).then((date) {
                            if (date == null) return;
                            _expireDateController.text = date.toString();
                          });
                        },
                      ),
                    ],
                  ),
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
                    Navigator.pop(context);
                  },
                  child: const Text('Create new Seed'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _manufacturingDateController.dispose();
    _expireDateController.dispose();
  }
}