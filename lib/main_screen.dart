import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speak_up/add_text_screen.dart';
import 'package:speak_up/list_of_text.dart';
import 'package:speak_up/main.dart';
import 'package:speak_up/view_text_screen.dart';
import 'package:translator/translator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isTransalating = false;
  String oldLanguage = "en";
  bool isToAnimate = false;
  final translator = GoogleTranslator();
  String languageDropDownCurrentValue =
      ListOfLanguageCodes.listOfCode.first["code"];

  String currentLanguage = "en";
  late final SharedPreferences sharedPrefs;
  @override
  void initState() {
    super.initState();
    initializeSharedPrefs();
  }

  void initializeSharedPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
    if (sharedPrefs.containsKey('list_of_texts')) {
      ListOfText.listOfTexts = sharedPrefs.getStringList("list_of_texts")!;
    }
    if (sharedPrefs.containsKey('lang')) {
      currentLanguage = sharedPrefs.getString('lang')!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(
            color: Colors.transparent,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                trailing: IconButton(
                    onPressed: () async {
                      bool? isItemDeleted = await showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text('Delete This Item?'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context, true);
                                    },
                                    child: const Text('Yes')),
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('No')),
                              ],
                            );
                          });
                      if (isItemDeleted != null) {
                        setState(() {
                          ListOfText.listOfTexts.removeAt(index);
                        });
                        sharedPrefs.setStringList(
                            'list_of_texts', ListOfText.listOfTexts);
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ViewTextScreen(
                              heroTag: index.toString(),
                              text: ListOfText.listOfTexts[index])));
                },
                tileColor: Theme.of(context).colorScheme.primaryContainer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: const EdgeInsets.all(10),
                title: Hero(
                  tag: index.toString(),
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      decoration: TextDecoration.none,
                    ),
                    child: Text(
                      ListOfText.listOfTexts[index],
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                // subtitle: Text('Last Used'),
              ),
            );
          },
          itemCount: ListOfText.listOfTexts.length,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () async {
                    await showModalBottomSheet(
                        barrierColor: Colors.indigo.withOpacity(.3),
                        // isDismissible: false,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(20),
                                topRight: const Radius.circular(20))),
                        context: context,
                        builder: (_) {
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return Container(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                height: 250,
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          icon: const Icon(Icons.close)),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Translate',
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimaryContainer,
                                          ),
                                        ),
                                        DropdownButton<String>(
                                            underline: Divider(
                                              height: 2,
                                              thickness: 1,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                            ),
                                            icon: const Icon(Icons.translate),
                                            menuMaxHeight: 300,
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                            ),
                                            elevation: 1,
                                            value: currentLanguage,
                                            dropdownColor: Theme.of(context)
                                                .colorScheme
                                                .primaryContainer,
                                            items: ListOfLanguageCodes
                                                .listOfCode
                                                .map((e) =>
                                                    DropdownMenuItem<String>(
                                                        value: e["code"],
                                                        child: Text(e["lang"])))
                                                .toList(),
                                            onChanged: (newValue) {
                                              setState(() {
                                                currentLanguage = newValue!;
                                              });
                                            })
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Made with Love in India 🇮🇳 \n By Virtual Astronaut",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimaryContainer,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        });
                    if (currentLanguage != oldLanguage) {
                      try {
                        List<String> translatedTexts = [];
                        setState(() {
                          isTransalating = true;
                        });
                        for (var i = 0;
                            i < ListOfText.listOfTexts.length;
                            i++) {
                          translatedTexts.add((await translator.translate(
                                  ListOfText.listOfTexts[i],
                                  to: currentLanguage))
                              .text);
                        }
                        setState(() {
                          isTransalating = false;
                        });
                        ListOfText.listOfTexts = translatedTexts;
                        oldLanguage = currentLanguage;
                        sharedPrefs.setStringList(
                            'list_of_texts', ListOfText.listOfTexts);
                        sharedPrefs.setString("lang", currentLanguage);
                        setState(() {});
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.indigo,
                  )),
              Text(
                isTransalating ? 'Translating Please Wait' : 'Speak Up !',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: 17),
              ),
              OpenContainer(
                  onClosed: (data) {
                    sharedPrefs.setStringList(
                        "list_of_texts", ListOfText.listOfTexts);
                    setState(() {});
                  },
                  openElevation: 0,
                  middleColor: Colors.transparent,
                  closedElevation: 0,
                  closedColor: Colors.transparent,
                  // closedShape: const StadiumBorder(),
                  closedBuilder: (c, action) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: FloatingActionButton.extended(
                          backgroundColor: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.3),
                          onPressed: action,
                          elevation: 0,
                          icon: const Icon(Icons.add),
                          label: const Text('Add'),
                        ),
                      ),
                  openBuilder: (c, action) => const AddTextScreen()),
            ],
          ),
        ),
      ),
    );
  }
}
