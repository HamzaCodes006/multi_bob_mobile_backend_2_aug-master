import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/authentication/forget_password.dart';
import 'package:skilled_bob_app_web/authentication/register_screen.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../Providers/auth_provider.dart';
import '../Providers/custom_snackbars.dart';
import '../constant.dart';
import 'authentication_services.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _savingg = false;
  bool _visible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    late String email, password;
    final _authData = Provider.of<AuthProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        Container(
          height: size.height * 0.5,
          color: kLightBlue,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: ModalProgressHUD(
              inAsyncCall: _savingg,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.18,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.09,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('images/logo.png'),
                              ),
                            ),
                          ),
                          const Text(
                            'MultiBob',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Container(
                      // margin: const EdgeInsets.only(left: 30, top: 500, right: 30, bottom: 100),
                      height: Responsive.hwValue(
                        context,
                        des: size.height * 0.5,
                        teb: size.height * 0.3,
                        mob: size.height * 0.3,
                      ),
                      width: Responsive.hwValue(
                        context,
                        des: size.width * 0.4,
                        teb: size.width * 0.8,
                        mob: size.width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(
                                0, 1), // changes position of shadow
                          ),
                        ],
                        // borderRadius: BorderRadius.circular(0)
                      ),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 25.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Email';
                                }
                                final bool _isValid = EmailValidator.validate(
                                    emailController.text);
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
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 25.0),
                            child: TextFormField(
                              obscureText: _visible == false ? true : false,
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Password!';
                                }
                                if (value.length < 6) {
                                  return 'Minimum 6 characters';
                                }
                                setState(() {
                                  password = value;
                                });
                                return null;
                              },
                              style: TextStyle(
                                  fontSize: size.height * 0.018,
                                  color: Colors.blue),
                              decoration: InputDecoration(
                                fillColor: Colors.blue[200]!.withOpacity(0.4),
                                filled: true,
                                //hoverColor: kDarkBlue,
                                // helperText: 'Add Text',
                                hintStyle: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                ),
                                suffixIcon: IconButton(
                                  icon: _visible
                                      ? Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: Theme.of(context).primaryColor,
                                        )
                                      : Icon(
                                          Icons.visibility_off_outlined,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  },
                                ),
                                labelText: 'Password',
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
                              ),
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0.0, horizontal: 25.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgetPassword(),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          textAlign: TextAlign.end,
                                          style: kBodyText.copyWith(
                                            fontSize: 15,
                                            // wordSpacing: 1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<AuthenticationService>()
                                      .signInWithGoogle(context)
                                      .whenComplete(() => null);
                                },
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/google.png'),
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<AuthenticationService>()
                                      .signInWithFacebook(context);
                                },
                                child: const CircleAvatar(
                                  backgroundImage:
                                      AssetImage('images/facebook.png'),
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: Container(
                        height: size.height * 0.07,
                        width: Responsive.hwValue(
                          context,
                          des: size.width * 0.4,
                          teb: size.width * 0.8,
                          mob: size.width * 0.8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kLightBlue,
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _savingg = true;
                              });
                              try {
                                String email = emailController.text.trim();
                                final valid = EmailValidator.validate(email);
                                if (valid == false) {
                                  setState(() {
                                    _savingg = false;
                                  });
                                  _scaffoldKey.currentState!.showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please Enter a valid Email")));
                                } else if (passwordController.text
                                        .trim()
                                        .length <
                                    6) {
                                  setState(() {
                                    _savingg = false;
                                  });
                                  _scaffoldKey.currentState!.showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please Enter a Password of minimum length 6")));
                                } else {
                                  context
                                      .read<AuthenticationService>()
                                      .signIn(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                          context: context)
                                      .then((value) {
                                    if (value == 'user-not-found') {
                                      setState(() {
                                        _savingg = false;
                                      });
                                      context
                                          .read<CustomSnackBars>()
                                          .setCustomSnackBar(
                                            title: 'Email Not Exists',
                                            message:
                                                'No user found for that email.',
                                            contentType: ContentType.failure,
                                            context: context,
                                          );
                                    } else if (value == 'wrong-password') {
                                      setState(() {
                                        _savingg = false;
                                      });
                                      context
                                          .read<CustomSnackBars>()
                                          .setCustomSnackBar(
                                            title: 'Wrong password!',
                                            message: 'Wrong password provided.',
                                            contentType: ContentType.failure,
                                            context: context,
                                          );
                                    } else {
                                      setState(() {
                                        _savingg = false;
                                      });
                                      print('logged in');
                                      // context
                                      //     .read<CustomSnackBars>()
                                      //     .setCustomSnackBar(
                                      //       title: 'Oh Snap!',
                                      //       message: value.toString(),
                                      //       contentType: ContentType.failure,
                                      //       context: context,
                                      //     );
                                    }
                                  });
                                  // setState(() {
                                  //   _savingg = false;
                                  // });
                                }
                                // await _authData
                                //     .loginUser(email, password)
                                //     .then((credential) async {
                                //   if (credential?.user?.uid != null) {
                                //     // LocationPermission permission =
                                //     // await Geolocator.requestPermission();
                                //     // await locationData.getCurrentLocation();
                                //     // if (locationData.permit == true) {
                                //     // print('aaaaaaaaaaaaaa');
                                //     // final prefs =
                                //     // await SharedPreferences.getInstance();
                                //     // prefs.setString(
                                //     //     'email', emailController.text);
                                //     // Get.to(HomeScreen());
                                //     // print('ccccccccccccccccccccc');
                                //     // GetMaterialApp(home: HomeScreen(),);
                                //     Navigator.pushReplacement(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => const IndexPage(),
                                //       ),
                                //     );
                                //
                                //     // } else {
                                //     //   print('Permission not allowed!');
                                //     //   ScaffoldMessenger.of(context).showSnackBar(
                                //     //       const SnackBar(
                                //     //           content: Text(
                                //     //               'Allow Permission First')));
                                //     // }
                                //   } else {
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //         SnackBar(
                                //             content: Text(_authData.error)));
                                //     setState(() {
                                //       _savingg = false;
                                //     });
                                //   }
                                // });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())));
                                setState(() {
                                  _savingg = false;
                                });
                              }
                            }
                            // if (emailController.text == 'customer@gmail.com' &&
                            //     passwordController.text == '123456') {
                            //   Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const IndexPage(),
                            //     ),
                            //   );
                            // } else {
                            //   Navigator.pushReplacement(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const LoginScreen(),
                            //     ),
                            //   );
                            // }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?  ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            'Sign Up',
                            style: kBodyText.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
