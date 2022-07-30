import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/job_detail_page.dart';
import 'package:skilled_bob_app_web/Customer/request_page.dart';
import 'package:skilled_bob_app_web/Providers/service_provider.dart';
import 'package:skilled_bob_app_web/constant.dart';
import '../constant.dart';
import '../widgets/booking_options_popup_menu_widget.dart';

class CustomerServicesScreen extends StatefulWidget {
  const CustomerServicesScreen({Key? key}) : super(key: key);

  @override
  _CustomerServicesScreenState createState() => _CustomerServicesScreenState();
}

class _CustomerServicesScreenState extends State<CustomerServicesScreen> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.read<ServiceProvider>().category.toString(),
          style: const TextStyle(fontSize: 18.0, color: kLightBlue),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: kLightBlue),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Services')
                    .doc(context.read<ServiceProvider>().category.toString())
                    .collection('myServices')
                    // .where('providerEmail',
                    //     isEqualTo: FirebaseAuth.instance.currentUser!.email)
                    // .orderBy('serviceTitle',descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                        child: CircularProgressIndicator(
                      color: kDarkBlueColor,
                    ));
                  }
                  final List uId = snapshot.data!.docs.map((e) {
                    return e.id;
                  }).toList();
                  final List serviceTitle = snapshot.data!.docs.map((e) {
                    return e['serviceTitle'];
                  }).toList();
                  final List servicePrice = snapshot.data!.docs.map((e) {
                    return e['servicePrice'];
                  }).toList();
                  final List serviceRating = snapshot.data!.docs.map((e) {
                    return e['serviceRating'];
                  }).toList();
                  final List serviceDescription = snapshot.data!.docs.map((e) {
                    return e['serviceDescription'];
                  }).toList();
                  final List serviceURL = snapshot.data!.docs.map((e) {
                    return e['serviceURL'];
                  }).toList();
                  final List providerId = snapshot.data!.docs.map((e) {
                    print(e['providerId']);
                    return e['providerId'];
                  }).toList();
                  final List serviceCategory = snapshot.data!.docs.map((e) {
                    return e['serviceCategory'];
                  }).toList();
                  return Wrap(
                    children: [
                      ListView.builder(
                          padding: const EdgeInsets.only(bottom: 10, top: 10),
                          primary: false,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: ((_, index) {
                            return GestureDetector(
                              onTap: () {
                                print(
                                    {'proooooooooooo : ${providerId[index]}'});
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => JobDetail(
                                      jID: uId[index],
                                      jobDescription: serviceDescription[index],
                                      jobImages: serviceURL[index],
                                      jobName: serviceTitle[index],
                                      jobPrice: servicePrice[index].toString(),
                                      providerId: providerId[index],
                                      category: serviceCategory[index],
                                      jobRating: serviceRating[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black87.withOpacity(0.1),
                                        blurRadius: 10,
                                        offset: const Offset(0, 5))
                                  ],
                                  border: Border.all(
                                      color: Colors.black87.withOpacity(0.05)),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(children: [
                                      Hero(
                                        tag: '',
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Image.network(
                                            serviceURL[index][0],
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,
//   errorWidget: (context, url,
//           error) =>
//       const Icon(Icons.error_outline),
// ),
                                          ),
                                        ),
                                      ),

//
                                    ]),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Wrap(
                                        runSpacing: 10,
                                        alignment: WrapAlignment.start,
                                        children: <Widget>[
                                          Row(children: [
                                            Expanded(
                                                child: Text(serviceTitle[index],
                                                    style: const TextStyle(
                                                        color: Colors.black87,
                                                        height: 1.4,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            const BookingOptionsPopupMenuWidget()
                                          ]),
                                          const Divider(
                                            height: 6,
                                            thickness: 0.5,
                                          ),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Wrap(
                                                    crossAxisAlignment:
                                                        WrapCrossAlignment
                                                            .center,
                                                    spacing: 5,
                                                    children: [
                                                      SizedBox(
                                                          height: 32,
                                                          child: Chip(
                                                              padding:
                                                                  const EdgeInsets.all(
                                                                      0),
                                                              label: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: <
                                                                      Widget>[
                                                                    const Icon(
                                                                        Icons
                                                                            .star,
                                                                        color:
                                                                            kLightBlue,
                                                                        size:
                                                                            16),
                                                                    Text(
                                                                        serviceRating[index]
                                                                            .toString(),
                                                                        style: const TextStyle(
                                                                            color:
                                                                                kLightBlue,
                                                                            height:
                                                                                1.4))
                                                                  ]),
                                                              backgroundColor:
                                                                  kLightBlue
                                                                      .withOpacity(
                                                                          0.15),
                                                              shape:
                                                                  const StadiumBorder())),
                                                      const Text('(44)',
                                                          style: TextStyle(
                                                              color: kLightBlue,
                                                              height: 1.4))
                                                    ]),
                                              ]),
                                          const Divider(
                                              height: 6, thickness: 0.5),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text('Description',
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black87)),
                                              Text(
                                                serviceDescription[index],
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }))
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
