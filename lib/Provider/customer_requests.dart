import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isMobile/customer_requests_mobile.dart';

import '../isDesktop/Job_Request_Desktop.dart';
import '../responsive.dart';

class CustomerRequests extends StatefulWidget {
  static const String id = 'Customer Requests';
  const CustomerRequests({Key? key}) : super(key: key);

  @override
  _CustomerRequestsState createState() => _CustomerRequestsState();
}

class _CustomerRequestsState extends State<CustomerRequests> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: CustomerRequestsMobile(),
      isDesktopMobile: CustomerRequestsMobile(),
      desktop: JobRequestDesktop(),
    );
  }
}
