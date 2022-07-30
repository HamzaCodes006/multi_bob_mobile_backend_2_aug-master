import 'dart:io';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/Providers/service_provider.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../Providers/custom_snackbars.dart';
import '../Providers/location_provider.dart';
import '../constant.dart';
import '../hover.dart';

class RequestPageMobile extends StatefulWidget {
  const RequestPageMobile({Key? key}) : super(key: key);

  @override
  _RequestPageMobileState createState() => _RequestPageMobileState();
}

class _RequestPageMobileState extends State<RequestPageMobile> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final jobAddressController = TextEditingController();
  final messagesController = TextEditingController();
  String? _profileURL;
  File? image;
  List<String> options = [
    'Cook',
    'Painter',
    'Driver',
    'Plumber',
    'Mechanic',
    'Digging',
    'Drilling',
    'Inspection Shafts',
    'Dog Training',
    'Pet Sitting',
    'Ventilation',
    'Cook2',
    'Painter2',
    'Driver2',
    'Plumber2',
    'Mechanic2',
    'Digging2',
    'Drilling2',
    'Inspection Shafts2',
    'Dog Training2',
    'Pet Sitting2',
    'Ventilation2 ',
    'Digging and Drilling'
  ];
  String? jobCategory;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    messagesController.dispose();
    jobAddressController.dispose();
    image = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _locationProvider = Provider.of<LocationProvider>(context);
    Map<String, dynamic>? documents =
        Provider.of<Map<String, dynamic>?>(context);
    if (documents != null) {
      nameController.text = documents['userName'];
      emailController.text = documents['email'];
    }
    Size size = MediaQuery.of(context).size;
    return documents != null
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                  color: Colors.blueAccent,
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: kDarkBlueColor,
                    size: 26,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: const Text(
                  'Request',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                titleSpacing: 0,
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name textfield
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.black45),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0, top: 13),
                                  child: Text(
                                    'Name',
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
                                        child: TextFormField(
                                          controller: nameController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Name.';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter your Name',
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
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.black45),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0, top: 13),
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
                                        child: TextFormField(
                                          controller: emailController,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Your Email.';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Email Address',
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
                        //Mobile Number textfield
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              ),
                              border: Border.all(color: Colors.black45),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 18.0, top: 13),
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
                                        child: TextFormField(
                                          controller: mobileNumberController,
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please Enter Mobile Number.';
                                            } else if (value.length < 8) {
                                              return 'Please Enter Full Mobile Number.';
                                            }
                                            return null;
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'Enter your Mobile Number',
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
                        //location
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: TextFormField(
                            controller: jobAddressController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Address';
                              }
                              // setState(() {
                              //   jobAddress = value;
                              // });
                              return null;
                            },
                            maxLines: 5,
                            style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              // fillColor: Colors.blue[200]!.withOpacity(0.4),
                              // filled: true,
                              contentPadding: const EdgeInsets.all(8.0),
                              //hoverColor: kDarkBlue,
                              // helperText: 'Add Text',
                              hintStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.location_on,
                                color: Colors.black45,
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.location_searching),
                                onPressed: () async {
                                  bool serviceEnabled;
                                  serviceEnabled = await Geolocator
                                      .isLocationServiceEnabled();
                                  if (!serviceEnabled) {
                                    context
                                        .read<CustomSnackBars>()
                                        .setCustomSnackBar(
                                          title: 'Oh no!',
                                          message: 'Please turn On  location.',
                                          contentType: ContentType.failure,
                                          context: context,
                                        );
                                    return Future.error(
                                        'Location services are disabled.');
                                  } else {
                                    jobAddressController.text =
                                        'Locating...\nPlease wait...';
                                    _locationProvider
                                        .getCurrentAddress()
                                        .then((address) {
                                      if (address != null) {
                                        setState(() {
                                          jobAddressController.text =
                                              '${_locationProvider.serviceAddress}';
                                        });
                                      } else {
                                        context
                                            .read<CustomSnackBars>()
                                            .setCustomSnackBar(
                                              title: 'Oh no!',
                                              message:
                                                  'Couldn\'t find location... Try again',
                                              contentType: ContentType.failure,
                                              context: context,
                                            );
                                        // ScaffoldMessenger.of(context)
                                        //     .showSnackBar(
                                        //   const SnackBar(
                                        //       content: Text(
                                        //           'Couldn\'t find location... Try again')),
                                        // );
                                      }
                                    });
                                  }
                                },
                              ),
                              labelText: 'Location',
                              labelStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black45,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.black45,
                                ),
                              ),
                              // focusColor: kOrange,
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        //Message
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: TextFormField(
                            maxLines: 5,
                            controller: messagesController,
                            style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: Colors.black87),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Write Your Message.';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              fillColor: Colors.blue[200]!.withOpacity(0.4),
                              filled: false,
                              hoverColor: kDarkBlue,
                              // helperText: 'Add Text',
                              hintText: 'Enter Message',
                              hintStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey,
                              ),
                              prefixIcon: const Icon(
                                Icons.description,
                                color: Colors.black54,
                              ),
                              labelText: 'Message',
                              labelStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.black54,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black54),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.black54),
                              ),
                              // focusColor: kOrange,
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.done,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        //upload
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                          child: InkWell(
                            onTap: getImage,
                            child: Container(
                              width: size.width,
                              height: size.height * 0.16,
                              decoration: BoxDecoration(
                                //color: Colors.blue[200]!.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/upload.png',
                                    height: 70,
                                    color: Colors.black,
                                  ),
                                  const Text(
                                    'Click to upload Any Image.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 15.0, right: 25.0, left: 25.0),
                          child: Center(
                            child: Text(image != null
                                ? image!.path.toString()
                                : 'No media file selected.'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                child: Container(
                  height: 80.0,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white60.withOpacity(0.9),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(20.0),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: RaisedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // FirebaseFirestore.instance.collection('Users').doc().
                                if (image != null) {
                                  uploadToFirebase(image);
                                } else {
                                  context
                                      .read<CustomSnackBars>()
                                      .setCustomSnackBar(
                                        title: 'Oh no!',
                                        message: 'Please Select Any Image.',
                                        contentType: ContentType.warning,
                                        context: context,
                                      );
                                }
                              }
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => const IndexPage()));
                            },
                            child: const Text('Send Request'),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container();
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
        EasyLoading.dismiss();
        _profileURL = urlDownload;
        saveOnPressed();
      }
      return urlDownload;
    } on FirebaseException catch (e) {
      context.read<CustomSnackBars>().setCustomSnackBar(
            title: 'Oh no!',
            message: 'Check your internet connection and Try Again.',
            contentType: ContentType.failure,
            context: context,
          );
      return null;
    }
  }

  saveOnPressed() {
    if (_formKey.currentState!.validate()) {
      // if (map.isNotEmpty) {
      EasyLoading.show(status: "Uploading Data");
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('RequestsOnGig')
          .add({
        'serviceCategory': context.read<ServiceProvider>().category.toString(),
        'serviceTitle': context.read<ServiceProvider>().title.toString(),
        'serviceUid': context.read<ServiceProvider>().serviceUid.toString(),
        'providerUid': context.read<ServiceProvider>().providerUid.toString(),
        'providerEmail':
            context.read<ServiceProvider>().providerEmail.toString(),
        'requesterUid': FirebaseAuth.instance.currentUser!.uid,
        'requesterName': nameController.text.toString(),
        'requesterEmail': emailController.text.toString(),
        'requesterMobileNumber': mobileNumberController.text.toString(),
        'requesterMessage': messagesController.text.toString(),
        'requesterLat':
            context.read<LocationProvider>().serviceLatitude.toString(),
        'requesterLong':
            context.read<LocationProvider>().serviceLongitude.toString(),
        'requesterLocation':
            context.read<LocationProvider>().serviceAddress.toString(),
        'requesterImageURL': _profileURL.toString(),
        'status': 'unassigned',
      }).whenComplete(() {
        image = null;
        EasyLoading.dismiss();
        context.read<CustomSnackBars>().setCustomSnackBar(
              title: 'Oh Yeah!',
              message: 'Value is successfully updated.',
              contentType: ContentType.success,
              context: context,
            );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => IndexPage()));
      });
      // } else {
      //   print('upper');
      //   if (image == null || _profileURL == null) {
      //     print('inside');
      //     context.read<CustomSnackBars>().setCustomSnackBar(
      //       title: 'Not Changes Anything!',
      //       message: 'No Value is Changed.',
      //       contentType: ContentType.warning,
      //       context: context,
      //     );
      //   } else {
      //     print('else');
      //   }
      // }
    }
  }
}
