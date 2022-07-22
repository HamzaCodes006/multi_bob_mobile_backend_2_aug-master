import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/Post_Job_Screen_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Post_Job_Screen_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class PostJobScreen extends StatefulWidget {
  static const String id = 'PostJobScreen';
  const PostJobScreen({Key? key}) : super(key: key);

  @override
  _PostJobScreenState createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return const Responsive(
      desktop: PostJobScreenDesktop(),
      isDesktopMobile: PostJobScreenMobile(),
      mobile: PostJobScreenMobile(),
    );
  }
}
