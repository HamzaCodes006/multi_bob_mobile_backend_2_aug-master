import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/customer_construction_service_screen.dart';
import 'package:skilled_bob_app_web/Customer/customer_it_service_screen.dart';
import 'package:skilled_bob_app_web/Customer/customer_vehicle_services_screen.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/Customer/my_bookings.dart';
import 'package:skilled_bob_app_web/Customer/my_favorites.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/Customer/profile.dart';
import 'package:skilled_bob_app_web/Provider/provider_jobs_screen.dart';
import 'package:skilled_bob_app_web/Providers/location_provider.dart';
import 'package:skilled_bob_app_web/authentication/authentication_services.dart';
import 'package:skilled_bob_app_web/authentication/login_screen.dart';
import 'package:skilled_bob_app_web/Customer/category.dart';
import '../constant.dart';
import 'dart:math' as math;
import '../Customer/dashboard.dart';
import '../Customer/index_page.dart';
import '../Customer/my_bookings.dart';

class IndexPageMobile extends StatefulWidget {
  const IndexPageMobile({Key? key}) : super(key: key);

  @override
  _IndexPageMobileState createState() => _IndexPageMobileState();
}

class _IndexPageMobileState extends State<IndexPageMobile> {
  var _bottomNavIndex = 0;
  final List<String> imgList = [
    'images/car service.jpg',
    'images/painting.jpg',
    'images/web design.jfif',
  ];
  final iconList = <IconData>[
    Icons.home,
    Icons.favorite_border,
    Icons.category_outlined,
    Icons.account_circle_outlined,
  ];
  double? userLatitude;
  double? userLongitude;
  updateLocation() async {
    LocationProvider locationProvider = Provider.of(context, listen: false);
    Position position = await locationProvider.getCurrentAddress();
    await locationProvider.getDistance();
    setState(() {
      userLatitude = position.latitude;
      userLongitude = position.longitude;
      FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'userLatitude': userLatitude,
        'userLongitude': userLongitude,
      }).then((value) => print('Location Updated Successfully!'));
    });
  }

  @override
  void initState() {
    updateLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? documents =
        Provider.of<Map<String, dynamic>?>(context);
    Size size = MediaQuery.of(context).size;
    return documents != null
        ? SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              drawer: Drawer(
                child: Material(
                  color: Colors.blueAccent.shade200,
                  child: SafeArea(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 90,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                  width: 1.5,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      documents!['profileURL'].toString()),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                FirebaseAuth.instance.currentUser!.email
                                    .toString(),
                                style: kBodyText.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        BuildMenuItem(
                          icon: Icons.dashboard_outlined,
                          text: 'Dashboard',
                          onPresed: () {
                            Navigator.pushNamed(context, Dashboard.id);
                          },
                        ),
                        BuildMenuItem(
                          icon: Icons.account_circle_outlined,
                          text: 'Profile',
                          onPresed: () {
                            Navigator.pushNamed(context, Profile.id);
                          },
                        ),
                        BuildMenuItem(
                          icon: Icons.shopping_bag_rounded,
                          text: 'My Bookings',
                          onPresed: () {
                            Navigator.pushNamed(context, MyBookings.id);
                          },
                        ),
                        BuildMenuItem(
                          icon: Icons.favorite_border,
                          text: 'My Favorites',
                          onPresed: () {
                            Navigator.pushNamed(context, MyFavorites.id);
                          },
                        ),
                        BuildMenuItem(
                          icon: Icons.post_add,
                          text: 'Post A Request',
                          onPresed: () {
                            Navigator.pushNamed(
                                context, PostARequestCustomer.id);
                          },
                        ),
                        BuildMenuItem(
                          icon: Icons.chat,
                          text: 'Chat',
                          onPresed: () {},
                        ),
                        BuildMenuItem(
                          icon: Icons.language,
                          text: 'Languages',
                          onPresed: () {
                            //Navigator.pushNamed(context, MyFavorites.id);
                          },
                        ),
                        const SizedBox(height: 35),
                        const Divider(color: Colors.white, thickness: 1.4),
                        const SizedBox(
                          height: 35.0,
                        ),
                        BuildMenuItem(
                          icon: Icons.help,
                          text: 'Help',
                          onPresed: () {},
                        ),
                        BuildMenuItem(
                          icon: Icons.logout,
                          text: 'Log Out',
                          onPresed: () {
                            context
                                .read<AuthenticationService>()
                                .signOut(context);
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.id);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              ///get the location
              appBar: AppBar(
                iconTheme: const IconThemeData(color: kDarkBlueColor),
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                titleSpacing: 0,
                centerTitle: true,
                title: const Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kDarkBlueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: CarouselSlider(
                        options: CarouselOptions(
                            enlargeCenterPage: true,
                            pageSnapping: true,
                            aspectRatio: 2.0,
                            initialPage: 0,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 1800)),
                        items: imgList
                            .map((item) => ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8.0)),
                                  child: Center(
                                    child: Image.asset(item,
                                        fit: BoxFit.cover, width: 1000),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17.0, vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Row(
                              children: [
                                InkWell(
                                  child: const Text(
                                    'View all',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      //fontStyle: FontStyle.italic,
                                      // fontSize: 20,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ProviderJobsScreen()));
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             const Categories()));
                                  },
                                ),
                                Transform.rotate(
                                  angle: 180 * math.pi / 180,
                                  child: const Icon(
                                    Icons.arrow_back_ios_sharp,
                                    size: 15,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    //categories
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //Vehicle services container
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomerVehicleServicesScreen()));
                              },
                              child: Container(
                                width: 210,
                                height: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          4, 3), // changes position of shadow
                                    ),
                                  ],
                                  //color: Colors.white70.withOpacity(0.7),
                                  color: const Color(0xffE0F3FF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 210,
                                      height: 130,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          //topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'images/car service.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 15.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Vehicle Services',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                              //fontFamily: 'Dongle',
                                            ),
                                          ),
                                          Text(
                                            'Cars & Motorbike Service',
                                            style: TextStyle(
                                              fontSize: 13,
                                              //color: Colors.white,
                                              //fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //painting services container
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 0.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomerConstructionServicesScreen()));
                              },
                              child: Container(
                                width: 210,
                                height: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          4, 3), // changes position of shadow
                                    ),
                                  ],
                                  //color: Colors.white70.withOpacity(0.7),
                                  color: const Color(0xffE0F3FF),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 210,
                                      height: 130,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          //topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'images/painting.jpg',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 15.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'Construction',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            'Construction & Painting',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //web design services container
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 15.0,
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CustomerITServicesScreen()));
                              },
                              child: Container(
                                width: 210,
                                height: 180,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(
                                          4, 3), // changes position of shadow
                                    ),
                                  ],
                                  color: const Color(0xffE0F3FF),
                                  //color: Colors.white70.withOpacity(0.7),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 210,
                                      height: 130,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                        ),
                                        child: Image.asset(
                                          'images/web design.jfif',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 15.0,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'IT Service',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              //color: Colors.white,
                                              color: Colors.black87,
                                            ),
                                          ),
                                          Text(
                                            'Web, Computer & IT Service',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black87,
                                              //fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // How skilled bob works
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 18.0, top: 20),
                          child: Text(
                            'How MultiBob Works',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: 'PT Sans',
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3.0, vertical: 5),
                      child: Container(
                        //height: 220,
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.blue.withOpacity(0.3),
                        //       spreadRadius: 2,
                        //       blurRadius: 2,
                        //       offset: Offset(4, 4), // changes position of shadow
                        //     ),
                        //   ],
                        //   borderRadius: BorderRadius.all(Radius.circular(8)),
                        //   //color: Colors.blueAccent.withOpacity(1),
                        //   color: Color(0xff0F9CF1),
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       // Container(
                            //       //   height: 50,
                            //       //   width: 60,
                            //       //   child: Image.asset(
                            //       //     'images/logo.png',
                            //       //     //color: Colors.white,
                            //       //   ),
                            //       // ),
                            //       const Text(
                            //         'How SkilledBob Works',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.w800,
                            //           fontSize: 20,
                            //           color: Colors.white,
                            //         ),
                            //         textAlign: TextAlign.center,
                            //       ),
                            //       // Container(
                            //       //   height: 50,
                            //       //   width: 60,
                            //       //   child: Image.asset(
                            //       //     'images/logo.png',
                            //       //     //color: Colors.white,
                            //       //   ),
                            //       // ),
                            //     ],
                            //   ),
                            // ),
                            // const Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 79.0, vertical: 3),
                            //   child: Divider(
                            //     color: Colors.white,
                            //     height: 5,
                            //     thickness: 1,
                            //   ),
                            // ),
                            // const Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 15.0, vertical: 0),
                            //   child: Text(
                            //     'Skilledbob is the easiest and best way to find the perfect service provider for your needs',
                            //     //'. Whether you\'re looking for a plumber, hairdresser, car service, carpenter,web designer or a music band.Don\'t worry, get the best BOB to do the job and service you need.',
                            //     textAlign: TextAlign.justify,
                            //     style: TextStyle(
                            //       fontSize: 14,
                            //       color: Colors.black87,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: kLightBlueColor,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'POST AND DESCRIBE YOUR TASK',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'Post and describe the task for free! Please wait and MultiBob\'s group will respond with offers.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 80,
                                      child: Image.asset(
                                        'images/writing down.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: kLightBlueColor,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'CHOOSE A MULTIBOB YOU PREFER',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'View Bob\'s favorite profile, skills, and assessments. Make a personal decision about the professional service provider you hire.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 80,
                                      child: Image.asset(
                                        'images/one finger.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 15.0),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: kLightBlueColor,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'LIVE A SMARTER LIFE WITH MULTIBOB',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'Now relax and let MULTIBob do his job. Please rate it and prepare to post the next job.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 80,
                                      child: Image.asset(
                                        'images/smart home checked.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Why choose skilled bob
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 18.0, top: 10),
                          child: Text(
                            'Why Choose MultiBob',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0.0, vertical: 5),
                      child: Container(
                        //height: 220,
                        // decoration: BoxDecoration(
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.blue.withOpacity(0.3),
                        //       spreadRadius: 3,
                        //       blurRadius: 3,
                        //       offset:
                        //           const Offset(4, 4), // changes position of shadow
                        //     ),
                        //   ],
                        //   borderRadius: const BorderRadius.all(Radius.circular(8)),
                        //   color: Colors.blueAccent.withOpacity(1),
                        // ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Padding(
                            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       // Container(
                            //       //   height: 50,
                            //       //   width: 60,
                            //       //   child: Image.asset(
                            //       //     'images/logo.png',
                            //       //     //color: Colors.white,
                            //       //   ),
                            //       // ),
                            //       const Text(
                            //         'How SkilledBob Works',
                            //         style: TextStyle(
                            //           fontWeight: FontWeight.w800,
                            //           fontSize: 20,
                            //           color: Colors.white,
                            //         ),
                            //         textAlign: TextAlign.center,
                            //       ),
                            //       // Container(
                            //       //   height: 50,
                            //       //   width: 60,
                            //       //   child: Image.asset(
                            //       //     'images/logo.png',
                            //       //     //color: Colors.white,
                            //       //   ),
                            //       // ),
                            //     ],
                            //   ),
                            // ),
                            // const Padding(
                            //   padding:
                            //       EdgeInsets.symmetric(horizontal: 79.0, vertical: 3),
                            //   child: Divider(
                            //     color: Colors.white,
                            //     height: 5,
                            //     thickness: 1,
                            //   ),
                            // ),
                            // const Padding(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 15.0, vertical: 13),
                            //   child: Text(
                            //     'There is much more to do. But finding customers is not always easy. With SkilledBob you will not miss any opportunity in the field of services. You will receive the job application directly in your pocket.',
                            //     textAlign: TextAlign.justify,
                            //     style: TextStyle(
                            //       fontSize: 15,
                            //       color: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 18.0),
                              child: Container(
                                height: 145,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: kLightBlueColor,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'MEET NEW CUSTOMERS',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'The beauty of signing up for MultiBob. The hard part of finding a job is over. You receive them directly in the e-mail box. You get into the position of choosing the jobs you like to do.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 80,
                                      child: Image.asset(
                                        'images/hands.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 18.0),
                              child: Container(
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: kLightBlueColor,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'INCREASE INCOME',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'You get potential customers and you respond to them. More leads will follow. More jobs equals more income.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 80,
                                      child: Image.asset(
                                        'images/refund2.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 18.0),
                              child: Container(
                                height: 130,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: kLightBlueColor,
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'BUILD YOUR ONLINE REPUTATION',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black87,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.0),
                                              child: Text(
                                                'Allow your staff to be reviewed and evaluated. Leads will make decisions based on your ratings. The better your reputation, the more jobs you will get.',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black87,
                                                  //overflow: TextOverflow.ellipsis
                                                ),
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 90,
                                      height: 80,
                                      child: Image.asset(
                                        'images/five star.png',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostARequestCustomer()));
                },
                //params
                child: const Icon(
                  Icons.post_add,
                  color: Colors.white60,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                backgroundColor: kDarkBlueColor,
                icons: iconList,
                activeIndex: _bottomNavIndex = 0,
                gapLocation: GapLocation.center,
                activeColor: Colors.white,
                inactiveColor: Colors.white60,
                notchSmoothness: NotchSmoothness.softEdge,
                onTap: (index) {
                  setState(() {
                    if (index == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IndexPage()));
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyFavorites()));
                    } else if (index == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Categories()));
                    } else if (index == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()));
                    }
                  });
                },
                //other params
              ),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
