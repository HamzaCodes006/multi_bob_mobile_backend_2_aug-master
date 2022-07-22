import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../constant.dart';
import '../hover.dart';

class RequestPageMobile extends StatefulWidget {
  const RequestPageMobile({Key? key}) : super(key: key);

  @override
  _RequestPageMobileState createState() => _RequestPageMobileState();
}

class _RequestPageMobileState extends State<RequestPageMobile> {
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
            'Request',
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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //name textfield
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2),
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
                          padding: EdgeInsets.only(left: 18.0, top: 13),
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2),
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
                          padding: EdgeInsets.only(left: 18.0, top: 13),
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2),
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
                          padding: EdgeInsets.only(left: 18.0, top: 13),
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
                                    hintText: 'Enter your Mobile Number',
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2),
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
                        borderSide: const BorderSide(color: Colors.black54),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black54),
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
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.16,
                    decoration: BoxDecoration(
                      //color: Colors.blue[200]!.withOpacity(0.4),
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const IndexPage()));
                      },
                      child: const Text('Send Request'),
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
