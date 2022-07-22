import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isMobile/My_Booking_Mobile.dart';

import '../Provider/provider_profile_screen.dart';
import '../constant.dart';
import '../isDesktop/My_Booking_Desktop.dart';
import '../responsive.dart';
import 'dashboard.dart';

class MyBookings extends StatefulWidget {
  static const String id = 'MyBookings';

  const MyBookings({Key? key}) : super(key: key);

  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  int initial_page = 0;
  bool convert = false;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initial_page);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return const Responsive(
      mobile: MyBookingMobile(),
      isDesktopMobile: MyBookingMobile(),
      desktop: MyBookingDesktop(),
    );
  }
}
