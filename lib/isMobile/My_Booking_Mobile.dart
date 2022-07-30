import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/customer_feedback_screen.dart';
import '../Providers/custom_snackbars.dart';
import '../constant.dart';
import '../something_went_wrong.dart';

class MyBookingMobile extends StatefulWidget {
  const MyBookingMobile({Key? key}) : super(key: key);

  @override
  _MyBookingMobileState createState() => _MyBookingMobileState();
}

class _MyBookingMobileState extends State<MyBookingMobile> {
  int initial_page = 0;
  bool convert = false;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initial_page);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          title: const Text(
            'My Orders',
            style: TextStyle(
                color: kDarkBlue, fontFamily: 'Open Sans', fontSize: 18),
          ),
          centerTitle: true,
          titleSpacing: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: kDarkBlue,
              size: 20,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    disabledElevation: 0,
                    textColor: Colors.blue,
                    color: Colors.white,
                    onPressed: () {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.bounceOut);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('Accepted'),
                    ),
                  ),
                  RaisedButton(
                    textColor: Colors.blue,
                    color: Colors.white,
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.bounceOut);
                      setState(() {
                        initial_page = 2;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('Requested'),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                //height: double.infinity,
                color: Colors.white,
                child: PageView(
                  controller: pageController,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('RequestsOnGig')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const SomethingWentWrong();
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: snapshot.data!.docs
                                        .map(
                                          (e) => e.get('status') == 'assigned'
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15.0, 15, 15, 5),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors.blue,
                                                            title: Text(
                                                              'Category: ${e.get('serviceCategory').toString()}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16.00,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            content: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                      // width:
                                                                      //     400,
                                                                      // height:
                                                                      //     200,
                                                                      child:
                                                                          Center(
                                                                    child: Image
                                                                        .network(
                                                                      e
                                                                          .get(
                                                                              'requesterImageURL')
                                                                          .toString(),
                                                                      height:
                                                                          200,
                                                                      width:
                                                                          400,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                    ),
                                                                  )),
                                                                  Text(
                                                                    'Name: ${e.get('requesterName').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'Email: ${e.get('requesterEmail').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'Location: ${e.get('requesterLocation').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Center(
                                                                    child: Text(
                                                                      'Message : \"${e.get('requesterMessage').toString()}\"',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16.00,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
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
                                                                  TextButton(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .red,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Completed",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Users')
                                                                          .doc(FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid)
                                                                          .collection(
                                                                              'RequestsOnGig')
                                                                          .doc(e
                                                                              .id)
                                                                          .update({
                                                                        'status':
                                                                            'completed',
                                                                      }).whenComplete(
                                                                              () {
                                                                        // context
                                                                        //     .read<CustomSnackBars>()
                                                                        //     .setCustomSnackBar(
                                                                        //       title: 'Request Completed.',
                                                                        //       message: 'Request Is Accepted.',
                                                                        //       contentType: ContentType.success,
                                                                        //       context: context,
                                                                        //     );
                                                                        Navigator.push(
                                                                            context,
                                                                            MaterialPageRoute(builder: (context) => const CustomerFeedbackScreen()));
                                                                      });
                                                                    },
                                                                  ),
                                                                ],
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              color:
                                                                  Colors.blue,
                                                              width: 2),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  e
                                                                      .get(
                                                                          'serviceCategory')
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                // Text(
                                                                //   '\$15',
                                                                //   style:
                                                                //       const TextStyle(
                                                                //     fontSize: 15,
                                                                //     fontFamily:
                                                                //         'Open Sans',
                                                                //   ),
                                                                // ),
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
                                                                  children: [
                                                                    const Text(
                                                                      'Customer Name',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          120,
                                                                      child: Text(e
                                                                          .get(
                                                                              'requesterName')
                                                                          .toString()),
                                                                    ),
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
                                                                  children: [
                                                                    const Text(
                                                                      'Location',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          Text(
                                                                        e
                                                                            .get('requesterLocation')
                                                                            .toString(),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
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
                                                )
                                              : Container(),
                                        )
                                        .toList(),
                                  ),
                                ],
                              );
                            }
                            return Container();
                          }),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('Users')
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .collection('RequestsOnGig')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const SomethingWentWrong();
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (snapshot.hasData) {
                              return Column(
                                children: [
                                  ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: snapshot.data!.docs
                                        .map(
                                          (e) => e.get('status') == 'unassigned'
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15.0, 15, 15, 5),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                Colors.blue,
                                                            title: Text(
                                                              'Category: ${e.get('serviceCategory').toString()}',
                                                              style:
                                                                  const TextStyle(
                                                                fontSize: 16.00,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            content: SizedBox(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                      width:
                                                                          400,
                                                                      height:
                                                                          200,
                                                                      child:
                                                                          Center(
                                                                        child: Image
                                                                            .network(
                                                                          e.get('requesterImageURL').toString(),
                                                                          height:
                                                                              200,
                                                                          width:
                                                                              400,
                                                                          fit: BoxFit
                                                                              .fill,
                                                                          alignment:
                                                                              Alignment.center,
                                                                        ),
                                                                      )),
                                                                  Text(
                                                                    'Name: ${e.get('requesterName').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'Email: ${e.get('requesterEmail').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Text(
                                                                    'Location: ${e.get('requesterLocation').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          16.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Center(
                                                                    child: Text(
                                                                      'Message : \"${e.get('requesterMessage').toString()}\"',
                                                                      style:
                                                                          const TextStyle(
                                                                        fontSize:
                                                                            16.00,
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
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
                                                                  TextButton(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .red,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Decline",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Users')
                                                                          .doc(FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid)
                                                                          .collection(
                                                                              'RequestsOnGig')
                                                                          .doc(e
                                                                              .id)
                                                                          .delete()
                                                                          .whenComplete(
                                                                              () {
                                                                        context
                                                                            .read<CustomSnackBars>()
                                                                            .setCustomSnackBar(
                                                                              title: 'Request Deleted.',
                                                                              message: 'Request Is Successfully Deleted.',
                                                                              contentType: ContentType.success,
                                                                              context: context,
                                                                            );
                                                                        Navigator.pop(
                                                                            context);
                                                                      });
                                                                    },
                                                                  ),
                                                                  TextButton(
                                                                    style: TextButton
                                                                        .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .red,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .green,
                                                                    ),
                                                                    child:
                                                                        const Text(
                                                                      "Accept",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      FirebaseFirestore
                                                                          .instance
                                                                          .collection(
                                                                              'Users')
                                                                          .doc(FirebaseAuth
                                                                              .instance
                                                                              .currentUser!
                                                                              .uid)
                                                                          .collection(
                                                                              'RequestsOnGig')
                                                                          .doc(e
                                                                              .id)
                                                                          .update({
                                                                        'status':
                                                                            'assigned',
                                                                      }).whenComplete(
                                                                              () {
                                                                        context
                                                                            .read<CustomSnackBars>()
                                                                            .setCustomSnackBar(
                                                                              title: 'Request Accepted.',
                                                                              message: 'Request Is Accepted.',
                                                                              contentType: ContentType.success,
                                                                              context: context,
                                                                            );
                                                                        Navigator.pop(
                                                                            context);
                                                                      });
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
                                                              color:
                                                                  Colors.blue,
                                                              width: 2),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          10))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  e
                                                                      .get(
                                                                          'serviceCategory')
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                // Text(
                                                                //   '\$15',
                                                                //   style:
                                                                //       const TextStyle(
                                                                //     fontSize: 15,
                                                                //     fontFamily:
                                                                //         'Open Sans',
                                                                //   ),
                                                                // ),
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
                                                                  children: [
                                                                    const Text(
                                                                      'Customer Name',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          120,
                                                                      child: Text(e
                                                                          .get(
                                                                              'requesterName')
                                                                          .toString()),
                                                                    ),
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
                                                                  children: [
                                                                    const Text(
                                                                      'Location',
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black54),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          200,
                                                                      child:
                                                                          Text(
                                                                        e
                                                                            .get('requesterLocation')
                                                                            .toString(),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
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
                                                )
                                              : Container(),
                                        )
                                        .toList(),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         border:
                                  //         Border.all(color: Colors.blue, width: 2),
                                  //         borderRadius: const BorderRadius.all(
                                  //             Radius.circular(10))),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Column(
                                  //         children: [
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: const [
                                  //               Text(
                                  //                 'Car Wash',
                                  //                 style: TextStyle(
                                  //                   fontSize: 18,
                                  //                   fontFamily: 'Open Sans',
                                  //                   fontWeight: FontWeight.bold,
                                  //                 ),
                                  //               ),
                                  //               Text(
                                  //                 '\$15',
                                  //                 style: TextStyle(
                                  //                   fontSize: 15,
                                  //                   fontFamily: 'Open Sans',
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           const SizedBox(
                                  //             height: 15,
                                  //           ),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Assigned',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text('Muhammad Usama'),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 color: Colors.black45,
                                  //                 width: 2,
                                  //                 height: 25,
                                  //               ),
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Location',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text(
                                  //                     'Attock, Punjab, Pakistan',
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  //
                                  // Padding(
                                  //   padding: const EdgeInsets.all(15.0),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         border:
                                  //         Border.all(color: Colors.blue, width: 2),
                                  //         borderRadius:
                                  //         BorderRadius.all(Radius.circular(10))),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Column(
                                  //         children: [
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: const [
                                  //               Text(
                                  //                 'Car Wash',
                                  //                 style: TextStyle(
                                  //                   fontSize: 18,
                                  //                   fontFamily: 'Open Sans',
                                  //                   fontWeight: FontWeight.bold,
                                  //                 ),
                                  //               ),
                                  //               Text(
                                  //                 '\$15',
                                  //                 style: TextStyle(
                                  //                   fontSize: 15,
                                  //                   fontFamily: 'Open Sans',
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           const SizedBox(
                                  //             height: 15,
                                  //           ),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Assigned',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text('Muhammad Usama'),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 color: Colors.black45,
                                  //                 width: 2,
                                  //                 height: 25,
                                  //               ),
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Location',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text(
                                  //                     'Attock, Punjab, Pakistan',
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(15.0),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         border:
                                  //         Border.all(color: Colors.blue, width: 2),
                                  //         borderRadius:
                                  //         BorderRadius.all(Radius.circular(10))),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Column(
                                  //         children: [
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: const [
                                  //               Text(
                                  //                 'Car Wash',
                                  //                 style: TextStyle(
                                  //                   fontSize: 18,
                                  //                   fontFamily: 'Open Sans',
                                  //                   fontWeight: FontWeight.bold,
                                  //                 ),
                                  //               ),
                                  //               Text(
                                  //                 '\$15',
                                  //                 style: TextStyle(
                                  //                   fontSize: 15,
                                  //                   fontFamily: 'Open Sans',
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           const SizedBox(
                                  //             height: 15,
                                  //           ),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Assigned',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text('Muhammad Usama'),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 color: Colors.black45,
                                  //                 width: 2,
                                  //                 height: 25,
                                  //               ),
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Location',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text(
                                  //                     'Attock, Punjab, Pakistan',
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(15.0),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         border:
                                  //         Border.all(color: Colors.blue, width: 2),
                                  //         borderRadius:
                                  //         BorderRadius.all(Radius.circular(10))),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Column(
                                  //         children: [
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: const [
                                  //               Text(
                                  //                 'Car Wash',
                                  //                 style: TextStyle(
                                  //                   fontSize: 18,
                                  //                   fontFamily: 'Open Sans',
                                  //                   fontWeight: FontWeight.bold,
                                  //                 ),
                                  //               ),
                                  //               Text(
                                  //                 '\$15',
                                  //                 style: TextStyle(
                                  //                   fontSize: 15,
                                  //                   fontFamily: 'Open Sans',
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           const SizedBox(
                                  //             height: 15,
                                  //           ),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Assigned',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text('Muhammad Usama'),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 color: Colors.black45,
                                  //                 width: 2,
                                  //                 height: 25,
                                  //               ),
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Location',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text(
                                  //                     'Attock, Punjab, Pakistan',
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(15.0),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         border:
                                  //         Border.all(color: Colors.blue, width: 2),
                                  //         borderRadius:
                                  //         BorderRadius.all(Radius.circular(10))),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Column(
                                  //         children: [
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: const [
                                  //               Text(
                                  //                 'Car Wash',
                                  //                 style: TextStyle(
                                  //                   fontSize: 18,
                                  //                   fontFamily: 'Open Sans',
                                  //                   fontWeight: FontWeight.bold,
                                  //                 ),
                                  //               ),
                                  //               Text(
                                  //                 '\$15',
                                  //                 style: TextStyle(
                                  //                   fontSize: 15,
                                  //                   fontFamily: 'Open Sans',
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           const SizedBox(
                                  //             height: 15,
                                  //           ),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Assigned',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text('Muhammad Usama'),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 color: Colors.black45,
                                  //                 width: 2,
                                  //                 height: 25,
                                  //               ),
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Location',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text(
                                  //                     'Attock, Punjab, Pakistan',
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.all(15.0),
                                  //   child: Container(
                                  //     decoration: BoxDecoration(
                                  //         border:
                                  //         Border.all(color: Colors.blue, width: 2),
                                  //         borderRadius:
                                  //         BorderRadius.all(Radius.circular(10))),
                                  //     child: Padding(
                                  //       padding: const EdgeInsets.all(8.0),
                                  //       child: Column(
                                  //         children: [
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: const [
                                  //               Text(
                                  //                 'Car Wash',
                                  //                 style: TextStyle(
                                  //                   fontSize: 18,
                                  //                   fontFamily: 'Open Sans',
                                  //                   fontWeight: FontWeight.bold,
                                  //                 ),
                                  //               ),
                                  //               Text(
                                  //                 '\$15',
                                  //                 style: TextStyle(
                                  //                   fontSize: 15,
                                  //                   fontFamily: 'Open Sans',
                                  //                 ),
                                  //               ),
                                  //             ],
                                  //           ),
                                  //           const SizedBox(
                                  //             height: 15,
                                  //           ),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //             MainAxisAlignment.spaceBetween,
                                  //             children: [
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Assigned',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text('Muhammad Usama'),
                                  //                 ],
                                  //               ),
                                  //               Container(
                                  //                 color: Colors.black45,
                                  //                 width: 2,
                                  //                 height: 25,
                                  //               ),
                                  //               Column(
                                  //                 crossAxisAlignment:
                                  //                 CrossAxisAlignment.start,
                                  //                 children: const [
                                  //                   Text(
                                  //                     'Location',
                                  //                     style: TextStyle(
                                  //                         color: Colors.black54),
                                  //                   ),
                                  //                   Text(
                                  //                     'Attock, Punjab, Pakistan',
                                  //                     overflow: TextOverflow.ellipsis,
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //             ],
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                ],
                              );
                            }
                            return Container();
                          }),
                    ),
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
