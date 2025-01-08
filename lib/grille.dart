import 'package:flutter/material.dart';

class Grille extends StatefulWidget {
  var color;
  Grille({required this.color});
  @override
  State<StatefulWidget> createState() => GrilleState();
}

class GrilleState extends State<Grille> {
  var entries = <int>[1, 2, 3, 4, 5, 6];
  var colorCodes = <int>[100, 400, 700, 800, 900, 1000];
  var Orientation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List page"),
        backgroundColor: widget.color,
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                // Retrieve the current orientation
                var orientation = MediaQuery.of(context).orientation;

                // Print the orientation (optional)
                print(orientation);

                // Navigate to a new screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: Text("Detail Page")),
                      body: Center(
                        child: Container(
                          height: 50,
                          color: Colors.amber[colorCodes[index]],
                          child: Card(
                            color: const Color.fromARGB(255, 138, 173, 139),
                            child: Center(
                              child: Text('Entry ${entries[index]}'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
