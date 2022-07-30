import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Chat/customer_chat_screen.dart';
import 'package:skilled_bob_app_web/Customer/request_page.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/Providers/chat_provider.dart';
import 'package:skilled_bob_app_web/Providers/service_provider.dart';
import 'package:skilled_bob_app_web/constant.dart';

import '../Customer/customer_construction_service_screen.dart';
import '../Customer/customer_feedback_screen.dart';
import '../Customer/customer_it_service_screen.dart';
import '../Customer/customer_vehicle_services_screen.dart';
import '../Providers/my_favourite_provider.dart';

class JobDetailPageMobile extends StatefulWidget {
  String? jID;
  String? jobName;
  List? jobImages;
  String? jobPrice;
  String? jobDescription;
  String? jobRating;
  String? providerId;

  JobDetailPageMobile({
    Key? key,
    this.jID,
    this.jobPrice,
    this.jobDescription,
    this.jobName,
    this.jobImages,
    this.providerId,
    this.jobRating,
  }) : super(key: key);

  // const JobDetailPageMobile({Key? key}) : super(key: key);

  @override
  _JobDetailPageMobileState createState() => _JobDetailPageMobileState();
}

class _JobDetailPageMobileState extends State<JobDetailPageMobile> {
  bool favorite = false;
  int selectedImage = 0;
  String? name;
  Map<String, dynamic>? providerData = {};

