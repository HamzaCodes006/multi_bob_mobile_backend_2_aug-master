import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/Request_Page_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Request_Page_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class Request extends StatefulWidget {
  static const String id = 'Request';
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: RequestPageDesktop(),
      isDesktopMobile: RequestPageMobile(),
      mobile: RequestPageMobile(),
    );
  }
}
