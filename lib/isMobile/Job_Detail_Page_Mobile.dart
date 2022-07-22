import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/request_page.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/constant.dart';

class JobDetailPageMobile extends StatefulWidget {
  const JobDetailPageMobile({Key? key}) : super(key: key);

  @override
  _JobDetailPageMobileState createState() => _JobDetailPageMobileState();
}

class _JobDetailPageMobileState extends State<JobDetailPageMobile> {
  bool favorite = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
              color: Colors.white,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Center(
            child: Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (favorite == true) {
                        setState(() {
                          favorite = false;
                        });
                      } else {
                        setState(() {
                          favorite = true;
                        });
                      }
                    });
                  },
                  icon: favorite == false
                      ? const Icon(
                          Icons.favorite_border,
                          color: Colors.white,
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
              Container(
                height: 270,
                width: 400,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    )),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  child: Image.asset(
                    'images/car service.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
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
                              child: const Text(
                                'Kala Khela PO Pir Baba Tehsil in Daggar District',
                                style: TextStyle(
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
                  'Kala Khela PO Pir Baba Tehsil Daggar District Kala Khela PO Pir Baba Tehsil Daggar District Kala Khela PO Pir Baba Tehsil Daggar District Kala Khela PO Pir Baba Tehsil Daggar District Kala Khela PO Pir Baba Tehsil Daggar District',
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
                                child: Image.asset(
                                  'images/profile picture.jfif',
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(50),
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
                                  'Usama Ali',
                                  style: kBoldText.copyWith(fontSize: 16),
                                ),
                                const Text('Flutter Developer'),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    //car and bike services container
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        bottom: 8.0,
                        left: 30.0,
                        right: 15.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyServicesScreen()));
                        },
                        child: Container(
                          width: 170,
                          height: 150,
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
                              Container(
                                width: 210,
                                height: 100,
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
                                    Padding(
                                      padding: EdgeInsets.all(0),
                                      child: Text(
                                        'Service',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          //fontFamily: 'Dongle',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Car & Bike Services',
                                      style: TextStyle(
                                        fontSize: 14,
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyServicesScreen()));
                        },
                        child: Container(
                          width: 170,
                          height: 150,
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
                                height: 100,
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
                                      'Painting',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'Wall Painting Services',
                                      style: TextStyle(
                                        fontSize: 14, color: Colors.black87,
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
                    //web design services container
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 15.0,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const MyServicesScreen()));
                        },
                        child: Container(
                          width: 170,
                          height: 150,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset:
                                    Offset(4, 3), // changes position of shadow
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
                              SizedBox(
                                width: 210,
                                height: 100,
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
                                      'Web Designing',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        //color: Colors.white,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      'Web Design Services',
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
                      const Text(
                        '\$15',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      Text(
                        '/per hour',
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
}
