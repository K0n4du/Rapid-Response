import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference userdetails =
      FirebaseFirestore.instance.collection('users');
  Future updateUserData(
    String email,
    String password,
    String username,
  ) async {
    return await userdetails.doc(uid).set({
      'email': email,
      'password': password,
      'name': username,
    });
  }

  Stream<QuerySnapshot> get users {
    return userdetails.snapshots();
  }
}
