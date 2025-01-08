import 'package:flutter/material.dart';
import 'page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
                onPressed: () {
                  _showAlert(context); // Showing an alert box with a ok button
                },
                child: Text("Appeler une Alert")),
            ElevatedButton(
                onPressed: () {
                  _showDialog(
                      context); // this will list different lines de text with ok button
                },
                child: Text("Show dialog")),
            ElevatedButton(
                onPressed: () {
                  var page2 = Page2(
                    color: Colors.amber,
                  );
                  Navigator.of(context) // this is to get access to the page 2
                      .push(MaterialPageRoute(builder: (BuildContext ctx) {
                    return page2;
                  }));
                },
                child: Text("Appeler page 2")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //final snackBar = SnackBar(content: Text("un snackBar")); // snackbar with just one string.
          final snackBar = createSnack(
              text:
                  "another snackbar"); // having a snack bar with a text and an icon

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        tooltip: 'Increment', // message thats shown on hover over the icon.
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  SnackBar createSnack({required String text}) {
    var content = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text),
        Icon(
          Icons.home_outlined,
          color: Colors.yellow,
        ),
      ],
    );
    return SnackBar(content: content);
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!!"),
          content: Text("You are awesome!"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  SimpleDialog _createSimple() {
    var simple = SimpleDialog(
      title: Text("Mon dialogue"),
      children: [
        Text("Ligne du dialogue"),
        Divider(),
        Text("ligne 2"),
        SimpleDialogOption(
          onPressed: () {
            print("clic"); // this is shown at the console side.
            Navigator.of(context).pop(); // ferme la fenêtre
          },
          child: Text("OK"), // this action is on child text
        )
      ],
    );
    return simple;
  }

  Future<void> _showDialog(BuildContext context) async {
    // future is used to wait for the dialog to be closed.
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return _createSimple();
      },
    );
  }
}
