import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import '../constant.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  var _emailController = TextEditingController();
  late String email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: Responsive.isDesktop(context)
          ? null
          : AppBar(
              shadowColor: Colors.transparent,
              title: const Text(
                'Back',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Open Sans',
                  fontSize: 18,
                ),
              ),
              //centerTitle: true,
              actions: const [
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: CircleAvatar(
                    child: Icon(
                      FontAwesomeIcons.questionCircle,
                      color: kDarkBlueColor,
                      size: 25,
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
              titleSpacing: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.black54,
                  size: 20,
                ),
              ),
              backgroundColor: Colors.white,
              elevation: 5,
            ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 20,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Responsive.isDesktop(context)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Text(
                                  'Reset',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34,
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: const [
                                Text(
                                  'Reset',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34,
                                  ),
                                ),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 34,
                                  ),
                                ),
                              ],
                            ),

                      const SizedBox(
                        height: 15,
                      ),
                      Responsive.isDesktop(context)
                          ? SizedBox(
                              width: Responsive.isDesktop(context)
                                  ? size.width / 2.8
                                  : size.width,
                              child: const Text(
                                'Enter email associated with your account and we\'ll send an email with instructions to reset your password.',
                                style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const Text(
                              'Enter email associated with your account and we\'ll send an email with instructions to reset your password.',
                              style: TextStyle(
                                fontFamily: 'Open Sans',
                                fontWeight: FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                      Responsive.isDesktop(context)
                          ? SizedBox(
                              height: 20,
                            )
                          : Container(),
                      Transform.rotate(
                        angle: -0.25,
                        child: Center(
                          child: Image.asset(
                            'images/lock.jpg',
                            height: Responsive.isDesktop(context)
                                ? (size.height / 2.6)
                                : 160,
                            //color: kDarkBlueColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      //textfield
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 5.0),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Email';
                            }
                            final bool _isValid =
                                EmailValidator.validate(_emailController.text);
                            if (!_isValid) {
                              return 'Invalid Email Format';
                            }
                            setState(() {
                              email = value;
                            });
                            return null;
                          },
                          style: TextStyle(
                              fontSize: size.height * 0.018,
                              // fontWeight: FontWeight.bold,
                              color: Colors.blue),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            //hoverColor: kDarkBlue.withOpacity(0.1),
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.email,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.zero,
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
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //button
                      Center(
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? size.width / 2.8
                              : size.width,
                          decoration: const BoxDecoration(
                            color: kDarkBlueColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child:  Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 2.0),
                              child: FlatButton(

                                onPressed: () async{
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      await FirebaseAuth.instance
                                          .sendPasswordResetEmail(email: email);
                                      var snackBar = const SnackBar(
                                          content: Text(
                                              'Password reset email sent Successfully!'));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } catch (e) {
                                      print(e);
                                    }
                                  }
                                },
                                child: const Text(
                                  'Send Email',
                                  style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
