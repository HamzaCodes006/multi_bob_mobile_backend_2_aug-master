import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/Providers/auth_provider.dart';
import 'package:skilled_bob_app_web/authentication/login_screen.dart';
import 'package:skilled_bob_app_web/authentication/register_screen.dart';

import '../Providers/custom_snackbars.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future<String?> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const IndexPage()),
      );

      return "Signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // context.read<CustomSnackBars>().setCustomSnackBar(
        //       title: 'Email Not Exists',
        //       message: 'No user found for that email.',
        //       contentType: ContentType.failure,
        //       context: context,
        //     );
        print('No user found for that email.');
        return 'user-not-found';
      } else if (e.code == 'wrong-password') {
        // context.read<CustomSnackBars>().setCustomSnackBar(
        //       title: 'Wrong password!',
        //       message: 'Wrong password provided.',
        //       contentType: ContentType.failure,
        //       context: context,
        //     );
        // notifyListeners();
        print('Wrong password .');
        return 'wrong-password';
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      return e.message;
    }
  }

  Future<String?> signUp(
      {required name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      var a = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(() => context.read<AuthProvider>().saveUserDataToDB(
              userName: name, email: email, password: password));

      return "Signed up";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // notifyListeners();
        print('The password provided is too weak.');
        return 'weak-password';
      } else if (e.code == 'email-already-in-use') {
        // notifyListeners();
        print('The account already exists for that email.');
        return 'email-already-in-use';
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );

      return e.message;
    }
  }
}
