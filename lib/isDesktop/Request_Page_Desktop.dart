import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../Customer/category.dart';
import '../Customer/dashboard.dart';
import '../constant.dart';
import '../hover.dart';

class RequestPageDesktop extends StatefulWidget {
  const RequestPageDesktop({Key? key}) : super(key: key);

  @override
  _RequestPageDesktopState createState() => _RequestPageDesktopState();
}

class _RequestPageDesktopState extends State<RequestPageDesktop> {
  List<String> options = [
    'Cook',
    'Painter',
    'Driver',
    'Plumber',
    'Mechanic',
    'Digging',
    'Drilling',
    'Inspection Shafts',
    'Dog Training',
    'Pet Sitting',
    'Ventilation',
    'Cook2',
    'Painter2',
    'Driver2',
    'Plumber2',
    'Mechanic2',
    'Digging2',
    'Drilling2',
    'Inspection Shafts2',
    'Dog Training2',
    'Pet Sitting2',
    'Ventilation2 ',
    'Digging and Drilling'
  ];
  String? jobCategory;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 6,
          shadowColor: Colors.grey,
          // shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              MaterialButton(
                onPressed: () {},
                autofocus: false,
                // color: Colors.transparent,
                enableFeedback: false,
                child: Container(
                  height: size.height * 0.06,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //   image: AssetImage('images/logo.png'),
                    // ),
                  ),
                  child: Image.asset('images/horizontalLogo.png'),
                ),
              ),
            ],
          ),
          actions: [
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, IndexPage.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          color: isHovered ? kDarkBlueColor : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Categories.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                          color: isHovered ? kDarkBlueColor : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PostARequestCustomer.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Post A Request',
                        style: TextStyle(
                          color: isHovered ? kDarkBlueColor : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Dashboard.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'My Profile',
                        style: TextStyle(
                          color: isHovered ? kDarkBlueColor : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          // physics: NeverScrollableScrollPhysics(),
          primary: false,
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              width: size.width * 0.5,
              decoration: const BoxDecoration(color: Colors.white),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //name textfield
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.black45),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Name',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const SizedBox(
                                          width: 200,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter your Name',
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
                          //Email textfield
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.black45),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Email',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const SizedBox(
                                          width: 200,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Enter Email Address',
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
                          //Mobile Number textfield
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                border: Border.all(color: Colors.black45),
                                color: Colors.white,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 18.0, top: 13),
                                    child: Text(
                                      'Mobile Number',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(left: 15.0),
                                          child: Icon(
                                            Icons.account_circle_outlined,
                                            color: Colors.black38,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          color: Colors.black45,
                                          height: 26,
                                          width: 1.5,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const SizedBox(
                                          width: 200,
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText:
                                                  'Enter your Mobile Number',
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
                          //Message
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: TextFormField(
                              maxLines: 5,
                              style: const TextStyle(
                                  fontSize: 18,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.black87),
                              decoration: InputDecoration(
                                fillColor: Colors.blue[200]!.withOpacity(0.4),
                                filled: false,
                                hoverColor: kDarkBlue,
                                // helperText: 'Add Text',
                                hintText: 'Enter Message',
                                hintStyle: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                ),
                                prefixIcon: const Icon(
                                  Icons.description,
                                  color: Colors.black54,
                                ),
                                labelText: 'Message',
                                labelStyle: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black54,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black54),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black54),
                                ),
                                // focusColor: kOrange,
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          //upload
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, bottom: 2),
                            child: Container(
                              width: size.width,
                              height: size.height * 0.16,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black54,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'images/upload.png',
                                    height: 70,
                                    color: Colors.black,
                                  ),
                                  const Text(
                                    'Click to upload Image or Video.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //post A Job button
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 18.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: size.height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: kLightBlue,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Submit',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
