import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/Post_Service_Screen_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Post_Service_Screen_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class PostServiceScreen extends StatefulWidget {
  static const String id = 'PostServiceScreen';

  const PostServiceScreen({Key? key}) : super(key: key);

  @override
  _PostServiceScreenState createState() => _PostServiceScreenState();
}

class _PostServiceScreenState extends State<PostServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: PostServiceScreenDesktop(),
      isDesktopMobile: PostServiceScreenMobile(),
      mobile: PostServiceScreenMobile(),
    );
  }
}
