import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../Customer/dashboard.dart';
import '../Provider/provider_profile_screen.dart';
import '../constant.dart';
import '../hover.dart';

class PostARequestCustomerDesktop extends StatefulWidget {
  const PostARequestCustomerDesktop({Key? key}) : super(key: key);

  @override
  _PostARequestCustomerDesktopState createState() =>
      _PostARequestCustomerDesktopState();
}

class _PostARequestCustomerDesktopState
    extends State<PostARequestCustomerDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
  int initial_page = 0;
  bool convert = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(
        selected: 4,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: SideMenu(
                  selected: 4,
                ),
              ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        if (!Responsive.isDesktop(context))
                          IconButton(
                            onPressed: () {
                              _scaffoldKey.currentState!.openDrawer();
                              //context.read<MenuController>().controlMenu();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        Text(
                          "Post A Request",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SwitchListTile(
                                title: const Text(
                                  'Customer Mode',
                                  style: kBodyTextBlack,
                                ),
                                subtitle: const Text(
                                  'Turn switch on to go to provider Mode.',
                                  style: kBodyTextGrey,
                                ),
                                activeColor: kLightBlue,
                                value: convert,
                                onChanged: (selected) {
                                  setState(() {
                                    convert = !convert;

                                    Navigator.pushReplacementNamed(
                                        context, ProviderProfileScreen.id);
                                  });
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: SingleChildScrollView(
                              child: Center(
                                child: Form(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //job category
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.0),
                                            child: Text(
                                              'Select the category you want.',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 25.0),
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: kLightBlue,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Container(
                                                width: size.width,
                                                height: size.height * 0.075,
                                                decoration: BoxDecoration(
                                                  // color: Colors.blue[200]!
                                                  //     .withOpacity(0.4),
                                                  borderRadius:
                                                      BorderRadiusDirectional
                                                          .circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    const Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Icon(
                                                        Icons.category_outlined,
                                                        color: kLightBlue,
                                                        size: 22.0,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 5.0),
                                                      child: DropdownButton<
                                                          String>(
                                                        // focusColor: Colors.red,
                                                        dropdownColor:
                                                            Colors.white,
                                                        // kLightBlue
                                                        //     .withOpacity(
                                                        //         0.8),
                                                        itemHeight: 60.0,
                                                        hint: const Text(
                                                          'Select Job Category',
                                                          style: TextStyle(
                                                            fontSize: 17.0,
                                                            color: Colors.blue,
                                                          ),
                                                        ),
                                                        // value: jobCategory,
                                                        icon: const Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      30.0),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_outlined,
                                                            color: kLightBlue,
                                                            size: 22,
                                                          ),
                                                        ),
                                                        underline:
                                                            const SizedBox(),
                                                        iconSize: 22.0,
                                                        style: kBodyText,
                                                        onChanged:
                                                            (String? newValue) {
                                                          setState(() {
                                                            jobCategory =
                                                                newValue;
                                                          });
                                                        },
                                                        value: jobCategory,
                                                        // newValue // selectedItemBuilder: (BuildContext context) {
                                                        //   return options.map((String value) {
                                                        //     return Text(
                                                        //       dropdownValue,
                                                        //       style: const TextStyle(color: Colors.black87),
                                                        //     );
                                                        //   }).toList();
                                                        // },
                                                        items: options.map<
                                                            DropdownMenuItem<
                                                                String>>((String
                                                            value) {
                                                          return DropdownMenuItem<
                                                              String>(
                                                            onTap: () {
                                                              setState(() {
                                                                jobCategory =
                                                                    value;
                                                              });
                                                            },
                                                            alignment: Alignment
                                                                .center,
                                                            value: value,
                                                            enabled: true,
                                                            child: Text(
                                                              value,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .blue),
                                                            ),
                                                          );
                                                        }).toList(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          //upload
                                          // const Padding(
                                          //   padding:
                                          //       EdgeInsets.only(left: 25.0),
                                          //   child: Text(
                                          //     'Upload any three images of your services.',
                                          //     style: TextStyle(
                                          //       fontSize: 16,
                                          //       color: Colors.blue,
                                          //     ),
                                          //   ),
                                          // ),
                                          // Row(
                                          //   children: [
                                          //     Padding(
                                          //       padding: const EdgeInsets
                                          //               .symmetric(
                                          //           vertical: 8.0,
                                          //           horizontal: 25.0),
                                          //       child: Container(
                                          //         width: size.width / 4.4,
                                          //         height: size.height * 0.17,
                                          //         decoration: BoxDecoration(
                                          //           // color: Colors.blue[200]!
                                          //           //     .withOpacity(0.4),
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           border: Border.all(
                                          //             color: kLightBlue,
                                          //             width: 1,
                                          //           ),
                                          //         ),
                                          //         child: Column(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             Image.asset(
                                          //               'images/upload.png',
                                          //               height: 70,
                                          //               color: kDarkBlueColor,
                                          //             ),
                                          //             const Text(
                                          //               'Click to upload Image or Video.',
                                          //               textAlign:
                                          //                   TextAlign.center,
                                          //               style: TextStyle(
                                          //                   color:
                                          //                       Colors.blue),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Padding(
                                          //       padding: const EdgeInsets
                                          //               .symmetric(
                                          //           vertical: 8.0,
                                          //           horizontal: 25.0),
                                          //       child: Container(
                                          //         width: size.width / 4.4,
                                          //         height: size.height * 0.17,
                                          //         decoration: BoxDecoration(
                                          //           // color: Colors.blue[200]!
                                          //           //     .withOpacity(0.4),
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           border: Border.all(
                                          //             color: kLightBlue,
                                          //             width: 1,
                                          //           ),
                                          //         ),
                                          //         child: Column(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             Image.asset(
                                          //               'images/upload.png',
                                          //               height: 70,
                                          //               color: kDarkBlueColor,
                                          //             ),
                                          //             const Text(
                                          //               'Click to upload Image or Video.',
                                          //               textAlign:
                                          //                   TextAlign.center,
                                          //               style: TextStyle(
                                          //                   color:
                                          //                       Colors.blue),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //     Padding(
                                          //       padding: const EdgeInsets
                                          //               .symmetric(
                                          //           vertical: 8.0,
                                          //           horizontal: 25.0),
                                          //       child: Container(
                                          //         width: size.width / 4.5,
                                          //         height: size.height * 0.17,
                                          //         decoration: BoxDecoration(
                                          //           // color: Colors.blue[200]!
                                          //           //     .withOpacity(0.4),
                                          //           borderRadius:
                                          //               BorderRadius.circular(
                                          //                   10),
                                          //           border: Border.all(
                                          //             color: kLightBlue,
                                          //             width: 1,
                                          //           ),
                                          //         ),
                                          //         child: Column(
                                          //           mainAxisAlignment:
                                          //               MainAxisAlignment
                                          //                   .center,
                                          //           children: [
                                          //             Image.asset(
                                          //               'images/upload.png',
                                          //               height: 70,
                                          //               color: kDarkBlueColor,
                                          //             ),
                                          //             const Text(
                                          //               'Click to upload Image or Video.',
                                          //               textAlign:
                                          //                   TextAlign.center,
                                          //               style: TextStyle(
                                          //                   color:
                                          //                       Colors.blue),
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ),
                                          //   ],
                                          // ),
                                          // const SizedBox(
                                          //   height: 15,
                                          // ),
                                          //location
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.0),
                                            child: Text(
                                              'Enter your current address.',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 25.0),
                                            child: TextFormField(
                                              maxLines: 3,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                              decoration: InputDecoration(
                                                // fillColor: Colors.blue[200]!
                                                //     .withOpacity(0.4),
                                                // filled: true,
                                                // hoverColor: kDarkBlue,
                                                // helperText: 'Add Text',
                                                hintStyle: const TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.grey,
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.location_on,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                labelText: 'Location',
                                                labelStyle: const TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.blue,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                // focusColor: kOrange,
                                              ),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          //budget
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.0),
                                            child: Text(
                                              'Enter job budget you want for the service.',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 25.0),
                                            child: TextFormField(
                                              maxLength: 10,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                              decoration: InputDecoration(
                                                // fillColor: Colors.blue[200]!
                                                //     .withOpacity(0.4),
                                                // filled: true,
                                                //hoverColor: kDarkBlue,
                                                // helperText: 'Add Text',
                                                hintStyle: const TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.grey,
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.money,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                labelText: 'Job Budget',
                                                labelStyle: const TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.blue,
                                                ),
                                                contentPadding: EdgeInsets.zero,
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                // focusColor: kOrange,
                                              ),
                                              keyboardType:
                                                  TextInputType.number,
                                              textInputAction:
                                                  TextInputAction.next,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          //Message
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 25.0),
                                            child: Text(
                                              'Write message for the provider. (Optional)',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 25.0),
                                            child: TextFormField(
                                              maxLines: 4,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  // fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                              decoration: InputDecoration(
                                                // fillColor: Colors.blue[200]!
                                                //     .withOpacity(0.4),
                                                // filled: true,
                                                //hoverColor: kDarkBlue,
                                                // helperText: 'Add Text',
                                                hintStyle: const TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.grey,
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.description,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                                labelText: 'Message',
                                                labelStyle: const TextStyle(
                                                  fontSize: 17.0,
                                                  color: Colors.blue,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                                ),
                                                // focusColor: kOrange,
                                              ),
                                              keyboardType: TextInputType.text,
                                              textInputAction:
                                                  TextInputAction.done,
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          //post A Job button
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0,
                                                horizontal: 25.0),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                height: size.height * 0.07,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  color: kLightBlue,
                                                ),
                                                child: FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Post A Job',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16.0),
                      ],
                    )
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
