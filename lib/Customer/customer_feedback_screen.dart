import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/constant.dart';

import '../Providers/custom_snackbars.dart';

class CustomerFeedbackScreen extends StatefulWidget {
  static const String id = 'CustomerFeedbackScreen';
  final String? serviceId;

  const CustomerFeedbackScreen({
    Key? key,
    this.serviceId,
  }) : super(key: key);

  @override
  _CustomerFeedbackScreenState createState() => _CustomerFeedbackScreenState();
}

class _CustomerFeedbackScreenState extends State<CustomerFeedbackScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _reviewController = TextEditingController();
  String? review;
  double? _ratingValue;
  String? userProfileImage;
  String? userName;
  final _formKey = GlobalKey<FormState>();

  getUserInfo() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) => {
              setState(
                () {
                  userName = value.get("userName");
                  userProfileImage = value.get('profileURL');
                },
              ),
            });
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    DateTime dateToday =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

    // final String formatted = formatter. format(now);
    print(
        'nowwwwwwwwwwwwwwwwwwwww ${dateToday.day}-${dateToday.month}-${dateToday.year}');
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kDarkBlueColor,
            title: const Text(
              'Feedback',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            titleSpacing: 0,
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            leading: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.blue,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: size.height*0.1),
                      Text(
                        'How do you find your service?',
                        style: GoogleFonts.headlandOne(
                            color: Colors.black, fontSize: 18.0),
                        // style: TextStyle(fontSize: 22),
                      ),
                      const SizedBox(height: 25),
                      // implement the rating bar
                      RatingBar(
                          initialRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                              full:
                                  const Icon(Icons.star, color: kDarkBlueColor),
                              half: const Icon(
                                Icons.star_half,
                                color: kDarkBlueColor,
                              ),
                              empty: const Icon(
                                Icons.star_outline,
                                color: kDarkBlueColor,
                              )),
                          onRatingUpdate: (value) {
                            setState(() {
                              _ratingValue = value;
                            });
                          }),
                      const SizedBox(height: 25),
                      // Display the rate in number
                      Container(
                        width: 150,
                        height: 150,
                        decoration: const BoxDecoration(
                            color: kDarkBlueColor, shape: BoxShape.circle),
                        alignment: Alignment.center,
                        child: Text(
                          _ratingValue != null
                              ? _ratingValue.toString()
                              : 'Rate it!',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //Review
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          controller: _reviewController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Add Any Comment!';
                            }
                            return null;
                          },
                          maxLines: 6,
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: kDarkBlueColor),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            contentPadding: const EdgeInsets.all(8.0),
                            //hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.description,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Add a comment',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            // focusColor: kOrange,
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      //Submit button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: Container(
                          height: size.height * 0.07,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: kDarkBlueColor,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (_ratingValue != null) {
                                  _firestore.collection('Feedback').add({
                                    'rating': _ratingValue,
                                    'review': _reviewController.text.toString(),
                                    'userId':
                                        FirebaseAuth.instance.currentUser!.uid,
                                    'serviceId': widget.serviceId,
                                    'date':
                                        '${dateToday.day}-${dateToday.month}-${dateToday.year}',
                                    'userProfileImage': userProfileImage,
                                    'userName': userName,
                                  }).then((value) {
                                    context
                                        .read<CustomSnackBars>()
                                        .setCustomSnackBar(
                                            title: 'Thank You',
                                            message: 'Thanks For The Rating.',
                                            contentType: ContentType.success,
                                            context: context);
                                    Navigator.pushNamed(context, IndexPage.id);
                                  });
                                } else {
                                  context
                                      .read<CustomSnackBars>()
                                      .setCustomSnackBar(
                                          title: 'Rating!',
                                          message: 'Please Rate This Service.',
                                          contentType: ContentType.warning,
                                          context: context);
                                }

                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(content: Text('Feedback Saved')),
                                // );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Invalid Data!')));
                              }
                            },
                            child: Text(
                              'Submit',
                              style: kBodyText.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
