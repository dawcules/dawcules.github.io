import 'package:flutter/material.dart';
import 'dummy_add_tsasouna.dart';
import 'tsasouna_map.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title, this.documents}) : super(key: key);

  final String title;
  final documents;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                  widget.documents['name'],
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rakennusvuosi: ' + widget.documents['year'],
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  'Paikkakunta: ' + widget.documents['county'],
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
                RaisedButton(
                  child: Text('Lomake'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DummyForm()),
                    );
                  },
                ),
                RaisedButton(
                  child: Text('Kartta'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TsasounaMap()),
                    );
                  },
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
