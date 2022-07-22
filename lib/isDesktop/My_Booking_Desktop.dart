import 'package:flutter/material.dart';
import '../Customer/dashboard.dart';
import '../Provider/provider_profile_screen.dart';
import '../constant.dart';
import '../responsive.dart';

class MyBookingDesktop extends StatefulWidget {
  const MyBookingDesktop({Key? key}) : super(key: key);

  @override
  _MyBookingDesktopState createState() => _MyBookingDesktopState();
}

class _MyBookingDesktopState extends State<MyBookingDesktop> {
  int initial_page = 0;
  bool convert = false;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initial_page);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(
        selected: 3,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: SideMenu(
                  selected: 3,
                ),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                              //context.read<MenuController>().controlMenu();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        Text(
                          "Booking",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SwitchListTile(
                                title: const Text(
                                  'Customer Mode',
                                  style: kBodyTextBlack,
                                ),
                                subtitle: const Text(
                                  'Turn switch on to go to provider Mode.',
                                  style: kBodyTextGrey,
                                ),
                                activeColor: kLightBlue,
                                value: convert,
                                onChanged: (selected) {
                                  setState(() {
                                    convert = !convert;

                                    Navigator.pushReplacementNamed(
                                        context, ProviderProfileScreen.id);
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: Column(
                              children: [
                                const SizedBox(height: 16.0),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          RaisedButton(
                                            disabledElevation: 0,
                                            textColor: Colors.blue,
                                            color: Colors.white,
                                            onPressed: () {
                                              pageController.previousPage(
                                                  duration: const Duration(
                                                      milliseconds: 1000),
                                                  curve: Curves.bounceOut);
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Text('Completed'),
                                            ),
                                          ),
                                          RaisedButton(
                                            textColor: Colors.blue,
                                            color: Colors.white,
                                            onPressed: () {
                                              pageController.nextPage(
                                                  duration: const Duration(
                                                      milliseconds: 1000),
                                                  curve: Curves.bounceOut);
                                              setState(() {
                                                initial_page = 2;
                                              });
                                            },
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Text('Requested'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Expanded(
                                  child: Container(
                                    height: 500,
                                    color: Colors.white,
                                    child: PageView(
                                      controller: pageController,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15.0, 35, 15, 5),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          physics: BouncingScrollPhysics(),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        15.0, 35, 15, 5),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.blue,
                                                          width: 2),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: const [
                                                            Text(
                                                              'Car Wash',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontFamily:
                                                                    'Open Sans',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              '\$15',
                                                              style: TextStyle(
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    'Open Sans',
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          height: 15,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Assigned',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                    'Muhammad Usama'),
                                                              ],
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .black45,
                                                              width: 2,
                                                              height: 25,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: const [
                                                                Text(
                                                                  'Location',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                Text(
                                                                  'Attock, Punjab, Pakistan',
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16.0),
                        // if (!Responsive.isMobile(context))
                        // Expanded(
                        //   flex: 2,
                        //   child: StarageDetails(),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
