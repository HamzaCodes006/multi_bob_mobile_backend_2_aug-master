import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/Providers/location_provider.dart';
import 'package:skilled_bob_app_web/Providers/service_provider.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import '../constant.dart';
import '../hover.dart';

class PostServiceScreenMobile extends StatefulWidget {
  const PostServiceScreenMobile({Key? key}) : super(key: key);

  @override
  _PostServiceScreenMobileState createState() =>
      _PostServiceScreenMobileState();
}

class _PostServiceScreenMobileState extends State<PostServiceScreenMobile> {
  int selectedImage = 0;
  bool convert = true;
  List<String> options = [
    'Cars & Motorbike Service',
    'Construction & Painting',
    'Event & Party Service',
    'Design & Graphics',
    'Lifestyle, Vacation & Leasure',
    'Pets & Animals',
    '    Insurance Service',
    '    Financial Service',
    '    Rental Services',
    '    Driver/Chauffeur Service',
    '    Transportation/Courier service',
    '    Handyman Service',
    '    Garden & Outdoor work service',
    '    Legal Service',
    '    Business',
    '    Programming & Tech Service',
    '    Cleaning & House keeping service',
    '    Plumber Service',
    '    Advertising & Marketing Service',
    '    Furniture',
    '    Sport & Fitness Service',
    '    Music & Audio Service',
    '    Architecture & Engineering Service',
    'Web, Computer & IT Service',
    '    Health & Care Service',
    '    Air conditioning & Heating Service',
    '    Leasure & Vacation Service',
    '    Video Photo & Animation',
    '    Beauty, Wellness & Spa',
    '    On demand professional home service',
    '    Training & Education',
    '    Child & Kids',
    '    Hotel & Rooms',
    '    Restaurant & Bar',
    '    Pest Care',
    '    Personal services',
    '    Security service',
    '    Other products & Services'
  ];
  String? jobCategory, jobTitle, jobAddress, jobPrice, jobDescription;
  final _jobPriceController = TextEditingController();
  final _jobCategoryController = TextEditingController();
  final _jobAddressController = TextEditingController();
  final _jobTitleController = TextEditingController();
  final _jobDescriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String>? _imageURLs;
  List<XFile>? _imageList;

  //Multiple Files Upload
  Future<String> uploadMultipleFiles(filePath, serviceTitle) async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    File file = File(filePath); //need file path to upload

    var timeStamp = Timestamp.now();
    await _storage.ref('servicesImages/$serviceTitle/$timeStamp').putFile(file);

    String downloadURL = await _storage
        .ref('servicesImages/$serviceTitle/$timeStamp')
        .getDownloadURL();
    return downloadURL;

