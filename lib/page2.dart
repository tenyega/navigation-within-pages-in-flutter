import 'package:flutter/material.dart'; 
class Page2 extends StatefulWidget {
var color;
  Page2({required this.color});
@override
State<StatefulWidget> createState() => Page2State(); 
}
class Page2State extends State<Page2> { 
@override
Widget build(BuildContext context) { 
return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        backgroundColor: widget.color, 
      ),
      body: Center(
        child: Text("Contenu page 2"), 
      ),
    ); 
  }
}