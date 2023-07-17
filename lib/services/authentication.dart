// ignore_for_file: unused_local_variable, avoid_print, empty_catches

import 'package:firebase_auth/firebase_auth.dart';

import '../models/usermodel.dart';
import 'database.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //
  MyUser? _userFromFirebase(User? user) {
    return user != null
        ? MyUser(uid: user.uid, displayName: user.displayName)
        : null;
  }

  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

//Sign In
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
    } catch (e) {}
  }

//register user
  Future register(String email, String password, String username) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = result.user;
    await DatabaseService(uid: user!.uid)
        .updateUserData(email, password, username);
    String name = username;
    await user.updateDisplayName(username);
    return user;
  }

  //sign Out
  // ignore: non_constant_identifier_names
  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
