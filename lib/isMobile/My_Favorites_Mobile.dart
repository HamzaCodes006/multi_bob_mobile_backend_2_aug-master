import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/job_detail_page.dart';
import '../constant.dart';

class MyFavoritesMobile extends StatefulWidget {
  const MyFavoritesMobile({Key? key}) : super(key: key);

  @override
  _MyFavoritesMobileState createState() => _MyFavoritesMobileState();
}

class _MyFavoritesMobileState extends State<MyFavoritesMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.blueAccent,
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: kDarkBlueColor,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Favorites',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kDarkBlueColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          titleSpacing: 0,
          centerTitle: true,
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('Favourite').doc(FirebaseAuth.instance.currentUser!.uid).collection(
                      'MyFavourite')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                          child: CircularProgressIndicator(
                            color: kDarkBlueColor,
                          ));
                    }
                    final List myFavouriteTitle = snapshot.data!.docs.map((e) {
                      return e['myFavouriteTitle'];
                    }).toList();
                    final List myFavouritePrice = snapshot.data!.docs.map((e) {
                      return e['myFavouritePrice'];
                    }).toList();
                    final List myFavouriteRating = snapshot.data!.docs.map((e) {
                      return e['myFavouriteRating'];
                    }).toList();
                    final List myFavouriteDescription = snapshot.data!.docs.map((e) {
                      return e['myFavouriteDescription'];
                    }).toList();
                    final List? myFavouriteURL = snapshot.data!.docs.map((e) {
                      return e['myFavouriteImage'];
                    }).toList();
                    final List myFavouriteId = snapshot.data!.docs.map((e) {
                      return e.id;
                    }).toList();
                    // final List serviceCategory = snapshot.data!.docs.map((e) {
                    //   return e['serviceCategory'];
                    // }).toList();
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => JobDetail(
                                        jobImages: myFavouriteURL![index],
                                        jID: myFavouriteId[index],
                                        jobDescription: myFavouriteDescription[index],
                                        jobName: myFavouriteTitle[index],
                                        jobPrice: myFavouritePrice[index],
                                        jobRating: myFavouriteRating[index],
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
                                          transitionOnUserGestures: true,
                                          tag: myFavouriteId[index].toString(),
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(10.0),
                                            child: Image.network(
                                              myFavouriteURL![index][0],
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
                                                  child: Text(myFavouriteTitle[index],
                                                      style: const TextStyle(
                                                          color: Colors.black87,
                                                          height: 1.4,
                                                          fontSize: 16,
                                                          fontWeight:
                                                          FontWeight.bold))),
                                              // BookingOptionsPopupMenuWidget()
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
                                                                          myFavouriteRating[
                                                                          index],
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
                                                  myFavouriteDescription[index],
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
      ),
    );
  }
}
