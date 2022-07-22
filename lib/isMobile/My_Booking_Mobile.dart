import 'package:flutter/material.dart';
import '../constant.dart';

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
                      child: Text('Completed'),
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
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.blue, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Car Wash',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '\$15',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Open Sans',
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Assigned',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text('Muhammad Usama'),
                                          ],
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          width: 2,
                                          height: 25,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Location',
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            ),
                                            Text(
                                              'Attock, Punjab, Pakistan',
                                              overflow: TextOverflow.ellipsis,
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
    );
  }
}