  getMyFavListBool() {
    FirebaseFirestore.instance
        .collection("Favourite")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyFavourite")
        .doc(widget.jID)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(
                        () {
                          favorite = value.get("myFavourite");
                        },
                      ),
                    }
                }
            });
  }

  @override
  void initState() {
    // TODO: implement initState
    getProviderData();
    getMyFavListBool();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final _myFavProvider = Provider.of<MyFavouriteProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context
                .read<ChatProvider>()
                .setProviderUidAndEmail(widget.providerId.toString());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CustomerChatScreen()));
          },
          child: const Icon(Icons.chat),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
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
          // title: const Center(
          //   child: Text(
          //     ,
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: kDarkBlueColor,
          //       fontWeight: FontWeight.w500,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      favorite = !favorite;
                    });
                    if (favorite == true) {
                      _myFavProvider.addMyFavListData(
                        myFavouriteId: widget.jID,
                        myFavouriteImages: widget.jobImages,
                        myFavouriteTitle: widget.jobName,
                        myFavouritePrice: widget.jobPrice,
                        myFavouriteDescription: widget.jobDescription,
                        myFavouriteRating: widget.jobRating,
                      );
                    } else {
                      _myFavProvider.deleteMyFavData(widget.jID!);
                    }
                  },
                  icon: favorite == false
                      ? const Icon(
                          Icons.favorite_border,
                          color: kDarkBlueColor,
                          size: 26,
                        )
                      : const Icon(
                          Icons.favorite,
                          color: Colors.blue,
                          size: 26,
                        )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  // width: 238.0,
                  child: AspectRatio(
                    aspectRatio: 0.9,
                    child: Hero(
                      // tag: widget.product.id.toString(),
                      tag: widget.jID.toString(),
                      transitionOnUserGestures: true,
                      child: Image.network(
                        widget.jobImages![selectedImage],
                        fit: BoxFit.contain,
                        // color: Colors.red,
                        // width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                            widget.jobImages!.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    // FirebaseFirestore.instance.collection('Services').doc('car').collection('myServices').get
                                    setState(() {
                                      selectedImage = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 250),
                                    margin: const EdgeInsets.only(right: 15),
                                    padding: const EdgeInsets.all(8),
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: kDarkBlueColor.withOpacity(
                                              selectedImage == index ? 1 : 0)),
                                    ),
                                    child:
                                        Image.network(widget.jobImages![index]),
                                  ),
                                )),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   height: 270,
              //   width: 400,
              //   decoration: const BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.only(
              //         bottomRight: Radius.circular(50),
              //         bottomLeft: Radius.circular(50),
              //       )),
              //   child: ClipRRect(
              //     borderRadius: const BorderRadius.only(
              //       bottomRight: Radius.circular(40),
              //       bottomLeft: Radius.circular(40),
              //     ),
              //     child: Image.asset(
              //       'images/car service.jpg',
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),

              //job title
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    //color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.17,
                              child: Text(
                                widget.jobName!,
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 1.5,
                                  child: const Text(
                                    'Attock, Punjab, Pakistan',
                                    style: TextStyle(
                                      // overflow: TextOverflow.fade,
                                      fontSize: 12,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      //width: MediaQuery.of(context).size.width / 1.17,
                                      child: const Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                  const Text('(4.0)'),
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: screenWidth / 1.7,
                                  alignment: Alignment.centerRight,
                                  child: const Text(
                                    'Distance : ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              const Text(
                                '30 km',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10,
                ),
                child: Text(
                  'Description',
                  style: kBoldText,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 0,
                ),
                child: Text(
                  widget.jobDescription!,
                  style: kNormalText,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                  right: 30,
                  top: 10,
                  bottom: 5,
                ),
                child: Text(
                  'Review',
                  style: kBoldText,
                  textAlign: TextAlign.justify,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height * 0.23,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white70.withOpacity(0.9),
                          blurRadius: 1,
                          offset: const Offset(0, 5))
                    ],
                    border: Border.all(color: Colors.grey.withOpacity(0.05)),
                  ),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  'images/painting.jpg',
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                  //   errorWidget: (context, url,
                                  //           error) =>
                                  //       const Icon(Icons.error_outline),
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8,
                                ),
                                child: SizedBox(
                                    height: 32,
                                    child: Chip(
                                        padding: const EdgeInsets.all(0),
                                        label: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            Text(
                                              '(4.5)',
                                              style: kBodyText.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        backgroundColor:
                                            Colors.lightBlue.withOpacity(0.9),
                                        shape: const StadiumBorder())),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Peter',
                                    overflow: TextOverflow.ellipsis,
                                    style: kBodyText),
                                Text(
                                    'Hamza is such a great and experienced Man. He took all my suggestions and gave me an output that is beyond to my thinking, I am highly Impressed by his work and thoughts, He is a flutter Expert, ',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    maxLines: 5,
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  //height: MediaQuery.of(context).size.height * 0.23,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white70.withOpacity(0.9),
                          blurRadius: 1,
                          offset: const Offset(0, 5))
                    ],
                    border: Border.all(color: Colors.grey.withOpacity(0.05)),
                  ),
                  child: Wrap(
                    runSpacing: 20,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  'images/painting.jpg',
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                  //   errorWidget: (context, url,
                                  //           error) =>
                                  //       const Icon(Icons.error_outline),
                                  // ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 8,
                                ),
                                child: SizedBox(
                                    height: 32,
                                    child: Chip(
                                        padding: const EdgeInsets.all(0),
                                        label: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            const Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 16,
                                            ),
                                            Text(
                                              '(4.5)',
                                              style: kBodyText.copyWith(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        backgroundColor:
                                            Colors.lightBlue.withOpacity(0.9),
                                        shape: const StadiumBorder())),
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Peter',
                                    overflow: TextOverflow.ellipsis,
                                    style: kBodyText),
                                Text(
                                    'Hamza is such a great and experienced Man. He took all my suggestions and gave me an output that is beyond to my thinking, I am highly Impressed by his work and thoughts, He is a flutter Expert, ',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    softWrap: true,
                                    maxLines: 5,
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.0),
                child: Divider(
                  color: Colors.black45,
                  thickness: 1.5,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xffE0F3FF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: ClipRRect(
                                child: providerData!['profileURL'] == null
                                    ? Image.asset(
                                        'images/profile picture.jfif',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.network(
                                        providerData!['profileURL'].toString(),
                                        fit: BoxFit.cover,
                                      ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              backgroundColor: Colors.black87,
                              radius: 25,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  providerData!['userName'].toString(),
                                  style: kBoldText.copyWith(fontSize: 16),
                                ),
                                SizedBox(
                                    width: 200,
                                    child: Text(
                                      providerData!['address'].toString(),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    )),
                              ],
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10,
                ),
                child: Text(
                  'Recommended For You',
                  style: kBoldText,
                  textAlign: TextAlign.justify,
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
                                      const CustomerVehicleServicesScreen(
                                        serviceName: 'Cars & Motorbike Service',
                                      )));
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      const CustomerConstructionServicesScreen(
                                        serviceName: 'Construction & Painting',
                                      )));
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      const CustomerITServicesScreen(
                                        serviceName:
                                            'Web, Computer & IT Service',
                                      )));
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 80.0,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white60.withOpacity(0.9),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20.0),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${widget.jobPrice!}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        '/hour',
                        style: kNormalText,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: RaisedButton(
                      onPressed: () {
                        context.read<ServiceProvider>().setServicesData(
                              category: context
                                  .read<ServiceProvider>()
                                  .category
                                  .toString(),
                              title: widget.jobName,
                              serviceUid: widget.jID,
                              providerEmail: providerData!['email'].toString(),
                              providerUid: widget.providerId,
                            );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Request()));
                      },
                      child: const Text('Continue To Request'),
                      color: Colors.blue,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getProviderData() async {
    print('provider id: ${widget.providerId.toString()}');
    Map<String, dynamic>? ProviderData = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget.providerId.toString())
        .get()
        .then((value) => value.data());
    if (ProviderData != null) {
      setState(() {
        // name = ProviderData['userName'];
        providerData = ProviderData;
      });
    }
  }
}
