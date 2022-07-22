import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ProfileData {
  String _userName = '';
  String _email = '';
  String _profileURL = '';

  String get userName => _userName;

  String get email => _email;

  String get profileURL => _profileURL;

  Stream<Map<String, dynamic>?> setDashboardData() {
    return FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((event) => event.data());
    //     .forEach((element) {
    //   _userName = element.get('userName');
    //   _email = element.get('email');
    //   _profileURL = element.get('profileURL');
    //   print('nofity calls');
    //   // notifyListeners();
    // });
    // return _userName as Stream<String>;
  }
}
