import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/Provider/provider_jobs_screen.dart';

import '../constant.dart';
import '../hover.dart';
import 'dashboard.dart';
import 'index_page.dart';

class Categories extends StatefulWidget {
  static const String id = 'Categories';

  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool locationBoxColor = false;
  bool listBoxColor = true;
  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
              // const Text(
              //   'SkilledBob',
              //   style: TextStyle(
              //     color: Colors.white,
              //     letterSpacing: 1.0,
              //     fontWeight: FontWeight.bold,
              //     fontFamily: 'PTSans',
              //     fontSize: 24,
              //   ),
              // ),
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
        // appBar: AppBar(
        //   shadowColor: Colors.transparent,
        //   backgroundColor: Colors.transparent,
        //   centerTitle: true,
        //   titleSpacing: 0,
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             pageController.previousPage(
        //                 duration: Duration(milliseconds: 1000),
        //                 curve: Curves.linearToEaseOut);
        //             locationBoxColor = true;
        //             listBoxColor = false;
        //           });
        //         },
        //         child: Container(
        //           width: 80,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             color: locationBoxColor == true
        //                 ? kDarkBlueColor
        //                 : Colors.white,
        //             border: Border.all(
        //               width: 2,
        //               color: kDarkBlueColor,
        //             ),
        //             borderRadius: const BorderRadius.only(
        //               bottomLeft: Radius.circular(30),
        //               topLeft: Radius.circular(30),
        //             ),
        //           ),
        //           child: Icon(
        //             Icons.location_on,
        //             color:
        //                 locationBoxColor == true ? Colors.white : Colors.blue,
        //             size: 26,
        //           ),
        //         ),
        //       ),
        //       InkWell(
        //         onTap: () {
        //           setState(() {
        //             pageController.nextPage(
        //                 duration: Duration(milliseconds: 1000),
        //                 curve: Curves.linearToEaseOut);
        //             listBoxColor = true;
        //             locationBoxColor = false;
        //           });
        //         },
        //         child: Container(
        //           width: 80,
        //           height: 45,
        //           decoration: BoxDecoration(
        //             color: listBoxColor == true ? kDarkBlueColor : Colors.white,
        //             border: Border.all(
        //               width: 2,
        //               color: kDarkBlueColor,
        //             ),
        //             borderRadius: BorderRadius.only(
        //               bottomRight: Radius.circular(30),
        //               topRight: Radius.circular(30),
        //             ),
        //           ),
        //           child: Icon(
        //             Icons.drag_handle_outlined,
        //             color: listBoxColor == true ? Colors.white : Colors.blue,
        //             size: 26,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //   leading: InkWell(
        //     onTap: () {
        //       Navigator.pop(context);
        //     },
        //     child: const Icon(
        //       Icons.arrow_back_ios_sharp,
        //       color: Colors.black87,
        //       size: 26,
        //     ),
        //   ),
        //   actions: [
        //     Icon(
        //       Icons.arrow_back_ios_sharp,
        //       color: Colors.transparent,
        //       size: 26,
        //     ),
        //   ],
        // ),
        body: PageView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Container(
              child: Image.asset(
                'images/google_map.jpg',
                fit: BoxFit.fill,
                //height: MediaQuery.of(context).size.height / 78,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.restaurant,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Restaurants',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.electrical_services,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Electrical',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.restaurant,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Restaurants',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.electrical_services,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Electrical',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.restaurant,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Car Service',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.electrical_services,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Electrical',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.restaurant,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Restaurants',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyServicesScreen.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25.0, top: 15, right: 15, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1.5,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: const CircleAvatar(
                                  child: Icon(
                                    Icons.electrical_services,
                                    color: kDarkBlueColor,
                                  ),
                                  backgroundColor: Colors.white,
                                  radius: 20,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Electrical',
                                style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          controller: pageController,
        ),
        floatingActionButton: locationBoxColor == true
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyServicesScreen()));
                },
                child: const Icon(Icons.arrow_forward),
              )
            : Container(),
      ),
    );
  }
}
//
// class DropdownTextField extends StatefulWidget {
//   const DropdownTextField({Key? key}) : super(key: key);
//
//   @override
//   State<DropdownTextField> createState() => _DropdownTextFieldState();
// }
//
// class _DropdownTextFieldState extends State<DropdownTextField> {
//   final _currencies = [
//     "Painting Service",
//     "Car & Bike Service",
//     "web design Service",
//     "Service1",
//     "Service2",
//     "Service3",
//     "Service4",
//     "Service5",
//   ];
//   var _currentSelectedValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return FormField<String>(
//       builder: (FormFieldState<String> state) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//           child: InputDecorator(
//             decoration: InputDecoration(
//                 fillColor: Color(0xff0f9df2).withOpacity(0.9),
//                 filled: true,
//                 errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
//                 hintText: 'Select Category',
//                 //labelText: 'how are you',
//                 hintStyle: const TextStyle(
//                   color: Colors.white70,
//                   backgroundColor: Colors.blue,
//                 ),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(7.0))),
//             isEmpty: _currentSelectedValue == '',
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<String>(
//                 hint: _currentSelectedValue == null
//                     ? const Text(
//                         'Select Category',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w700),
//                       )
//                     : Text(
//                         _currentSelectedValue,
//                         style: const TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//                 value: _currentSelectedValue,
//                 isDense: true,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     _currentSelectedValue = newValue!;
//                     state.didChange(newValue);
//                     Navigator.push(context,
//                         MaterialPageRoute(builder: (context) {
//                       return MyServicesScreen();
//                     }));
//                   });
//                 },
//                 items: _currencies.map((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
