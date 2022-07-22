import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/src/provider.dart';
import 'package:skilled_bob_app_web/Customer/my_bookings.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/Customer/profile.dart';
import 'package:skilled_bob_app_web/Customer/request_page.dart';
import 'package:skilled_bob_app_web/Provider/provider_dashboard.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/Providers/menu_controller.dart';
import 'package:skilled_bob_app_web/authentication/login_screen.dart';
import 'package:skilled_bob_app_web/authentication/register_screen.dart';
import 'package:skilled_bob_app_web/isDesktop/Dashboard_desktop.dart';
import 'package:skilled_bob_app_web/isMobile/Dashboard_mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../constant.dart';
import 'index_page.dart';
import 'my_favorites.dart';

class Dashboard extends StatefulWidget {
  static const String id = 'Dashboard';

  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool convert = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Responsive(
      mobile: const DashboardMobile(),
      isDesktopMobile: const DashboardMobile(),
      desktop: DashboardDesktop(),
    );
  }
}

class SideMenu extends StatelessWidget {
  final int selected;
  const SideMenu({required this.selected});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        // it enables scrolling
        child: Column(
          children: [
            DrawerHeader(
              child: Image.asset(
                "images/logo.png",
                width: 100,
              ),
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: Icon(
                Icons.account_circle_outlined,
                color: selected == 1 ? Colors.white : Colors.black,
                size: 16,
              ),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              selected: selected == 1 ? true : false,
            ),
            DrawerListTile(
              title: "My Favorite",
              svgSrc: Icon(
                Icons.favorite_border,
                color: selected == 2 ? Colors.white : Colors.black,
                size: 16,
              ),
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyFavorites()));
              },
              selected: selected == 2 ? true : false,
            ),
            DrawerListTile(
              title: "Booking",
              svgSrc: Icon(
                CupertinoIcons.book,
                color: selected == 3 ? Colors.white : Colors.black,
                size: 16,
              ),
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyBookings()));
              },
              selected: selected == 3 ? true : false,
            ),
            DrawerListTile(
              title: "Post A Request",
              svgSrc: Icon(
                Icons.post_add,
                color: selected == 4 ? Colors.white : Colors.black,
                size: 16,
              ),
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostARequestCustomer()));
              },
              selected: selected == 4 ? true : false,
            ),
            DrawerListTile(
              title: "Inbox",
              svgSrc: Icon(
                Icons.chat,
                color: selected == 5 ? Colors.white : Colors.black,
                size: 16,
              ),
              press: () {},
              selected: selected == 5 ? true : false,
            ),
            DrawerListTile(
              title: "Log Out",
              svgSrc: Icon(
                Icons.logout,
                color: selected == 6 ? Colors.white : Colors.black,
                size: 16,
              ),
              press: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              selected: selected == 6 ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.title,
    required this.svgSrc,
    required this.press,
    this.selected = false,
  });

  final String title;
  final svgSrc;
  final VoidCallback press;
  final selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      selected: selected,
      selectedTileColor: kDarkBlueColor,
      horizontalTitleGap: 0.0,
      leading: svgSrc,
      title: Text(
        title,
        style:
            TextStyle(color: selected == true ? Colors.white : Colors.black87),
      ),
    );
  }
}
