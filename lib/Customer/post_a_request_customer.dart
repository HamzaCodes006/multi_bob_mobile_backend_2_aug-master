import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/Post_A_Request_Customer_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Post_A_Request_Customer_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class PostARequestCustomer extends StatefulWidget {
  static const String id = 'PostARequestCustomer';

  const PostARequestCustomer({Key? key}) : super(key: key);

  @override
  _PostARequestCustomerState createState() => _PostARequestCustomerState();
}

class _PostARequestCustomerState extends State<PostARequestCustomer> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: PostARequestCustomerDesktop(),
      isDesktopMobile: PostARequestCustomerMobile(),
      mobile: PostARequestCustomerMobile(),
    );
  }
}
