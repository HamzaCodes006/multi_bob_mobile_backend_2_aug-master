import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/authentication/login_screen.dart';

class AuthenticationCheck extends StatelessWidget with ChangeNotifier {
  static const String id = 'AuthenticationCheck';
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    notifyListeners();

    if (firebaseUser != null) {
      notifyListeners();
      return const IndexPage();
    }
    notifyListeners();
    return const LoginScreen();
  }
}
