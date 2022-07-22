import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/constant.dart';

class JobRequestMobile extends StatefulWidget {
  const JobRequestMobile({Key? key}) : super(key: key);

  @override
  _JobRequestMobileState createState() => _JobRequestMobileState();
}

class _JobRequestMobileState extends State<JobRequestMobile> {
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
            'Job Requests',
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
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              //padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                              scrollDirection: Axis.vertical,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 10, 15, 5),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: kDarkBlueColor,
                                            title: const Text(
                                              'Car Wash ',
                                              style: TextStyle(
                                                fontSize: 20.00,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Container(
                                              height: 220,
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Name : M.Usama',
                                                    style: TextStyle(
                                                      fontSize: 16.00,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Email : Usamaali@gmail.com",
                                                    style: TextStyle(
                                                      fontSize: 16.00,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Message: i am ali my eduction is in comsats",
                                                    style: TextStyle(
                                                      fontSize: 16.00,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
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
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.red,
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                    child: const Text(
                                                      "Decline",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.red,
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                    child: const Text(
                                                      "Accept",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
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
                                              color: Colors.blue, width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage(
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
                                              color: Colors.black45,
                                              width: 2,
                                              height: 60,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Car Wash',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  'Usamaali@gmail.com',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Container(
                                                  width: 240,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: const Text(
                                                    'Hi, I am usama a flutter Developer from comsats university islamabad Attock Campus.',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Center(
                                              child: Material(
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.chat,
                                                    color: kDarkBlueColor,
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
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              //padding: const EdgeInsets.fromLTRB(15.0, 35, 15, 5),
                              scrollDirection: Axis.vertical,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      15.0, 10, 15, 5),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            backgroundColor: kDarkBlueColor,
                                            title: const Text(
                                              'Car Wash ',
                                              style: TextStyle(
                                                fontSize: 20.00,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            content: Container(
                                              height: 220,
                                              width: 200,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: const [
                                                  Text(
                                                    'Name : M.Usama',
                                                    style: TextStyle(
                                                      fontSize: 16.00,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Email : Usamaali@gmail.com",
                                                    style: TextStyle(
                                                      fontSize: 16.00,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Message: i am ali my eduction is in comsats",
                                                    style: TextStyle(
                                                      fontSize: 16.00,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
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
                                                    style: TextButton.styleFrom(
                                                      primary: Colors.red,
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                    child: const Text(
                                                      "Completed",
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.blue, width: 2),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage(
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
                                              color: Colors.black45,
                                              width: 2,
                                              height: 60,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Car Wash',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontFamily: 'Open Sans',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  'Usamaali@gmail.com',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Container(
                                                  width: 240,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5),
                                                  child: const Text(
                                                    'Hi, I am usama a flutter Developer from comsats university islamabad Attock Campus.',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: Colors.black54,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Center(
                                              child: Material(
                                                child: InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.chat,
                                                    color: kDarkBlueColor,
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
    );
  }
}
