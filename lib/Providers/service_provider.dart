import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ServiceProvider extends ChangeNotifier {
  bool isPicAvail = false;
  List<XFile>? newImage;
  List<File>? newFiles;
  String? error;
  String? fileName;
  double progress = 0.0;

  //multiple Files picker
  Future<List<File>?> multipleFilesPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        dialogTitle: 'completed!!!',
        allowCompression: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      newFiles = files;
      fileName = result.files.first.name;
      notifyListeners();
    } else {
      error = 'no file selected!';
      print('no file selected!');
      notifyListeners();
    }

    print('new files::::::::::::::::::::::::$newFiles ');
    return newFiles;
  }

  //upload multiple Files
  Future<List<String>> uploadMultipleFiles(
      List<File> _files, String fileName) async {
    var fileUrls =
        await Future.wait(_files.map((_image) => uploadFile(_image, fileName)));

    print('filesUrls++++++>>>>>>>>>>>>>>>$fileUrls');
    return fileUrls;
  }

  Future<String> uploadFile(File _image, String fileName) async {
    var timeStamp = Timestamp.now();
    FirebaseStorage storageReference = FirebaseStorage.instance;
    Reference ref =
        storageReference.ref().child('sampleFiles/$fileName/$timeStamp');
    UploadTask uploadTask = ref.putFile(File(_image.path));
    uploadTask.snapshotEvents.listen((event) {
      progress =
          (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
              100;
      print('progress:${progress.round()}');
    });
    await uploadTask.whenComplete(() {});

    return await ref.getDownloadURL();
  }

  //multiple image picker
  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>?> getServiceImage() async {
    // final XFile? image = await _picker.pickImage(
    //     source: ImageSource.gallery,
    //     imageQuality: 20,
    //     );
    // final XFile? image = await _picker.pickVideo(
    //   maxDuration: const Duration(seconds: 20),
    //   source: ImageSource.gallery,
    // );
    final List<XFile>? image = await _picker.pickMultiImage(
      imageQuality: 20,
    );
    if (image != null) {
      // print('111111111111111111111111111');
      newImage = image;
      // print('22222222222222222222222222222');
      // newImage = File(image.path);
      notifyListeners();
      // print(newImage);
    } else {
      error = 'no image selected!';
      print('no image selected!');
      notifyListeners();
    }
    // final file = image.toFile();
    print(newImage);
    return newImage;
  }

  //upload multiple images
  Future<List<String>> uploadMultipleImages(List<XFile> _images) async {
    var imageUrls =
        await Future.wait(_images.map((_image) => uploadImage(_image)));

    print('------->>>>>>>>>>>>>>>$imageUrls');
    return imageUrls;
  }

  Future<String> uploadImage(XFile _image) async {
    var timeStamp = Timestamp.now();
    double progress = 0.0;
    FirebaseStorage storageReference = FirebaseStorage.instance;
    Reference ref = storageReference.ref().child('sampleImages/$timeStamp');
    UploadTask uploadTask = ref.putFile(File(_image.path));
    uploadTask.snapshotEvents.listen((event) {
      progress =
          (event.bytesTransferred.toDouble() / event.totalBytes.toDouble()) *
              100;
      print('progress:$progress');
    });
    await uploadTask.whenComplete(() {});

    return await ref.getDownloadURL();
  }

  //Alert dialogue
  alertDialog({context, title, content}) {
    return showCupertinoDialog(
        context: context,
        builder: (BuildContext contxt) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  //Save Job to DB
  Future<void> saveServiceDetailsToFB({
    required String? jobCategory,
    required String? jobTitle,
    required String? jobAddress,
    required String? jobPrice,
    required String? jobDescription,
    required List<String>? jobURL,
    required String? jobLatitude,
    required String? jobLongitude,

  }) async {
    try {
      final addService = await FirebaseFirestore.instance
          .collection('Services')
          .add({
            'serviceCategory': jobCategory,
            'serviceTitle': jobTitle,
            'serviceAddress': jobAddress,
            'servicePrice': jobPrice,
            'serviceDescription': jobDescription,
            'serviceURL': jobURL,
            'serviceLatitude': jobLatitude,
            'serviceLongitude': jobLongitude,
            'providerEmail': FirebaseAuth.instance.currentUser!.email,
            'serviceRating': '4.8',
            'serviceReview': 'Such a great service provider',
            "providerId": FirebaseAuth.instance.currentUser!.uid.toString(),
          })
          .then((value) => print('Service Added Successfully!!'))
          .catchError((onError) {
            print('Service Not added Successfully!!');
          });
    } catch (e) {
      print("Service added exception is:::::::::::::::::: $e");
    }
  }
}
