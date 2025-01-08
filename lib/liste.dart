import 'package:flutter/material.dart';

class Liste extends StatefulWidget {
  var color;
  Liste({required this.color});
  @override
  State<StatefulWidget> createState() => ListeState();
}

class ListeState extends State<Liste> {
  var entries = <int>[1, 2, 3, 4, 5];
  var colorCodes = <int>[100, 400, 700, 800, 900];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List page"),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            }),
      ),
    );
  }
}
