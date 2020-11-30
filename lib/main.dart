import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'stream/streambuilder_content.dart';

void main() {
  runApp(TsWeb());
}

class TsWeb extends StatelessWidget {
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
            print(snapshot.error);
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'TsasounaWeb',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: Scaffold(body: StreamBuilderContent()),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
