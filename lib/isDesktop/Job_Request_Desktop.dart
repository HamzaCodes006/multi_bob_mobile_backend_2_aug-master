import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/constant.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class JobRequestDesktop extends StatefulWidget {
  const JobRequestDesktop({Key? key}) : super(key: key);

  @override
  _JobRequestDesktopState createState() => _JobRequestDesktopState();
}

class _JobRequestDesktopState extends State<JobRequestDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int initial_page = 0;
  bool convert = false;
  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initial_page);
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ProviderSideMenu(
        selected: 4,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
// flex: 1, (default)
                child: ProviderSideMenu(
                  selected: 4,
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
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        Text(
                          "My Service Screen",
                          style: Theme.of(context).textTheme.headline6,
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
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RaisedButton(
                                        textColor: Colors.blue,
                                        color: Colors.white,
                                        onPressed: () {
                                          pageController.previousPage(
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
                                      ),
                                      RaisedButton(
                                        disabledElevation: 0,
                                        textColor: Colors.blue,
                                        color: Colors.white,
                                        onPressed: () {
                                          pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 1000),
                                              curve: Curves.bounceOut);
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text('Accepted'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    //height: 500,
                                    color: Colors.white,
                                    child: PageView(
                                      controller: pageController,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 35, 0, 0),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  //padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: 4,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          15.0, 10, 15, 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    kDarkBlueColor,
                                                                title:
                                                                    const Text(
                                                                  'Car Wash ',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20.00,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                content:
                                                                    SizedBox(
                                                                  height: 220,
                                                                  width: 200,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: const [
                                                                      Text(
                                                                        'Name : M.Usama',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.00,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Email : Usamaali@gmail.com",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.00,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Message: i am ali my eduction is in comsats",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.00,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Row(
                                                                    children: [
                                                                      TextButton(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.red,
                                                                          backgroundColor:
                                                                              Colors.red,
                                                                        ),
                                                                        child:
                                                                            const Text(
                                                                          "Decline",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                      TextButton(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.red,
                                                                          backgroundColor:
                                                                              Colors.red,
                                                                        ),
                                                                        child:
                                                                            const Text(
                                                                          "Accept",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 2),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const CircleAvatar(
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                          'images/car service.jpg'),
                                                                  radius: 30,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  color: Colors
                                                                      .black45,
                                                                  width: 2,
                                                                  height: 60,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Car Wash',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                      'Usamaali@gmail.com',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 8,
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          screenWidth /
                                                                              1.6,
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              5),
                                                                      child:
                                                                          const Text(
                                                                        'Hi, I am usama a flutter Developer from comsats university islamabad Attock Campus.',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black54,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Spacer(),
                                                                Center(
                                                                  child:
                                                                      Material(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .chat,
                                                                        color:
                                                                            kDarkBlueColor,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // SizedBox(
                                                                //   width:
                                                                //       screenWidth /
                                                                //           2.2,
                                                                // ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 35, 0, 0),
                                            child: Column(
                                              children: [
                                                ListView.builder(
                                                  shrinkWrap: true,
                                                  //padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: 4,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          15.0, 10, 15, 5),
                                                      child: InkWell(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                backgroundColor:
                                                                    kDarkBlueColor,
                                                                title:
                                                                    const Text(
                                                                  'Car Wash ',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        20.00,
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                content:
                                                                    Container(
                                                                  height: 220,
                                                                  width: 200,
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: const [
                                                                      Text(
                                                                        'Name : M.Usama',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.00,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Email : Usamaali@gmail.com",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.00,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        "Message: i am ali my eduction is in comsats",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              16.00,
                                                                          color:
                                                                              Colors.white,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      // Text(
                                                                      //   "Accepted By:",
                                                                      //   style: TextStyle(
                                                                      //     fontSize: 16.00,
                                                                      //     color: Colors.white,
                                                                      //     fontWeight: FontWeight.bold,
                                                                      //   ),
                                                                      // ),
                                                                      // SizedBox(
                                                                      //   height: 10,
                                                                      // ),
                                                                      // Text(
                                                                      //   "Assigned To:",
                                                                      //   style: TextStyle(
                                                                      //     fontSize: 16.00,
                                                                      //     color: Colors.white,
                                                                      //     fontWeight: FontWeight.bold,
                                                                      //   ),
                                                                      // ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  Row(
                                                                    children: [
                                                                      // TextButton(
                                                                      //   style: TextButton.styleFrom(
                                                                      //     primary: Colors.red,
                                                                      //     backgroundColor:
                                                                      //         Colors.red,
                                                                      //   ),
                                                                      //   child: const Text(
                                                                      //     "Decline",
                                                                      //     style: TextStyle(
                                                                      //         color: Colors.white),
                                                                      //   ),
                                                                      //   onPressed: () {
                                                                      //     Navigator.pop(context);
                                                                      //   },
                                                                      // ),
                                                                      TextButton(
                                                                        style: TextButton
                                                                            .styleFrom(
                                                                          primary:
                                                                              Colors.red,
                                                                          backgroundColor:
                                                                              Colors.red,
                                                                        ),
                                                                        child:
                                                                            const Text(
                                                                          "Completed",
                                                                          style:
                                                                              TextStyle(color: Colors.white),
                                                                        ),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                      ),
                                                                    ],
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .blue,
                                                                  width: 2),
                                                              borderRadius:
                                                                  const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10))),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                const CircleAvatar(
                                                                  backgroundImage:
                                                                      AssetImage(
                                                                          'images/car service.jpg'),
                                                                  radius: 30,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Container(
                                                                  color: Colors
                                                                      .black45,
                                                                  width: 2,
                                                                  height: 60,
                                                                ),
                                                                const SizedBox(
                                                                  width: 5,
                                                                ),
                                                                Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const Text(
                                                                      'Car Wash',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                    const Text(
                                                                      'Usamaali@gmail.com',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    const SizedBox(
                                                                      height: 8,
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          screenWidth /
                                                                              3,
                                                                      padding: const EdgeInsets
                                                                              .only(
                                                                          right:
                                                                              5),
                                                                      child:
                                                                          const Text(
                                                                        'Hi, I am usama a flutter Developer from comsats university islamabad Attock Campus.',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black54,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Center(
                                                                  child:
                                                                      Material(
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          const Icon(
                                                                        Icons
                                                                            .chat,
                                                                        color:
                                                                            kDarkBlueColor,
                                                                        size:
                                                                            30,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
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
