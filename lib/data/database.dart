import 'package:cloud_firestore/cloud_firestore.dart';

//UserCredential userCredential = await FirebaseAuth.instance.signInAnonymously();

class Database {
  Database._internal();
  static final Database _instance = Database._internal();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  factory Database() => _instance;

  /* Jokainen event streamataan firestoresta, QuerySnapshot pitää sisällään koko collectionin.
  Käytä tätä StreamBuilder widgetin kanssa näyttääksesi dynaamisen listan (jonka voi sitten pistää listviewiin jne..)*/

  Stream<QuerySnapshot> getItems() {
    return _db.collection('Tsasounat').snapshots();
  }

  Stream<QuerySnapshot> saveFormItem(String name, String year, String county) {
    _db
        .collection('Tsasounat')
        .doc()
        .set({'name': name, 'year': year, 'county': county});
  }
}
