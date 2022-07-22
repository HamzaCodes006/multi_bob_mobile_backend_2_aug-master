import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomSnackBars extends ChangeNotifier {
  // final Color? color;
  // final String title;
  // final String message;
  // final type;

  void setCustomSnackBar(
      {required String title,
      required String message,
      required ContentType contentType,
      required BuildContext context}) {
    var snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(
        milliseconds: 1000,
      ),
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    notifyListeners();
  }
}
