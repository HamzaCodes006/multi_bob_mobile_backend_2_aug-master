import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/Customer/job_detail_page.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/isDesktop/Provider_Job_Screen_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Provider_Job_Screen_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../constant.dart';
import '../widgets/booking_options_popup_menu_widget.dart';

class ProviderJobsScreen extends StatefulWidget {
  static const String id = 'ProviderJobsScreen';

  const ProviderJobsScreen({Key? key}) : super(key: key);

  @override
  _ProviderJobsScreenState createState() => _ProviderJobsScreenState();
}

class _ProviderJobsScreenState extends State<ProviderJobsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool convert = true;

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: ProviderJobScreenMobile(),
      desktop: ProviderJobScreenDesktop(),
      isDesktopMobile: ProviderJobScreenMobile(),
    );
  }
}
