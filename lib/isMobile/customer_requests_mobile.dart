import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/constant.dart';
import 'package:skilled_bob_app_web/something_went_wrong.dart';

class CustomerRequestsMobile extends StatefulWidget {
  const CustomerRequestsMobile({Key? key}) : super(key: key);

  @override
  _CustomerRequestsMobileState createState() => _CustomerRequestsMobileState();
}

class _CustomerRequestsMobileState extends State<CustomerRequestsMobile> {
  int initial_page = 0;

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(initialPage: initial_page);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 26,
            ),
          ),
          title: const Text(
            'Customer Requests',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    textColor: Colors.blue,
                    color: Colors.white,
                    onPressed: () {
                      pageController.previousPage(
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
                  ),
                  RaisedButton(
                    disabledElevation: 0,
                    textColor: Colors.blue,
                    color: Colors.white,
                    onPressed: () {
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.bounceOut);
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text('Accepted'),
                    ),
                  ),
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
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection('BuyerRequests')
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
                                      //padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: snapshot.data!.docs.length,
                                      children: snapshot.data!.docs
                                          .map(
                                              (e) =>
                                                  e.get('status') ==
                                                          'unassigned'
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .fromLTRB(
                                                                  15.0,
                                                                  10,
                                                                  15,
                                                                  5),
                                                          child: InkWell(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                        kDarkBlueColor,
                                                                    title: Text(
                                                                      // doc
                                                                      //     .get('category')
                                                                      //     .toString(),
                                                                      'Category: ${e.get('category').toString()}',
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
                                                                    content:
                                                                        SizedBox(
                                                                      // height: 380,
                                                                      // width: 200,
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                              width: 150,
                                                                              height: 200,
                                                                              child: Center(
                                                                                child: Image.network(
                                                                                  e.get('URL').toString(),
                                                                                  height: 200,
                                                                                  fit: BoxFit.contain,
                                                                                  alignment: Alignment.center,
                                                                                ),
                                                                              )),
                                                                          Text(
                                                                            'Name: ${e.get('buyerName').toString()}',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16.00,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Email: ${e.get('buyerEmail').toString()}',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16.00,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Budget: ${e.get('jobBudget').toString()}',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16.00,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Text(
                                                                            'Location: ${e.get('location').toString()}',
                                                                            style:
                                                                                const TextStyle(
                                                                              fontSize: 16.00,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                5,
                                                                          ),
                                                                          Center(
                                                                            child:
                                                                                Text(
                                                                              'Message : \"${e.get('message').toString()}\"',
                                                                              style: const TextStyle(
                                                                                fontSize: 16.00,
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
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
                                                                          TextButton(
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              primary: Colors.red,
                                                                              backgroundColor: Colors.red,
                                                                            ),
                                                                            child:
                                                                                const Text(
                                                                              "Decline",
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                          TextButton(
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              primary: Colors.red,
                                                                              backgroundColor: Colors.red,
                                                                            ),
                                                                            child:
                                                                                const Text(
                                                                              "Accept",
                                                                              style: TextStyle(color: Colors.white),
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                          ),
                                                                        ],
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
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
                                                                  borderRadius: const BorderRadius
                                                                          .all(
                                                                      Radius.circular(
                                                                          10))),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        8.0),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    CircleAvatar(
                                                                      backgroundImage: NetworkImage(e
                                                                          .get(
                                                                              'buyerProfileURL')
                                                                          .toString()),
                                                                      radius:
                                                                          30,
                                                                      // child: Image.asset(
                                                                      //   'images/car service.jpg',
                                                                      //   fit: BoxFit.cover,
                                                                      // ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Container(
                                                                      color: Colors
                                                                          .black45,
                                                                      width: 2,
                                                                      height:
                                                                          60,
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
                                                                        Text(
                                                                          e.get('category').toString(),
                                                                          style:
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                18,
                                                                            fontFamily:
                                                                                'Open Sans',
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          e.get('buyerEmail').toString(),
                                                                          style:
                                                                              const TextStyle(color: Colors.black54),
                                                                        ),
                                                                        const SizedBox(
                                                                          height:
                                                                              8,
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              240,
                                                                          padding:
                                                                              const EdgeInsets.only(right: 5),
                                                                          child:
                                                                              Text(
                                                                            e.get('message').toString(),
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                const TextStyle(
                                                                              color: Colors.black54,
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
                                                                            Icons.chat,
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
                                                        )
                                                      : Container())
                                          .toList(),
                                      // itemBuilder: (context, index) {
                                      //   return Padding(
                                      //     padding: const EdgeInsets.fromLTRB(
                                      //         15.0, 10, 15, 5),
                                      //     child: InkWell(
                                      //       onTap: () {
                                      //         showDialog(
                                      //           context: context,
                                      //           builder:
                                      //               (BuildContext context) {
                                      //             return AlertDialog(
                                      //               backgroundColor:
                                      //                   kDarkBlueColor,
                                      //               title: Text(
                                      //                 doc
                                      //                     .get('category')
                                      //                     .toString(),
                                      //                 style: const TextStyle(
                                      //                   fontSize: 20.00,
                                      //                   color: Colors.white,
                                      //                   fontWeight:
                                      //                       FontWeight.bold,
                                      //                 ),
                                      //               ),
                                      //               content: Container(
                                      //                 height: 220,
                                      //                 width: 200,
                                      //                 child: Column(
                                      //                   crossAxisAlignment:
                                      //                       CrossAxisAlignment
                                      //                           .start,
                                      //                   children: const [
                                      //                     Text(
                                      //                       'Name : M.Usama',
                                      //                       style: TextStyle(
                                      //                         fontSize: 16.00,
                                      //                         color:
                                      //                             Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold,
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(
                                      //                       height: 10,
                                      //                     ),
                                      //                     Text(
                                      //                       "Email : Usamaali@gmail.com",
                                      //                       style: TextStyle(
                                      //                         fontSize: 16.00,
                                      //                         color:
                                      //                             Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold,
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(
                                      //                       height: 10,
                                      //                     ),
                                      //                     Text(
                                      //                       "Message: i am ali my eduction is in comsats",
                                      //                       style: TextStyle(
                                      //                         fontSize: 16.00,
                                      //                         color:
                                      //                             Colors.white,
                                      //                         fontWeight:
                                      //                             FontWeight
                                      //                                 .bold,
                                      //                       ),
                                      //                     ),
                                      //                     SizedBox(
                                      //                       height: 10,
                                      //                     ),
                                      //                     // Text(
                                      //                     //   "Accepted By:",
                                      //                     //   style: TextStyle(
                                      //                     //     fontSize: 16.00,
                                      //                     //     color: Colors.white,
                                      //                     //     fontWeight: FontWeight.bold,
                                      //                     //   ),
                                      //                     // ),
                                      //                     // SizedBox(
                                      //                     //   height: 10,
                                      //                     // ),
                                      //                     // Text(
                                      //                     //   "Assigned To:",
                                      //                     //   style: TextStyle(
                                      //                     //     fontSize: 16.00,
                                      //                     //     color: Colors.white,
                                      //                     //     fontWeight: FontWeight.bold,
                                      //                     //   ),
                                      //                     // ),
                                      //                   ],
                                      //                 ),
                                      //               ),
                                      //               actions: [
                                      //                 Row(
                                      //                   children: [
                                      //                     TextButton(
                                      //                       style: TextButton
                                      //                           .styleFrom(
                                      //                         primary:
                                      //                             Colors.red,
                                      //                         backgroundColor:
                                      //                             Colors.red,
                                      //                       ),
                                      //                       child: const Text(
                                      //                         "Decline",
                                      //                         style: TextStyle(
                                      //                             color: Colors
                                      //                                 .white),
                                      //                       ),
                                      //                       onPressed: () {
                                      //                         Navigator.pop(
                                      //                             context);
                                      //                       },
                                      //                     ),
                                      //                     TextButton(
                                      //                       style: TextButton
                                      //                           .styleFrom(
                                      //                         primary:
                                      //                             Colors.red,
                                      //                         backgroundColor:
                                      //                             Colors.red,
                                      //                       ),
                                      //                       child: const Text(
                                      //                         "Accept",
                                      //                         style: TextStyle(
                                      //                             color: Colors
                                      //                                 .white),
                                      //                       ),
                                      //                       onPressed: () {
                                      //                         Navigator.pop(
                                      //                             context);
                                      //                       },
                                      //                     ),
                                      //                   ],
                                      //                   mainAxisAlignment:
                                      //                       MainAxisAlignment
                                      //                           .spaceBetween,
                                      //                 ),
                                      //               ],
                                      //             );
                                      //           },
                                      //         );
                                      //       },
                                      //       child: Container(
                                      //         decoration: BoxDecoration(
                                      //             border: Border.all(
                                      //                 color: Colors.blue,
                                      //                 width: 2),
                                      //             borderRadius:
                                      //                 const BorderRadius.all(
                                      //                     Radius.circular(10))),
                                      //         child: Padding(
                                      //           padding:
                                      //               const EdgeInsets.all(8.0),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             children: [
                                      //               const CircleAvatar(
                                      //                 backgroundImage: AssetImage(
                                      //                     'images/car service.jpg'),
                                      //                 radius: 30,
                                      //                 // child: Image.asset(
                                      //                 //   'images/car service.jpg',
                                      //                 //   fit: BoxFit.cover,
                                      //                 // ),
                                      //               ),
                                      //               const SizedBox(
                                      //                 width: 5,
                                      //               ),
                                      //               Container(
                                      //                 color: Colors.black45,
                                      //                 width: 2,
                                      //                 height: 60,
                                      //               ),
                                      //               const SizedBox(
                                      //                 width: 5,
                                      //               ),
                                      //               Column(
                                      //                 mainAxisAlignment:
                                      //                     MainAxisAlignment
                                      //                         .start,
                                      //                 crossAxisAlignment:
                                      //                     CrossAxisAlignment
                                      //                         .start,
                                      //                 children: [
                                      //                   Text(
                                      //                     doc
                                      //                         .get('category')
                                      //                         .toString(),
                                      //                     style:
                                      //                         const TextStyle(
                                      //                       fontSize: 18,
                                      //                       fontFamily:
                                      //                           'Open Sans',
                                      //                       fontWeight:
                                      //                           FontWeight.bold,
                                      //                     ),
                                      //                   ),
                                      //                   Text(
                                      //                     doc
                                      //                         .get('buyerEmail')
                                      //                         .toString(),
                                      //                     style:
                                      //                         const TextStyle(
                                      //                             color: Colors
                                      //                                 .black54),
                                      //                   ),
                                      //                   const SizedBox(
                                      //                     height: 8,
                                      //                   ),
                                      //                   Container(
                                      //                     width: 240,
                                      //                     padding:
                                      //                         const EdgeInsets
                                      //                                 .only(
                                      //                             right: 5),
                                      //                     child: Text(
                                      //                       doc
                                      //                           .get('message')
                                      //                           .toString(),
                                      //                       overflow:
                                      //                           TextOverflow
                                      //                               .ellipsis,
                                      //                       style:
                                      //                           const TextStyle(
                                      //                         color: Colors
                                      //                             .black54,
                                      //                       ),
                                      //                     ),
                                      //                   ),
                                      //                 ],
                                      //               ),
                                      //               Center(
                                      //                 child: Material(
                                      //                   child: InkWell(
                                      //                     onTap: () {},
                                      //                     child: const Icon(
                                      //                       Icons.chat,
                                      //                       color:
                                      //                           kDarkBlueColor,
                                      //                       size: 30,
                                      //                     ),
                                      //                   ),
                                      //                 ),
                                      //               )
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   );
                                      // },
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            }),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: StreamBuilder<QuerySnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('Users')
                                .doc(FirebaseAuth.instance.currentUser!.uid)
                                .collection('BuyerRequests')
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
                                      //padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                                      scrollDirection: Axis.vertical,
                                      // itemCount: 4,
                                      children: snapshot.data!.docs
                                          .map((e) => e.get('status') ==
                                                  'assigned'
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15.0, 10, 15, 5),
                                                  child: InkWell(
                                                    onTap: () {
                                                      showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            backgroundColor:
                                                                kDarkBlueColor,
                                                            title: Text(
                                                              'Category : ${e.get('category').toString()}',
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
                                                            content: Container(
                                                              height: 220,
                                                              width: 200,
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Buyer Name : ${e.get('buyerName').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'Buyer Email : ${e.get('buyerEmail').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'Mesaages : ${e.get('message').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'Buyer Location : ${e.get('location').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    'Job Budget : ${e.get('jobBudget').toString()}',
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Text(
                                                                    "Assigned To: ${e.get('providerEmail').toString()}",
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14.00,
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            // actions: [
                                                            //   Row(
                                                            //     children: [
                                                            //       // TextButton(
                                                            //       //   style: TextButton.styleFrom(
                                                            //       //     primary: Colors.red,
                                                            //       //     backgroundColor:
                                                            //       //         Colors.red,
                                                            //       //   ),
                                                            //       //   child: const Text(
                                                            //       //     "Decline",
                                                            //       //     style: TextStyle(
                                                            //       //         color: Colors.white),
                                                            //       //   ),
                                                            //       //   onPressed: () {
                                                            //       //     Navigator.pop(context);
                                                            //       //   },
                                                            //       // ),
                                                            //       TextButton(
                                                            //         style:
                                                            //             TextButton.styleFrom(
                                                            //           primary: Colors.red,
                                                            //           backgroundColor: Colors.red,
                                                            //         ),
                                                            //         child:
                                                            //             const Text(
                                                            //           "Completed",
                                                            //           style: TextStyle(color: Colors.white),
                                                            //         ),
                                                            //         onPressed:
                                                            //             () {
                                                            //           Navigator.pop(context);
                                                            //         },
                                                            //       ),
                                                            //     ],
                                                            //     mainAxisAlignment:
                                                            //         MainAxisAlignment.end,
                                                            //   ),
                                                            // ],
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
                                                              // child: Image.asset(
                                                              //   'images/car service.jpg',
                                                              //   fit: BoxFit.cover,
                                                              // ),
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
                                                                Text(
                                                                  e
                                                                      .get(
                                                                          'category')
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  e
                                                                      .get(
                                                                          'buyerEmail')
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black54),
                                                                ),
                                                                const SizedBox(
                                                                  height: 8,
                                                                ),
                                                                Container(
                                                                  width: 240,
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right: 5),
                                                                  child: Text(
                                                                    e
                                                                        .get(
                                                                            'message')
                                                                        .toString(),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .black54,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Center(
                                                              child: Material(
                                                                child: InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      const Icon(
                                                                    Icons.chat,
                                                                    color:
                                                                        kDarkBlueColor,
                                                                    size: 30,
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container())
                                          .toList(),
                                    ),
                                  ],
                                );
                              }
                              return Container();
                            }),
                      ),
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
