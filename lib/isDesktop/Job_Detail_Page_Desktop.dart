import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skilled_bob_app_web/Customer/appbar_class.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/constant.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import '../Customer/category.dart';
import '../hover.dart';

class JobDetailPageDesktop extends StatefulWidget {
  const JobDetailPageDesktop({Key? key}) : super(key: key);

  @override
  _JobDetailPageDesktopState createState() => _JobDetailPageDesktopState();
}

class _JobDetailPageDesktopState extends State<JobDetailPageDesktop> {
  int initial_page = 0;
  bool favorite = false;
  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final pageController = PageController(initialPage: initial_page);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // loadAssets();
        },
        child: const Icon(Icons.chat),
      ),
      appBar: const Appbar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.06,
                ),
                //image
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: OnHover(builder: (bool isHovered) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: size.height * 0.5,
                          width: size.width * 0.3,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: PageView(
                              controller: pageController,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Image.asset(
                                  'images/car service.jpg',
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  'images/image2.jpeg',
                                  fit: BoxFit.fill,
                                ),
                                Image.asset(
                                  'images/image1.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              ],
                            ),
                          ),
                        ),
                        isHovered
                            ? Positioned(
                                top: size.height * 0.2,
                                left: 0,
                                child: InkWell(
                                  onTap: () {
                                    pageController.previousPage(
                                      duration: const Duration(
                                        milliseconds: 500,
                                      ),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios_sharp,
                                    size: 70,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            : Container(),
                        if (isHovered)
                          Positioned(
                            top: size.height * 0.2,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                pageController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 500,
                                  ),
                                  curve: Curves.easeIn,
                                );
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                size: 70,
                                color: Colors.black,
                              ),
                            ),
                          )
                        else
                          Container(),
                      ],
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5,
                  ),
                  child: Container(
                    // width: size.width*0.3,
                    decoration: const BoxDecoration(
                      //color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            // width: MediaQuery.of(context).size.width / 1.17,
                            child: const Text(
                              'I will wash a car for you.',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 4,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.location_on,
                                size: 16,
                              ),
                              SizedBox(
                                // width:
                                // MediaQuery.of(context).size.width / 1.5,
                                child: Text(
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
                          // mainAxisAlignment:
                          // MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                // alignment: Alignment.centerLeft,
                                //width: MediaQuery.of(context).size.width / 1.17,
                                child: const Icon(
                                  Icons.star,
                                  size: 18.0,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            const Text('4.2 (3)'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                // width: screenWidth / 1.7,
                                // alignment: Alignment.centerRight,
                                child: const Text(
                                  'Distance : ',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              const Text(
                                ' 30 km',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Description',
                            style: kBoldText,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width * 0.3,
                            child: Text(
                              'Post and describe the task to be done totally for Free! Sit back and the pool of Multi Bob`s'
                              ' will respond with bids and offers.See the profile, skills, and ratings, from your preferred'
                              ' Bob. Make your personal decision which professional service provider you hire.'
                              'Now relax and let the Multibob do his job. Please rate him and get ready for your '
                              'next job post.',
                              style: kNormalText,
                              textAlign: TextAlign.justify,
                              maxLines: 7,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Center(
              child: Text(
                '4 Reviews',
                style: kBoldText.copyWith(fontSize: 25),
                textAlign: TextAlign.justify,
              ),
            ),
            const Divider(endIndent: 700, indent: 700),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.04,
                ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: size.width * 0.7,
                          //height: MediaQuery.of(context).size.height * 0.23,
                          padding: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white70.withOpacity(0.9),
                                  blurRadius: 1,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.05)),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 8,
                                        ),
                                        child: SizedBox(
                                            height: 32,
                                            child: Chip(
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
                                                backgroundColor: Colors
                                                    .lightBlue
                                                    .withOpacity(0.9),
                                                shape: const StadiumBorder())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                color: Theme.of(context)
                                                    .hintColor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: size.width * 0.7,
                          //height: MediaQuery.of(context).size.height * 0.23,
                          padding: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white70.withOpacity(0.9),
                                  blurRadius: 1,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.05)),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 8,
                                        ),
                                        child: SizedBox(
                                            height: 32,
                                            child: Chip(
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
                                                backgroundColor: Colors
                                                    .lightBlue
                                                    .withOpacity(0.9),
                                                shape: const StadiumBorder())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                color: Theme.of(context)
                                                    .hintColor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: size.width * 0.7,
                          //height: MediaQuery.of(context).size.height * 0.23,
                          padding: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white70.withOpacity(0.9),
                                  blurRadius: 1,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.05)),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 8,
                                        ),
                                        child: SizedBox(
                                            height: 32,
                                            child: Chip(
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
                                                backgroundColor: Colors
                                                    .lightBlue
                                                    .withOpacity(0.9),
                                                shape: const StadiumBorder())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                color: Theme.of(context)
                                                    .hintColor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Container(
                          width: size.width * 0.7,
                          //height: MediaQuery.of(context).size.height * 0.23,
                          padding: const EdgeInsets.symmetric(horizontal: 10),

                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white70.withOpacity(0.9),
                                  blurRadius: 1,
                                  offset: const Offset(0, 5))
                            ],
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.05)),
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10)),
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                          vertical: 8,
                                        ),
                                        child: SizedBox(
                                            height: 32,
                                            child: Chip(
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
                                                backgroundColor: Colors
                                                    .lightBlue
                                                    .withOpacity(0.9),
                                                shape: const StadiumBorder())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                color: Theme.of(context)
                                                    .hintColor)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.05,
                ),
                const Text(
                  'About The Provider',
                  style: kHeadTextBlack,
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: size.width * 0.03,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Dashboard.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0),
                    child: Container(
                      width: size.width * 0.3,
                      decoration: const BoxDecoration(
                        color: Color(0xffE0F3FF),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
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
                                    borderRadius: BorderRadius.all(
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
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: size.width * 0.03),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30.0,
                    vertical: 10,
                  ),
                  child: Container(
                    child: Text(
                      'Recommended For You',
                      style: kBoldText,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: List.generate(15, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      left: 30.0,
                      right: 15.0,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const MyServicesScreen()));
                      },
                      child: Container(
                        width: 200,
                        height: 200,
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
                  );
                }),
              ),
              // child: Row(
              //   children: [
              //     //car and bike services container
              //     Padding(
              //       padding: const EdgeInsets.only(
              //         top: 8.0,
              //         bottom: 8.0,
              //         left: 30.0,
              //         right: 15.0,
              //       ),
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.pushReplacement(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) =>
              //                       const MyServicesScreen()));
              //         },
              //         child: Container(
              //           width: 200,
              //           height: 200,
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey.withOpacity(0.5),
              //                 spreadRadius: 2,
              //                 blurRadius: 2,
              //                 offset:
              //                     Offset(4, 3), // changes position of shadow
              //               ),
              //             ],
              //             //color: Colors.white70.withOpacity(0.7),
              //             color: const Color(0xffE0F3FF),
              //             borderRadius: const BorderRadius.only(
              //               bottomLeft: Radius.circular(20),
              //               topRight: Radius.circular(20),
              //             ),
              //           ),
              //           child: Column(
              //             //mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 width: 210,
              //                 height: 100,
              //                 child: ClipRRect(
              //                   borderRadius: const BorderRadius.only(
              //                     //topLeft: Radius.circular(10),
              //                     topRight: Radius.circular(10),
              //                   ),
              //                   child: Image.asset(
              //                     'images/car service.jpg',
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                   vertical: 6.0,
              //                   horizontal: 15.0,
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: const [
              //                     Padding(
              //                       padding: EdgeInsets.all(0),
              //                       child: Text(
              //                         'Service',
              //                         style: TextStyle(
              //                           fontSize: 18,
              //                           fontWeight: FontWeight.bold,
              //                           color: Colors.black87,
              //                           //fontFamily: 'Dongle',
              //                         ),
              //                       ),
              //                     ),
              //                     Text(
              //                       'Car & Bike Services',
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                         //color: Colors.white,
              //                         //fontWeight: FontWeight.bold,
              //                         color: Colors.black87,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     //painting services container
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 8.0,
              //         horizontal: 0.0,
              //       ),
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.pushReplacement(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) =>
              //                       const MyServicesScreen()));
              //         },
              //         child: Container(
              //           width: 170,
              //           height: 150,
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey.withOpacity(0.5),
              //                 spreadRadius: 2,
              //                 blurRadius: 2,
              //                 offset:
              //                     Offset(4, 3), // changes position of shadow
              //               ),
              //             ],
              //             //color: Colors.white70.withOpacity(0.7),
              //             color: const Color(0xffE0F3FF),
              //             borderRadius: const BorderRadius.only(
              //               bottomLeft: Radius.circular(20),
              //               topRight: Radius.circular(20),
              //             ),
              //           ),
              //           child: Column(
              //             //mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 width: 210,
              //                 height: 100,
              //                 child: ClipRRect(
              //                   borderRadius: const BorderRadius.only(
              //                     //topLeft: Radius.circular(10),
              //                     topRight: Radius.circular(10),
              //                   ),
              //                   child: Image.asset(
              //                     'images/painting.jpg',
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                   vertical: 6.0,
              //                   horizontal: 15.0,
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: const [
              //                     Text(
              //                       'Painting',
              //                       style: TextStyle(
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w500,
              //                         //color: Colors.white,
              //                         color: Colors.black87,
              //                       ),
              //                     ),
              //                     Text(
              //                       'Wall Painting Services',
              //                       style: TextStyle(
              //                         fontSize: 14, color: Colors.black87,
              //                         //fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     //web design services container
              //     Padding(
              //       padding: const EdgeInsets.symmetric(
              //         vertical: 8.0,
              //         horizontal: 15.0,
              //       ),
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.pushReplacement(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) =>
              //                       const MyServicesScreen()));
              //         },
              //         child: Container(
              //           width: 170,
              //           height: 150,
              //           decoration: BoxDecoration(
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey.withOpacity(0.5),
              //                 spreadRadius: 2,
              //                 blurRadius: 2,
              //                 offset:
              //                     Offset(4, 3), // changes position of shadow
              //               ),
              //             ],
              //             color: const Color(0xffE0F3FF),
              //             //color: Colors.white70.withOpacity(0.7),
              //             borderRadius: const BorderRadius.only(
              //               bottomLeft: Radius.circular(20),
              //               topRight: Radius.circular(20),
              //             ),
              //           ),
              //           child: Column(
              //             //mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 width: 210,
              //                 height: 100,
              //                 child: ClipRRect(
              //                   borderRadius: const BorderRadius.only(
              //                     topLeft: Radius.circular(10),
              //                     topRight: Radius.circular(10),
              //                   ),
              //                   child: Image.asset(
              //                     'images/web design.jfif',
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.symmetric(
              //                   vertical: 6.0,
              //                   horizontal: 15.0,
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: const [
              //                     Text(
              //                       'Web Designing',
              //                       style: TextStyle(
              //                         fontSize: 18,
              //                         fontWeight: FontWeight.w500,
              //                         //color: Colors.white,
              //                         color: Colors.black87,
              //                       ),
              //                     ),
              //                     Text(
              //                       'Web Design Services',
              //                       style: TextStyle(
              //                         fontSize: 14,
              //                         color: Colors.black87,
              //                         //fontWeight: FontWeight.bold,
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            // bottom footer
            Container(
              height: size.height * 0.4,
              width: double.infinity,
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        'images/horizontalLogo.png',
                        scale: 4,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 45.0, top: 20, bottom: 10, right: 10),
                        child: SizedBox(
                          width: 350,
                          child: Text(
                            'Multibob is the easiest and best way to find the perfect service provider for your needs. Whether you are looking for a plumber, hairdresser, car service, carpenter, web designer or a music band. Don\'t worry, get the best BOB to do the job and service you need.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'SITE LINKS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Dashboard()));
                        },
                        child: const Text(
                          'My Profile',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Categories()));
                        },
                        child: const Text(
                          'Categories',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const PostARequestCustomer(),
                            ),
                          );
                        },
                        child: const Text(
                          'Post A Requests',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'SOCIAL MEDIA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(FontAwesomeIcons.twitter),
                            tooltip: 'Twitter',
                            color: kLightBlue,
                            onPressed: () {},
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Twitter',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10.0),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(FontAwesomeIcons.facebook),
                              tooltip: 'Facebook',
                              color: kLightBlue,
                              onPressed: () {}),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Facebook',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10.0),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(FontAwesomeIcons.instagram),
                              tooltip: 'Instagram',
                              color: kLightBlue,
                              onPressed: () {}),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Instagram',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'DOWNLOAD OUR APP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'images/google-play.png',
                        scale: 4,
                      ),
                      //const SizedBox(height: 10.0),
                      Image.asset(
                        'images/app-store.png',
                        scale: 7.6,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
