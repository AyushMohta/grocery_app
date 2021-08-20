import 'package:cloud_firestore/cloud_firestore.dart';

class UserModal {
  static const NUMBER = 'number';
  static const ID = 'id';

  String _number;
  String _id;

  String get number => number;
  String get id => id;

  UserModal.fromSnapshot(DocumentSnapshot snapshot) {
    _number = snapshot.data();
    _id = snapshot.data();
  }
}
