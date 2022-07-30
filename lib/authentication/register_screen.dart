import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/constant.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import '../Providers/auth_provider.dart';
import '../Providers/custom_snackbars.dart';
import '../responsive.dart';
import 'authentication_services.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = 'RegisterScreen';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final _formKey = GlobalKey<FormState>();
  // late String userName, email, password, confirmPassword;
  bool _saving = false;

  @override
  void dispose() {
    // TODO: implement dispose
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _authData = Provider.of<AuthProvider>(
      context,
    );
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
              inAsyncCall: _saving,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.14,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            height: size.height * 0.11,
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
                      height: Responsive.hwValue(
                        context,
                        des: size.height * 0.5,
                        teb: size.height * 0.5,
                        mob: size.height * 0.40,
                      ),
                      width: Responsive.hwValue(
                        context,
                        des: size.width * 0.4,
                        teb: size.width * 0.88,
                        mob: size.width * 0.86,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.008,
                                horizontal: size.width * 0.05),
                            child: TextFormField(
                              controller: userNameController,
                              maxLines: 1,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  context
                                      .read<CustomSnackBars>()
                                      .setCustomSnackBar(
                                        title: 'Oh Snap!',
                                        message: 'Please Enter Your Username!',
                                        contentType: ContentType.failure,
                                        context: context,
                                      );
                                  return 'Please Enter Your Username!';
                                }
                                // setState(() {
                                //   userName = value;
                                // });
                                return null;
                              },
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.blue[200]!.withOpacity(0.4),
                                filled: true,
                                hintStyle: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                ),
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Theme.of(context).primaryColor,
                                ),
                                labelText: 'UserName',
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
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.008,
                                horizontal: size.width * 0.05),
                            child: TextFormField(
                              controller: emailController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // context
                                  //     .read<CustomSnackBars>()
                                  //     .setCustomSnackBar(
                                  //       title: 'Oh Snap!',
                                  //       message: 'Please Enter Email',
                                  //       contentType: ContentType.failure,
                                  //       context: context,
                                  //     );
                                  return 'Please Enter Email';
                                }
                                // final bool _isValid = EmailValidator.validate(
                                //     emailController.text);
                                // if (!_isValid) {
                                //   context
                                //       .read<CustomSnackBars>()
                                //       .setCustomSnackBar(
                                //         title: 'Oh Snap!',
                                //         message: 'Invalid Email Format',
                                //         contentType: ContentType.failure,
                                //         context: context,
                                //       );
                                //   return 'Invalid Email Format';
                                // }
                                // setState(() {
                                //   email = value;
                                // });
                                return null;
                              },
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.blue,
                              ),
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
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.008,
                                horizontal: size.width * 0.05),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // context
                                  //     .read<CustomSnackBars>()
                                  //     .setCustomSnackBar(
                                  //       title: 'Oh Snap!',
                                  //       message: 'Please Enter Password!',
                                  //       contentType: ContentType.failure,
                                  //       context: context,
                                  //     );
                                  return 'Please Enter Password!';
                                }
                                // if (value.length < 6) {
                                //   context
                                //       .read<CustomSnackBars>()
                                //       .setCustomSnackBar(
                                //         title: 'Oh Snap!',
                                //         message: 'Minimum 6 characters',
                                //         contentType: ContentType.failure,
                                //         context: context,
                                //       );
                                //   return 'Minimum 6 characters';
                                // }
                                // setState(() {
                                //   password = value;
                                // });
                                return null;
                              },
                              obscureText: true,
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.blue[200]!.withOpacity(0.4),
                                filled: true,
                                hintStyle: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.008,
                                horizontal: size.width * 0.05),
                            child: TextFormField(
                              controller: confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  // context
                                  //     .read<CustomSnackBars>()
                                  //     .setCustomSnackBar(
                                  //       title: 'Oh Snap!',
                                  //       message: 'Please Enter Password Again!',
                                  //       contentType: ContentType.failure,
                                  //       context: context,
                                  //     );
                                  return 'Please Enter Password Again!';
                                }
                                // if (value.length < 6) {
                                //   context
                                //       .read<CustomSnackBars>()
                                //       .setCustomSnackBar(
                                //         title: 'Oh Snap!',
                                //         message: 'Minimum 6 characters.',
                                //         contentType: ContentType.failure,
                                //         context: context,
                                //       );
                                //   return 'Minimum 6 characters.';
                                // }
                                // setState(() {
                                //   confirmPassword = value;
                                // });
                                return null;
                              },
                              obscureText: true,
                              style: TextStyle(
                                fontSize: size.height * 0.018,
                                color: Colors.blue,
                              ),
                              decoration: InputDecoration(
                                fillColor: Colors.blue[200]!.withOpacity(0.4),
                                filled: true,
                                hintStyle: const TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.grey,
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Theme.of(context).primaryColor,
                                ),
                                labelText: 'Confirm Password',
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
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              textAlign: TextAlign.left,
                            ),
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
                          teb: size.width * 0.9,
                          mob: size.width,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: kLightBlue,
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _saving = true;
                              });
                              String email = emailController.text.trim();
                              final valid = EmailValidator.validate(email);
                              if (valid == false) {
                                setState(() {
                                  _saving = false;
                                });
                                context
                                    .read<CustomSnackBars>()
                                    .setCustomSnackBar(
                                      title: 'Oh Snap!',
                                      message: 'Please Enter a valid Email.',
                                      contentType: ContentType.failure,
                                      context: context,
                                    );
                              } else if (confirmPasswordController.text
                                      .trim() !=
                                  passwordController.text.trim()) {
                                setState(() {
                                  _saving = false;
                                });
                                context
                                    .read<CustomSnackBars>()
                                    .setCustomSnackBar(
                                      title: 'Oh Snap!',
                                      message:
                                          'Please Enter a Password same as above.',
                                      contentType: ContentType.failure,
                                      context: context,
                                    );
                              } else if (passwordController.text.trim().length <
                                  6) {
                                setState(() {
                                  _saving = false;
                                });
                                context
                                    .read<CustomSnackBars>()
                                    .setCustomSnackBar(
                                      title: 'Oh Snap!',
                                      message:
                                          'Please Enter a Password of minimum length 6.',
                                      contentType: ContentType.failure,
                                      context: context,
                                    );
                                // _scaffoldKey.currentState!.showSnackBar(
                                //     const SnackBar(
                                //         content: Text(
                                //             "Please Enter a Password of minimum length 6")));
                              } else if (userNameController.text
                                  .trim()
                                  .isEmpty) {
                                setState(() {
                                  _saving = false;
                                });
                                context
                                    .read<CustomSnackBars>()
                                    .setCustomSnackBar(
                                      title: 'Oh Snap!',
                                      message: 'Please Enter UserName!',
                                      contentType: ContentType.failure,
                                      context: context,
                                    );
                                // _scaffoldKey.currentState!.showSnackBar(
                                //     const SnackBar(
                                //         content:
                                //             Text("Please Enter UserName")));
                              } else {
                                context
                                    .read<AuthenticationService>()
                                    .signUp(
                                        name: userNameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                        context: context)
                                    .then((value) {
                                  if (value == "Signed up") {
                                    setState(() {
                                      _saving = false;
                                    });
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const IndexPage()),
                                    );
                                  } else if (value == 'weak-password') {
                                    setState(() {
                                      _saving = false;
                                    });
                                    context
                                        .read<CustomSnackBars>()
                                        .setCustomSnackBar(
                                          title: 'Weak Password!',
                                          message:
                                              'The password provided is too weak.',
                                          contentType: ContentType.failure,
                                          context: context,
                                        );
                                  } else if (value == 'email-already-in-use') {
                                    setState(() {
                                      _saving = false;
                                    });
                                    context
                                        .read<CustomSnackBars>()
                                        .setCustomSnackBar(
                                          title: 'Email Already Exists',
                                          message:
                                              'The account already exists for that email.',
                                          contentType: ContentType.failure,
                                          context: context,
                                        );
                                  } else {
                                    setState(() {
                                      _saving = false;
                                    });
                                    context
                                        .read<CustomSnackBars>()
                                        .setCustomSnackBar(
                                          title: 'Oh Snap!',
                                          message: value.toString(),
                                          contentType: ContentType.failure,
                                          context: context,
                                        );
                                  }
                                });
                              }
                              // await _authData
                              //     .registerVendor(email, password)
                              //     .then((credentials) {
                              //   if (credentials?.user?.uid != null) {
                              //     _authData
                              //         .saveUserDataToDB(
                              //       userName: userName,
                              //         email: email,
                              //         password: password)
                              //         .then((value) {
                              //       setState(() {
                              //         _formKey.currentState?.reset();
                              //         _saving=false;
                              //       });
                              //       Navigator.pushReplacement(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) => const IndexPage(),
                              //         ),
                              //       );
                              //     }).catchError((onError) {
                              //       print('not added successfully');
                              //     });
                              //   } else {
                              //     setState(() {
                              //       _saving = false;
                              //     });
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //       SnackBar(
                              //           content: Text(_authData.error)),
                              //     );
                              //   }
                              //   setState(() {
                              //     _saving = false;
                              //   });
                              // });

                            }
                            // else {
                            //   setState(() {
                            //     _saving = false;
                            //   });
                            //   context
                            //       .read<CustomSnackBars>()
                            //       .setCustomSnackBar(
                            //     title: 'Oh Snap!',
                            //     message: 'Please Enter UserName!',
                            //     contentType: ContentType.failure,
                            //     context: context,
                            //   );
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //         content: Text(_authData.error.toString())),
                            //   );
                            // }
                            // setState(() {
                            //   _saving = false;
                            // });
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ?  ',
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text(
                            'Login',
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
