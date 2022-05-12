import 'package:flutter/material.dart';
import 'package:speak_up/list_of_text.dart';

class AddTextScreen extends StatefulWidget {
  const AddTextScreen({Key? key}) : super(key: key);

  @override
  State<AddTextScreen> createState() => _AddTextScreenState();
}

class _AddTextScreenState extends State<AddTextScreen> {
  final textController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          label: Text('Go Back'),
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height * .35,
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(20),
                child: Text(
                  'Add New Text',
                  style: TextStyle(
                      fontSize: 22,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
              Container(
                  width: size.width,
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (str) {
                          if (str!.isEmpty) {
                            return "Bruh Add Something";
                          }
                          return null;
                        },
                        // autofocus: true,
                        controller: textController,
                        cursorColor: Colors.indigo,

                        decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(),
                            labelText: "Enter Something",
                            border: UnderlineInputBorder(),
                            icon: Icon(Icons.description_outlined)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton.icon(
                              style: ButtonStyle(
                                  splashFactory: NoSplash.splashFactory),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  ListOfText.listOfTexts
                                      .add(textController.text);

                                  Navigator.pop(context);
                                }
                              },
                              icon: Icon(Icons.save),
                              label: Text('Save'))),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
