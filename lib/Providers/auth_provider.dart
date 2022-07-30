import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  String pickerError = '';
  bool isPicAvail = false;
  // File newImage;
  // double shopLatitude;
  // double shopLongitude;
  // String shopAddress;
  // String placeName;
  // String countryName;
  // String locality;
  // String featureName;
  // String adminArea;
  // String postalCode;
  late String email;
  late String password;
  String error = '';
  String pickError = '';

  //Register user using email/password
  Future<UserCredential?> registerVendor(email, password) async {
    this.email = email;
    notifyListeners();
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        this.error = 'The password provided is too weak.';
        notifyListeners();
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        this.error = 'The account already exists for that email.';
        notifyListeners();
        print('The account already exists for that email.');
      }
    } catch (e) {
      this.error = e.toString();
      notifyListeners();
      // print(e.toString());
    }
    return userCredential;
  }

  //Login user using email/password
  Future<UserCredential?> loginUser(email, password) async {
    this.email = email;
    notifyListeners();
    UserCredential? userCredential;
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Navigator.pushReplacementNamed(context, HomeScreen.id);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        this.error = 'No user found for that email.';
        notifyListeners();
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        this.error = 'Wrong password provided .';
        notifyListeners();
        print('Wrong password .');
        print(error);
      }
    }
    // } catch (e) {
    //   this.error = e.toString();
    //   notifyListeners();
    //   print(e);
    // }
    return userCredential;
  }

  //Save user data to DB
  Future<void> saveUserDataToDB({
    required String userName,
    required String email,
    required String password,
    // bool shopCreated,
  }) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      DocumentReference _users =
          FirebaseFirestore.instance.collection('Users').doc(user?.uid);
      _users
          .set({
            'userName': userName,
            'email': email,
            'password': password,
            'firstName': '',
            'lastName': '',
            'mobileNumber': '',
            'telephoneNumber': '',
            'address': '',
            'city': '',
            'state': '',
            'country': '',
            'profileURL': 'default',
            'provider': false,
          })
          .then((value) => print('User Added Successfully!!'))
          .catchError((onError) {
            print('User Not added Successfully!!');
          });
    } catch (e) {
      print("product added exception is:::::::::::::::::: $e");
    }
  }

  // //Update buyer data to DB
  // Future<void> updateBuyerDataToDB({
  //   String shopCategory,
  //   bool shopCreated,
  // }) async {
  //   User user = FirebaseAuth.instance.currentUser;
  //   DocumentReference _buyers =
  //   FirebaseFirestore.instance.collection('Buyers').doc(user.uid);
  //   _buyers.update({
  //     'shopCategory': shopCategory,
  //     'shopCreated': shopCreated,
  //   });
  // }

  // //get image from gallery
  // final ImagePicker _picker = ImagePicker();
  //
  // Future getImage() async {
  //
  //   final XFile image = await _picker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 20);
  //   if (image != null) {
  //     newImage = File(image.path);
  //     notifyListeners();
  //     print(newImage);
  //   }
  //   else {
  //     this.pickError = 'no image selected!';
  //     print('no image selected!');
  //     notifyListeners();
  //   }
  //   // final file = image.toFile();
  //   return newImage;
  // }

  // Future getCurrentAddress() async {
  //   Location location = new Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //
  //   _locationData = await location.getLocation();
  //   this.shopLatitude = _locationData.latitude;
  //   this.shopLongitude = _locationData.longitude;
  //   notifyListeners();
  //   // From coordinates
  //   final coordinates =
  //   new Coordinates(_locationData.latitude, _locationData.longitude);
  //   var _addresses =
  //   await Geocoder.local.findAddressesFromCoordinates(coordinates);
  //   var shopAddress = _addresses.first;
  //   this.shopAddress = shopAddress.addressLine;
  //   this.placeName = shopAddress.featureName;
  //   this.countryName = shopAddress.countryName;
  //   this.locality = shopAddress.locality;
  //   this.postalCode = shopAddress.postalCode;
  //   this.featureName = shopAddress.featureName;
  //   this.adminArea = shopAddress.adminArea;
  //   // print('dekho----------->${shopAddress.}');
  //   notifyListeners();
  //   return shopAddress;
  // }
  //

}
