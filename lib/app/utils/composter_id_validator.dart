import 'package:firebase_database/firebase_database.dart';

Future<bool> isValidComposterId(String composterId) async {

  final ref = FirebaseDatabase.instance.ref();
  final snapshot = await ref.child('composters/$composterId').get();
  if (snapshot.exists) {
    return true;
  } else {
    return false;
  }
}