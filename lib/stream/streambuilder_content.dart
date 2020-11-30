import 'package:flutter/material.dart';
import '../data/database.dart';
import '../pages/main_page.dart';

class StreamBuilderContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Database().getItems(), // Get tsasouna listings from Firebase
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          if (!snapshot.hasData) return const Text('Loading..');
          return MainPage(
              title: 'Tsasouna Web!', documents: snapshot.data.documents[0]);
        });
  }
}
