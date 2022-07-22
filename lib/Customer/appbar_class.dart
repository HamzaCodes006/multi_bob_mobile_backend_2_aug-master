import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';

import '../constant.dart';
import '../hover.dart';
import 'category.dart';
import 'dashboard.dart';
import 'index_page.dart';

class Appbar extends StatefulWidget with PreferredSizeWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  _AppbarState createState() => _AppbarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      bottomOpacity: 6,
      shadowColor: Colors.grey,
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          const SizedBox(
            width: 30,
          ),
          MaterialButton(
            onPressed: () {},
            autofocus: false,
            // color: Colors.transparent,
            enableFeedback: false,
            child: Container(
              height: size.height * 0.06,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset('images/horizontalLogo.png'),
            ),
          ),
        ],
      ),
      actions: [
        OnHover(
          builder: (bool isHovered) {
            return Center(
                child: Container(
              decoration: BoxDecoration(
                color: isHovered ? kLightBlueColor : kDarkBlueColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: isHovered ? kDarkBlueColor : kLightBlueColor,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, IndexPage.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Home',
                    style: TextStyle(
                      color: isHovered ? kDarkBlueColor : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
        const SizedBox(
          width: 10,
        ),
        OnHover(
          builder: (bool isHovered) {
            //final color = ;
            return Center(
                child: Container(
              decoration: BoxDecoration(
                color: isHovered ? kLightBlueColor : kDarkBlueColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: isHovered ? kDarkBlueColor : kLightBlueColor,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Categories.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      color: isHovered ? kDarkBlueColor : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
        const SizedBox(
          width: 10,
        ),
        OnHover(
          builder: (bool isHovered) {
            //final color = ;
            return Center(
                child: Container(
              decoration: BoxDecoration(
                color: isHovered ? kLightBlueColor : kDarkBlueColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: isHovered ? kDarkBlueColor : kLightBlueColor,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PostARequestCustomer.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Post A Request',
                    style: TextStyle(
                      color: isHovered ? kDarkBlueColor : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
        const SizedBox(
          width: 10,
        ),
        OnHover(
          builder: (bool isHovered) {
            //final color = ;
            return Center(
                child: Container(
              decoration: BoxDecoration(
                color: isHovered ? kLightBlueColor : kDarkBlueColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                border: Border.all(
                  width: 2,
                  color: isHovered ? kDarkBlueColor : kLightBlueColor,
                ),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Dashboard.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      color: isHovered ? kDarkBlueColor : Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
        const SizedBox(
          width: 40,
        ),
      ],
    );
  }
}
