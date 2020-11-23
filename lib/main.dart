import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text('oops');
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'TsasounaWeb',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: StreamBuilder(
                  stream:
                      Database().getItems(), // Get notifications from Firebase
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      print(snapshot.error);
                    }
                    if (!snapshot.hasData) return const Text('Loading..');
                    return MyHomePage(
                        title: 'Tsasouna Web!',
                        name: snapshot.data.documents[0]['name']);
                  }),
            );
          }
          return CircularProgressIndicator();
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.name}) : super(key: key);

  final String title;
  final String name;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.lightBlue[100],
          ),
          padding: EdgeInsets.all(70),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.lightGreen[100],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset('assets/russiachurch.jpg',
                        fit: BoxFit.fitWidth, width: 450),
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  widget.name,
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rakennusvuosi 1897',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Paikkakunta: Jyväskylä',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Lisätietorivi tiedoilla',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Lisätietorivi tiedoilla',
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Lisätietorivi tiedoilla',
                  style: TextStyle(fontSize: 28),
                ),
                Padding(padding: EdgeInsets.all(8))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
