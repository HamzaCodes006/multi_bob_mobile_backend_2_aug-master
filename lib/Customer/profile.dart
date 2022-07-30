import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Providers/custom_snackbars.dart';
import 'package:skilled_bob_app_web/Providers/location_provider.dart';
import 'package:skilled_bob_app_web/something_went_wrong.dart';

import 'CustomAnimation.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController userName = TextEditingController();

  TextEditingController firstName = TextEditingController();

  TextEditingController lastName = TextEditingController();

  TextEditingController mobileNumber = TextEditingController();

  TextEditingController telephoneNumber = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController address = TextEditingController();

  TextEditingController city = TextEditingController();

  TextEditingController state = TextEditingController();

  TextEditingController country = TextEditingController();

  File? image;
  final _formKey = GlobalKey<FormState>();
  Timer? _timer;
  String? _profileURL;
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _mobileNumber;
  String? _telephoneNumber;
  String? _email;
  String? _address;
  String? _state;
  String? _city;
  String? _country;
  String currentUserUId = FirebaseAuth.instance.currentUser!.uid;

  // TODO:controllers ko update krna ha firebase me upload krna ha
  @override
  void dispose() {
    // TODO: implement dispose
    userName.dispose();
    firstName.dispose();
    lastName.dispose();
    mobileNumber.dispose();
    telephoneNumber.dispose();
    email.dispose();
    address.dispose();
    city.dispose();
    state.dispose();
    country.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    EasyLoading.addStatusCallback((status) {
      print('EasyLoading Status $status');
      if (status == EasyLoadingStatus.dismiss) {
        _timer?.cancel();
      }
    });
    context.read<LocationProvider>().getCurrentAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.95),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.blueAccent),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.blueAccent,
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.blue,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Center(
            child: Text(
              'My Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Image.asset(
                  'images/user profile.png',
                  color: Colors.transparent,
                  height: 30,
                  width: 26,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Users')
                  .doc(currentUserUId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const SomethingWentWrong();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData) {
                  _profileURL = snapshot.data!.get('profileURL').toString();
                  userName.text = snapshot.data!.get('userName').toString();
                  firstName.text = snapshot.data!.get('firstName').toString();
                  lastName.text = snapshot.data!.get('lastName').toString();
                  mobileNumber.text =
                      snapshot.data!.get('mobileNumber').toString();
                  telephoneNumber.text =
                      snapshot.data!.get('telephoneNumber').toString();
                  email.text = snapshot.data!.get('email').toString();
                  _userName = userName.text;
                  _firstName = firstName.text;
                  _lastName = lastName.text;
                  _mobileNumber = mobileNumber.text;
                  _telephoneNumber = telephoneNumber.text;
                  _email = email.text;
                  _address = address.text;
                  _state = state.text;
                  _city = city.text;
                  _country = country.text;

                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'User Avatar:',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                getImage();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  //color: Colors.blue,
                                ),
                                width: 180,
                                height: 140,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: snapshot.data!.get('profileURL') ==
                                          'default'
                                      ? image == null
                                          ? const Icon(
                                              Icons.person,
                                              color: Colors.grey,
                                              size: 100,
                                            )
                                          : Image.file(
                                              image!,
                                              fit: BoxFit.cover,
                                            )
                                      : Image.network(
                                          snapshot.data!.get('profileURL'),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          //heading
                          const Text(
                            'About Me:',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          //username textfield
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Username',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: userName,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Username',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //first name textfield
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'First Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: firstName,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'First Name',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //last name textfield
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Last Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: lastName,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Last Name',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          //heading
                          const Text(
                            'Contact Detail:',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          //mobile number textfield
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.phone_android,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: mobileNumber,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Mobile Number',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //telephone number textfield
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Telephone Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.phone,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: telephoneNumber,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Telephone Number',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Email textfield
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.email_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextFormField(
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Enter Email';
                                              }
                                              final bool _isValid =
                                                  EmailValidator.validate(
                                                      email.text);
                                              if (!_isValid) {
                                                return 'Invalid Email Format';
                                              }
                                              // setState(() {
                                              //   email.text = value;
                                              // });
                                              return null;
                                            },
                                            controller: email,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Email',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          //heading
                          const Text(
                            'Address Detail:',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          //ADDRESS textfield
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Address',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: address,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Address',
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            // if (address.text.isEmpty) {
                                            addressOnTap();
                                            // } else {
                                            //   context
                                            //       .read<LocationProvider>()
                                            //       .currentUserPosition;
                                            // }
                                          },
                                          child: SvgPicture.asset(
                                            'images/location-crosshairs-solid.svg',
                                            width: 30,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //cITY textfield
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'City',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: city,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'City',
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: addressOnTap,
                                          child: SvgPicture.asset(
                                            'images/location-crosshairs-solid.svg',
                                            width: 30,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //STATE number textfield
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'State',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: state,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'State',
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: addressOnTap,
                                          child: SvgPicture.asset(
                                            'images/location-crosshairs-solid.svg',
                                            width: 30,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //COUNTRY text field
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0, bottom: 2),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Country',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.location_on,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: TextField(
                                            controller: country,
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Country',
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: addressOnTap,
                                          child: SvgPicture.asset(
                                            'images/location-crosshairs-solid.svg',
                                            width: 30,
                                            color: Colors.grey.shade700,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return Container();
              }),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 80.0,
            width: double.maxFinite,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(20.0))),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (image != null) {
                          uploadToFirebase(image);
                        } else {
                          saveOnPressed();
                        }
                      },
                      child: const Text('Save'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28.0),
                  child: RaisedButton(
                    onPressed: reSet,
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  reSet() {
    setState(() {
      image = null;
      userName.text = _userName!;
      firstName.text = _firstName!;
      lastName.text = _lastName!;
      mobileNumber.text = _mobileNumber!;
      telephoneNumber.text = _telephoneNumber!;
      email.text = _email!;
      address.text = _address!;
      state.text = _state!;
      city.text = _city!;
      country.text = _country!;
    });
  }

  addressOnTap() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      context.read<CustomSnackBars>().setCustomSnackBar(
            title: 'Location!',
            message: 'Please Turn on Location.',
            contentType: ContentType.failure,
            context: context,
          );
    } else {
      print('upper else');
      if (context.read<LocationProvider>().serviceAddress == null &&
          address.text.isEmpty) {
        print('add is empty & provider is also empty.');
        address.text =
            context.read<LocationProvider>().serviceAddress ?? 'loading';
        state.text = context.read<LocationProvider>().adminArea ?? 'loading';
        city.text = context.read<LocationProvider>().locality ?? 'loading';
        country.text =
            context.read<LocationProvider>().countryName ?? 'loading';
        context.read<LocationProvider>().getCurrentAddress();
        // setState(() {
        Future.delayed(const Duration(seconds: 3), () {
          address.text =
              context.read<LocationProvider>().serviceAddress ?? 'loading';
          state.text = context.read<LocationProvider>().adminArea ?? 'loading';
          city.text = context.read<LocationProvider>().locality ?? 'loading';
          country.text =
              context.read<LocationProvider>().countryName ?? 'loading';
        });
        // });
      } else if (context.read<LocationProvider>().serviceAddress == null &&
          address.text.isNotEmpty) {
        print('add is not empty & provider is empty.');
        address.text =
            context.read<LocationProvider>().serviceAddress ?? 'loading';
        state.text = context.read<LocationProvider>().adminArea ?? 'loading';
        city.text = context.read<LocationProvider>().locality ?? 'loading';
        country.text =
            context.read<LocationProvider>().countryName ?? 'loading';
        context.read<LocationProvider>().getCurrentAddress();
        Future.delayed(const Duration(seconds: 3), () {
          address.text =
              context.read<LocationProvider>().serviceAddress ?? 'loading';
          state.text = context.read<LocationProvider>().adminArea ?? 'loading';
          city.text = context.read<LocationProvider>().locality ?? 'loading';
          country.text =
              context.read<LocationProvider>().countryName ?? 'loading';
        });
      } else if (context.read<LocationProvider>().serviceAddress != null &&
          address.text.isEmpty) {
        print('add is empty & provider is not empty.');
        address.text =
            context.read<LocationProvider>().serviceAddress ?? 'loading';
        state.text = context.read<LocationProvider>().adminArea ?? 'loading';
        city.text = context.read<LocationProvider>().locality ?? 'loading';
        country.text =
            context.read<LocationProvider>().countryName ?? 'loading';
      } else if (address.text.isNotEmpty &&
          context.read<LocationProvider>().serviceAddress != null) {
        print('add is not empty & provider is also not empty.');
        address.text =
            context.read<LocationProvider>().serviceAddress ?? 'loading';
        state.text = context.read<LocationProvider>().adminArea ?? 'loading';
        city.text = context.read<LocationProvider>().locality ?? 'loading';
        country.text =
            context.read<LocationProvider>().countryName ?? 'loading';
      }
    }

    // _address = context
    //     .read<LocationProvider>()
    //     .serviceAddress
    //     .toString();
    // _state =
    //     context.read<LocationProvider>().adminArea.toString();
    // _city = context.read<LocationProvider>().locality.toString();
    // _country =
    //     context.read<LocationProvider>().countryName.toString();
  }

  Future uploadToFirebase(File? img) async {
    EasyLoading.show(status: 'Uploading Image...');
    final fileName = File(image!.path);
    final destination = 'files/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      UploadTask? task = ref.putFile(image!);
      final snapShot = await task.whenComplete(() {});
      final urlDownload = await snapShot.ref.getDownloadURL();
      print("donload link is $urlDownload");
      if (urlDownload.isNotEmpty) {
        _profileURL = urlDownload;
        EasyLoading.dismiss();
        saveOnPressed();
      }
      // Map<String, dynamic> ourData = {'Image': urlDownload};
      // db.update(ourData).then((value) {
      //   EasyLoading.showSuccess("Uploaded");
      //   EasyLoading.dismiss();
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => HomePage()),
      //   );
      // });
      return urlDownload;
    } on FirebaseException catch (e) {
      return null;
    }
  }

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    try {
      if (Image == null) {
        return "select Image";
      }
      final imageTemprory = File(image!.path);
      setState(() {
        this.image = imageTemprory;
      });
    } on Exception catch (e) {
      print("failed to pickImage");
    }
  }

  saveOnPressed() {
    Map<String, Object?> map = {};
    if (_formKey.currentState!.validate()) {
      if (_profileURL != null && image != null) {
        map['profileURL'] = _profileURL.toString();
      }
      if (userName.text.toString() != _userName) {
        map['userName'] = userName.text.toString();
      }
      if (firstName.text.toString() != _firstName) {
        map['firstName'] = firstName.text.toString();
      }
      if (lastName.text.toString() != _lastName) {
        map['lastName'] = lastName.text.toString();
      }
      if (mobileNumber.text.toString() != _mobileNumber) {
        map['mobileNumber'] = mobileNumber.text.toString();
      }
      if (telephoneNumber.text.toString() != _telephoneNumber) {
        map['telephoneNumber'] = telephoneNumber.text.toString();
      }
      if (email.text.toString() != _email) {
        map['email'] = email.text.toString();
      }
      if (address.text.toString() != _address) {
        map['address'] = address.text.toString();
      }
      if (state.text.toString() != _state) {
        map['state'] = state.text.toString();
      }
      if (city.text.toString() != _city) {
        map['city'] = city.text.toString();
      }
      if (country.text.toString() != _country) {
        map['country'] = country.text.toString();
      }

      if (map.isNotEmpty) {
        EasyLoading.show(status: "Uploading Data");
        FirebaseFirestore.instance
            .collection('Users')
            .doc(currentUserUId)
            .update(map)
            .whenComplete(() {
          image = null;
          EasyLoading.dismiss();
          context.read<CustomSnackBars>().setCustomSnackBar(
                title: 'Oh Yeah!',
                message: 'Value is successfully updated.',
                contentType: ContentType.success,
                context: context,
              );
        });
      } else {
        print('upper');
        if (image == null || _profileURL == null) {
          print('inside');
          context.read<CustomSnackBars>().setCustomSnackBar(
                title: 'Not Changes Anything!',
                message: 'No Value is Changed.',
                contentType: ContentType.warning,
                context: context,
              );
        } else {
          print('else');
        }
      }
    }
  }
}
