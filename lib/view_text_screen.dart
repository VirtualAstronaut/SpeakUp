import 'package:flutter/material.dart';

class ViewTextScreen extends StatefulWidget {
  const ViewTextScreen({Key? key, required this.text, required this.heroTag})
      : super(key: key);
  final String text;
  final String heroTag;

  @override
  State<ViewTextScreen> createState() => _ViewTextScreenState();
}

class _ViewTextScreenState extends State<ViewTextScreen> {
  double fontSize = 35;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        elevation: 0,
        label: Text('Go Back'),
        icon: Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          Container(
            height: size.height * .65,
            color: Theme.of(context).colorScheme.primaryContainer,
            width: size.width,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Hero(
              tag: widget.heroTag,
              child: DefaultTextStyle(
                style: TextStyle(
                  decoration: TextDecoration.none,
                ),
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Font Size',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          Slider(
              min: 10,
              max: 60,
              activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
              value: fontSize,
              onChanged: (newVal) {
                setState(() {
                  fontSize = newVal;
                });
              })
        ],
      ),
    );
  }
}
