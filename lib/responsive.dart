import 'dart:io';

import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget isDesktopMobile;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    required this.isDesktopMobile,
    required this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) {
    if (Platform.isAndroid || Platform.isIOS) {
      return true;
    } else {
      return false;
    }
  }
  // MediaQuery.of(context).size.width < 650;

  // static bool isTablet(BuildContext context) =>
  //     MediaQuery.of(context).size.width < 1100 &&
  //     MediaQuery.of(context).size.width >= 650;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1050;
  // MediaQuery.of(context).size.width >= 650;

  static bool isDesktopMobileView(BuildContext context) {
    if (MediaQuery.of(context).size.width < 650) {
      if (Platform.isAndroid || Platform.isIOS) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  static double hwValue(BuildContext context,
      {required double des, required double teb, required double mob}) {
    if (isDesktop(context)) {
      return des;
    } else if (isDesktopMobileView(context)) {
      return teb;
    } else if (isMobile(context)) {
      return mob;
    } else {
      return mob;
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        // constraints.maxWidth >= 1100 &&
        if (constraints.maxWidth > 650) {
          return desktop;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        //if its on web but with mobile width and height
        else if (constraints.maxWidth <= 650) {
          return isDesktopMobile;
        }
        // Or less then that we called it mobile
        else {
          if (Platform.isAndroid || Platform.isIOS) {
            return mobile;
          } else {
            return isDesktopMobile;
          }
        }
      },
    );
  }
}
