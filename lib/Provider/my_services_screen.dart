import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/My_Services_Screen_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/My_Services_Screen_Mobile.dart';
import '../responsive.dart';

class MyServicesScreen extends StatefulWidget {
  static const String id = 'MyServicesScreen';
  const MyServicesScreen({Key? key}) : super(key: key);

  @override
  _MyServicesScreenState createState() => _MyServicesScreenState();
}

class _MyServicesScreenState extends State<MyServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: MyServicesScreenDesktop(),
      isDesktopMobile: MyServicesScreenMobile(),
      mobile: MyServicesScreenMobile(),
    );
  }
}

class Choice {
  const Choice({required this.title, required this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home', icon: Icons.home),
  Choice(title: 'Contact', icon: Icons.contacts),
  Choice(title: 'Map', icon: Icons.map),
  Choice(title: 'Phone', icon: Icons.phone),
  Choice(title: 'Camera', icon: Icons.camera_alt),
  Choice(title: 'Setting', icon: Icons.settings),
  Choice(title: 'Album', icon: Icons.photo_album),
  Choice(title: 'WiFi', icon: Icons.wifi),
];
