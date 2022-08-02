import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Providers/custom_snackbars.dart';
import 'package:skilled_bob_app_web/Providers/profile_data.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import 'package:skilled_bob_app_web/something_went_wrong.dart';

import '../Provider/provider_profile_screen.dart';
import '../Providers/location_provider.dart';
import '../constant.dart';
import '../hover.dart';

class PostARequestCustomerMobile extends StatefulWidget {
  const PostARequestCustomerMobile({Key? key}) : super(key: key);

  @override
  _PostARequestCustomerMobileState createState() =>
      _PostARequestCustomerMobileState();
}

class _PostARequestCustomerMobileState
    extends State<PostARequestCustomerMobile> {
  File? image;
  List<String> options = [
    'Cars & Motorbike Service',
    'Construction & Painting',
    'Event & Party Service',
    'Design & Graphics',
    'Lifestyle, Vacation & Leasure',
    'Pets & Animals',
    'Insurance Service',
    'Financial Service',
    'Rental Services',
    'Driver/Chauffeur Service',
    'Transportation/Courier service',
    'Handyman Service',
    'Garden & Outdoor work service',
    'Legal Service',
    'Business',
    'Programming & Tech Service',
    'Cleaning & House keeping service',
    'Plumber Service',
    'Advertising & Marketing Service',
    'Furniture',
    'Sport & Fitness Service',
    'Music & Audio Service',
    'Architecture & Engineering Service',
    'Web, Computer & IT Service',
    'Health & Care Service',
    'Air conditioning & Heating Service',
    'Leasure & Vacation Service',
    'Video Photo & Animation',
    'Beauty, Wellness & Spa',
    'On demand professional home service',
    'Training & Education',
    'Child & Kids',
    'Hotel & Rooms',
    'Restaurant & Bar',
    'Pest Care',
    'Personal services',
    'Security service',
    'Other products & Services'
  ];
  String? jobCategory;
  final TextEditingController locationController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController messagesController = TextEditingController();
  int initial_page = 0;
  bool convert = false;
  final _formKey = GlobalKey<FormState>();

  String? _profileURL;

  @override
  void dispose() {
    locationController.dispose();
    budgetController.dispose();
    messagesController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // snapshot.map((e) {
    //   options.add(e.docs..toString());
    // }).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(jobCategory);
    final _locationProvider = Provider.of<LocationProvider>(context);
    Map<String, dynamic>? documents =
        Provider.of<Map<String, dynamic>?>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Buyer Request',
            style: TextStyle(color: kLightBlue),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: kLightBlue,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //job category
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: kLightBlue,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            // width: size.width,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.blue[200]!.withOpacity(0.4),
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              // border: Border.all(color: kLightBlue, width: 1,),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.category_outlined,
                                    color: kLightBlue,
                                    size: 22.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.70,
                                    child: DropdownButtonFormField<String>(
                                      isExpanded: false,
                                      dropdownColor: Colors.white,
                                      itemHeight: 60.0,
                                      hint: const Text(
                                        'Select Job Category',
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      value: jobCategory,
                                      style: kBodyText,
                                      onChanged: (String? newValue) {
                                        print('oncahanged');
                                        setState(() {
                                          jobCategory = newValue;
                                          print('oncahanged');
                                        });
                                      },

                                      validator: (value) {
                                        print('validator uo');
                                        if (value == null || value.isEmpty) {
                                          print('validator in the IF');
                                          return 'Please Select Any Category!';
                                        }
                                        // setState(() {
                                        //   jobCategory = value;
                                        // });
                                        return null;
                                      },
                                      // newValue // selectedItemBuilder: (BuildContext context) {
                                      //   return options.map((String value) {
                                      //     return Text(
                                      //       dropdownValue,
                                      //       style: const TextStyle(color: Colors.black87),
                                      //     );
                                      //   }).toList();
                                      // },
                                      items: options
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          onTap: () {
                                            print('on tap');
                                            setState(() {
                                              jobCategory = value;
                                            });
                                          },
                                          alignment: Alignment.center,
                                          value: value,
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Colors.blue,
                                              fontSize: 14,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      //upload
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: InkWell(
                          onTap: getImage,
                          child: Container(
                            width: size.width,
                            // hjshdssd
                            height: size.height * 0.13,
                            decoration: BoxDecoration(
                              color: Colors.blue[200]!.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: kLightBlue,
                                width: 1,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'images/upload.png',
                                  height: 70,
                                  color: kDarkBlueColor,
                                ),
                                const Text(
                                  'Click to upload Any Image.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.blue),
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
                          child: Text(
                            image != null
                                ? image!.path.toString()
                                : 'No media file selected.',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      //location
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          controller: locationController,
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
                              color: kDarkBlueColor),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            contentPadding: const EdgeInsets.all(8.0),
                            //hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Theme.of(context).primaryColor,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.location_searching),
                              onPressed: () {
                                locationController.text =
                                    'Locating...\nPlease wait...';
                                _locationProvider
                                    .getCurrentAddress()
                                    .then((address) {
                                  if (address != null) {
                                    setState(() {
                                      locationController.text =
                                          '${_locationProvider.serviceAddress}';
                                    });
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Couldn\'t find location... Try again')),
                                    );
                                  }
                                });
                              },
                            ),
                            labelText: 'Location',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //budget
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          controller: budgetController,
                          maxLength: 10,
                          style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Budget!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.money,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Job Budget',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            // focusColor: kOrange,
                          ),
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //Message
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          maxLines: 4,
                          controller: messagesController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Write Your Message!';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.description,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Message',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            // focusColor: kOrange,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //post A Job button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: size.height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: kLightBlue,
                            ),
                            child: FlatButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (image != null) {
                                    uploadToFirebase(image, documents);
                                  } else {
                                    context
                                        .read<CustomSnackBars>()
                                        .setCustomSnackBar(
                                            title: 'Oh no!',
                                            message: 'Please Select Any Image.',
                                            contentType: ContentType.warning,
                                            context: context);
                                  }
                                }
                              },
                              child: const Text(
                                'Post A Job',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ), // Navigator.pushNamed(context, SuccessScreen.id),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future uploadToFirebase(File? img, Map<String, dynamic>? documents) async {
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
        saveOnTap(documents);
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

  saveOnTap(Map<String, dynamic>? documents) {
    if (documents != null) {
      EasyLoading.show(status: 'Requesting...');
      FirebaseFirestore.instance.collection('Users').get().then((value) {
        for (var element in value.docs) {
          // element.id;
          if (element.get('provider') == true) {
            FirebaseFirestore.instance
                .collection('Users')
                .doc(element.id)
                .collection('BuyerRequests')
                .add({
              'buyerId': FirebaseAuth.instance.currentUser!.uid,
              'buyerName': documents['userName'].toString(),
              'buyerEmail': FirebaseAuth.instance.currentUser!.email,
              'buyerProfileURL': documents['profileURL'],
              'category': jobCategory.toString(),
              'URL': _profileURL,
              'providerUid': '',
              'providerProfileURL': '',
              'providerName': '',
              'providerEmail': '',
              'providerLat': '',
              'providerLong': '',
              'location': locationController.text.toString(),
              'jobBudget': budgetController.text.toString(),
              'message': messagesController.text.toString(),
              'status': 'unassigned',
            });
          }
        }
      }).whenComplete(() {
        EasyLoading.dismiss();
        context.read<CustomSnackBars>().setCustomSnackBar(
            title: 'Oh Yeah!',
            message: 'Request Successfully Sent.',
            contentType: ContentType.success,
            context: context);
        Navigator.pop(context);
      }).onError((error, stackTrace) {
        EasyLoading.dismiss();
        context.read<CustomSnackBars>().setCustomSnackBar(
            title: 'Oh no!',
            message: 'Request Submitting Failed.',
            contentType: ContentType.failure,
            context: context);
        Navigator.pop(context);
      });
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
}
