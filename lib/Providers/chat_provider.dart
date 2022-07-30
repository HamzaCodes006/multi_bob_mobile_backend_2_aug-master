import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  // String _buyerEmail = '';
  // String _buyerUid = '';
  // String _sellerEmail = '';
  // String _sellerUid = '';
  // String _sellerName = '';
  // String _buyerName = '';

  String _customerUid = '';
  String _customerEmail = '';
  String _customerName = '';
  String _customerProfileURL = '';

  String _providerUid = '';
  String _providerEmail = '';
  String _providerName = '';
  String _providerProfileURL = '';

  String get customerUid => _customerUid;
  String get customerEmail => _customerEmail;
  String get customerName => _customerName;
  String get customerProfileURL => _customerProfileURL;

  String get providerUid => _providerUid;
  String get providerEmail => _providerEmail;
  String get providerName => _providerName;
  String get providerProfileURL => _providerProfileURL;

  var customerCollection = FirebaseFirestore.instance.collection('Users');

  setCustomerUidAndEmail(String Uid) async {
    // var chatCollection=customerCollection.doc(Uid).collection('Chat');
    _customerUid = Uid;
    var docSnapshot = await customerCollection.doc(Uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      _customerEmail = data!['email'];
      _customerName = data!['userName'];
      _customerProfileURL = data!['profileURL'];
    }
    notifyListeners();
  }

  setProviderUidAndEmail(String Uid) async {
    _providerUid = Uid;
    var docSnapshot = await customerCollection.doc(Uid).get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      _providerEmail = data!['email'];
      _providerName = data!['userName'];
      _providerProfileURL = data!['profileURL'];
    }
    notifyListeners();
  }
}