    // Within your widgets:
    // Image.network(downloadURL);
  }

  @override
  Widget build(BuildContext context) {
    // final fileName=_fileList!=null?
    final _serviceProvider = Provider.of<ServiceProvider>(context);
    final _locationProvider = Provider.of<LocationProvider>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: Responsive.isDesktop(context)
            ? AppBar(
                bottomOpacity: 0,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.white,
                title: Row(
                  children: [
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: size.height * 0.06,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/logo.png'),
                        ),
                      ),
                      child: Image.asset('images/logo.png'),
                    ),
                    const Text(
                      'MultiBob',
                      style: TextStyle(
                        color: Colors.black87,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PTSans',
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
                actions: [
                  OnHover(
                    builder: (bool isHovered) {
//final color = ;
                      return Center(
                          child: Container(
                        decoration: BoxDecoration(
                          color: isHovered ? kLightBlueColor : kDarkBlueColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 2,
                            color: isHovered ? kDarkBlueColor : kLightBlueColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Home',
                            style: TextStyle(
                              color: isHovered ? kDarkBlueColor : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OnHover(
                    builder: (bool isHovered) {
//final color = ;
                      return Center(
                          child: Container(
                        decoration: BoxDecoration(
                          color: isHovered ? kLightBlueColor : kDarkBlueColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 2,
                            color: isHovered ? kDarkBlueColor : kLightBlueColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              color: isHovered ? kDarkBlueColor : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OnHover(
                    builder: (bool isHovered) {
//final color = ;
                      return Center(
                          child: Container(
                        decoration: BoxDecoration(
                          color: isHovered ? kLightBlueColor : kDarkBlueColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 2,
                            color: isHovered ? kDarkBlueColor : kLightBlueColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Post A Request',
                            style: TextStyle(
                              color: isHovered ? kDarkBlueColor : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OnHover(
                    builder: (bool isHovered) {
//final color = ;
                      return Center(
                          child: Container(
                        decoration: BoxDecoration(
                          color: isHovered ? kLightBlueColor : kDarkBlueColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          border: Border.all(
                            width: 2,
                            color: isHovered ? kDarkBlueColor : kLightBlueColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Dashboard',
                            style: TextStyle(
                              color: isHovered ? kDarkBlueColor : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ));
                    },
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              )
            : AppBar(
                title: const Text(
                  'Post The Service',
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
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
                              vertical: 8.0, horizontal: 5.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              // border: Border.all(color: kLightBlue, width: 1,),
                            ),
                            child: Container(
                              width: size.width,
                              height: size.height * 0.1,
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
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.category_outlined,
                                      color: kLightBlue,
                                      size: 20.0,
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: DropdownButton<String>(
                                        // focusColor: Colors.red,

                                        dropdownColor:
                                            Colors.white10.withOpacity(0.9),
                                        itemHeight: 70.0,
                                        hint: const Text(
                                          'Select Job Category',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        // value: jobCategory,
                                        icon: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 0.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_outlined,
                                            color: kLightBlue,
                                            size: 22,
                                          ),
                                        ),
                                        underline: const SizedBox(),
                                        iconSize: 22.0,
                                        style: kBodyText,
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            jobCategory = newValue;
                                          });
                                        },
                                        value: jobCategory,
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
                                              setState(() {
                                                _jobCategoryController.text =
                                                    value;
                                                jobCategory = value;
                                              });
                                            },
                                            // alignment: Alignment.s,
                                            value: value,
                                            child: Text(
                                              value,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: const TextStyle(
                                                  color: kDarkBlueColor,
                                                  fontSize: 16.0),
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
                        //email
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       vertical: 8.0, horizontal: 25.0),
                        //   child: TextFormField(
                        //     controller: _emailController,
                        //     style: const TextStyle(
                        //         fontSize: 18,
                        //         // fontWeight: FontWeight.bold,
                        //         color: Colors.white),
                        //     decoration: InputDecoration(
                        //       fillColor: Colors.blue[200]!.withOpacity(0.4),
                        //       filled: true,
                        //       // hoverColor: kDarkBlue,
                        //       // helperText: 'Add Text',
                        //       hintStyle: const TextStyle(
                        //         fontSize: 17.0,
                        //         color: Colors.grey,
                        //       ),
                        //       prefixIcon: Icon(
                        //         Icons.account_circle,
                        //         color: Theme.of(context).primaryColor,
                        //       ),
                        //       labelText: 'Email',
                        //       labelStyle: const TextStyle(
                        //         fontSize: 17.0,
                        //         color: Colors.blue,
                        //       ),
                        //       contentPadding: EdgeInsets.zero,
                        //       enabledBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(
                        //             color: Theme.of(context).primaryColor),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(10),
                        //         borderSide: BorderSide(
                        //             color: Theme.of(context).primaryColor),
                        //       ),
                        //       // focusColor: kOrange,
                        //     ),
                        //     keyboardType: TextInputType.emailAddress,
                        //     textInputAction: TextInputAction.next,
                        //     textAlign: TextAlign.left,
                        //   ),
                        // ),

                        //upload File
                        GestureDetector(
                          onTap: () {
                            _serviceProvider
                                .multipleImagePicker()
                                .then((imageList) {
                              setState(() {
                                _imageList = imageList;
                              });
                            }).then((value) {
                              _serviceProvider.isPicAvail = true;
                              _serviceProvider
                                  .uploadMultipleImages(
                                      _imageList!, _jobTitleController.text)
                                  .then((URLs) {
                                _imageURLs = URLs;
                                print(
                                    'URLs=================>>>>>>>>$_imageURLs,,,');
                              });
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 25.0),
                            child: Container(
                              width: size.width * 0.8,
                              height: size.height * 0.2,
                              decoration: BoxDecoration(
                                color: Colors.blue[200]!.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
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
                                    'Click to upload media files.',
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
                          child: Text(_imageList != null
                              ? _serviceProvider.fileName.toString()
                              : 'No image selected.'),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Center(
                        //     child: SingleChildScrollView(
                        //       scrollDirection: Axis.horizontal,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           ...List.generate(
                        //               _fileURLs!.length,
                        //               (index) => GestureDetector(
                        //                     onTap: () {
                        //                       setState(() {
                        //                         selectedImage = index;
                        //                       });
                        //                     },
                        //                     child: Image.network(
                        //                       _fileURLs![index] ??
                        //                           'https://www.pngitem.com/pimgs/m/4-40070_user-staff-man-profile-user-account-icon-jpg.png',
                        //                       height: 48,
                        //                       width: 48,
                        //                     ),
                        //                   )),
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //title
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: TextFormField(
                            controller: _jobTitleController,
                            maxLength: 51,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Job Title';
                              }
                              setState(() {
                                jobTitle = value;
                              });
                              return null;
                            },
                            maxLines: 3,
                            style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: kDarkBlueColor),
                            decoration: InputDecoration(
                              fillColor: Colors.blue[200]!.withOpacity(0.4),
                              filled: true,
                              //hoverColor: kDarkBlue,
                              // helperText: 'Add Text',
                              hintStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.work,
                                color: Theme.of(context).primaryColor,
                              ),
                              labelText: 'Service Title',
                              labelStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.blue,
                              ),
                              contentPadding: const EdgeInsets.all(8.0),
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
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                          ),
                        ),

                        //location
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: TextFormField(
                            controller: _jobAddressController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Address';
                              }
                              setState(() {
                                jobAddress = value;
                              });
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
                                  _jobAddressController.text =
                                      'Locating...\nPlease wait...';
                                  _locationProvider
                                      .getCurrentAddress()
                                      .then((address) {
                                    if (address != null) {
                                      setState(() {
                                        _jobAddressController.text =
                                            '${_locationProvider.serviceAddress}';
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
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
                              // focusColor: kOrange,
                            ),
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            textAlign: TextAlign.left,
                          ),
                        ),

                        //price
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: TextFormField(
                            controller: _jobPriceController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Price';
                              }
                              setState(() {
                                jobPrice = value;
                              });
                              return null;
                            },
                            maxLength: 10,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
                                color: kDarkBlueColor),
                            decoration: InputDecoration(
                              fillColor: Colors.blue[200]!.withOpacity(0.4),
                              filled: true,
                              //hoverColor: kDarkBlue,
                              // helperText: 'Add Text',
                              hintStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.grey,
                              ),
                              prefixIcon: Icon(
                                Icons.money,
                                color: Theme.of(context).primaryColor,
                              ),

                              labelText: 'Job Price',
                              labelStyle: const TextStyle(
                                fontSize: 17.0,
                                color: Colors.blue,
                              ),
                              contentPadding: const EdgeInsets.all(20.0),
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

                        //description
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 25.0),
                          child: TextFormField(
                            controller: _jobDescriptionController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Description';
                              }
                              setState(() {
                                jobDescription = value;
                              });
                              return null;
                            },
                            maxLines: 6,
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
                                Icons.description,
                                color: Theme.of(context).primaryColor,
                              ),
                              labelText: 'Job Description',
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
                        //post button
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
                                onPressed: () async {
                                  if (_serviceProvider.isPicAvail == true) {
                                    if (_formKey.currentState!.validate()) {
                                      EasyLoading.show(status: 'Uplaoding..');
                                      //  save the information in a database.
                                      _serviceProvider
                                          .saveServiceDetailsToFB(
                                        jobLatitude: _locationProvider
                                            .serviceLatitude
                                            .toString(),
                                        jobLongitude: _locationProvider
                                            .serviceLongitude
                                            .toString(),
                                        jobAddress:
                                            _locationProvider.serviceAddress,
                                        jobCategory: jobCategory,
                                        jobDescription: jobDescription,
                                        jobPrice: jobPrice,
                                        jobTitle: jobTitle,
                                        jobURL: _imageURLs,
                                      )
                                          .then((value) {
                                        EasyLoading.showSuccess(
                                            'Uploading Done.');
                                        EasyLoading.dismiss();
                                        _formKey.currentState!.reset();
                                        _imageURLs = null;
                                        Navigator.pushNamed(
                                            context, MyServicesScreen.id);
                                      }).then((value) {
                                        setState(() {
                                          _formKey.currentState!.reset();
                                          _imageURLs = null;
                                        });
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('Invalid Data!')));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'At least one media file need to be added!')),
                                    );
                                  }
                                },
                                // Navigator.pushNamed(context, JobDetail.id);
                                child: const Text(
                                  'Post',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Navigator.pushNamed(context, SuccessScreen.id),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
