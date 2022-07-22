import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isMobile/Job_Request_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import '../isDesktop/Job_Request_Desktop.dart';

class JobRequests extends StatefulWidget {
  static const String id = 'Job Requests';
  const JobRequests({Key? key}) : super(key: key);

  @override
  _JobRequestsState createState() => _JobRequestsState();
}

class _JobRequestsState extends State<JobRequests> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: JobRequestMobile(),
      isDesktopMobile: JobRequestMobile(),
      desktop: JobRequestDesktop(),
    );
  }
}
