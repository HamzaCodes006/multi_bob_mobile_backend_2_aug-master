import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Providers/menu_controller.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../Customer/dashboard.dart';
import '../Provider/provider_profile_screen.dart';
import '../constant.dart';

class MyFavoritesDesktop extends StatefulWidget {
  const MyFavoritesDesktop({Key? key}) : super(key: key);

  @override
  _MyFavoritesDesktopState createState() => _MyFavoritesDesktopState();
}

class _MyFavoritesDesktopState extends State<MyFavoritesDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool convert = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(
        selected: 2,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: SideMenu(
                  selected: 2,
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
                              // context.read<MenuController>().controlMenu();
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        Text(
                          "My Favorites",
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
                        // Container(
                        //   margin: const EdgeInsets.only(left: 16),
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 16,
                        //     vertical: 16 / 2,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     //color: const Color(0xFF2A2D3E),
                        //     borderRadius:
                        //         const BorderRadius.all(Radius.circular(10)),
                        //     border: Border.all(color: Colors.white10),
                        //   ),
                        //   child: Row(
                        //     children: [
                        //       if (!Responsive.isMobile(context))
                        //         const Padding(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 16 / 2),
                        //           child: Text(
                        //             "Switch To Provider",
                        //             style: TextStyle(
                        //               color: CupertinoColors.black,
                        //             ),
                        //           ),
                        //         ),
                        //       //Icon(Icons.keyboard_arrow_down),
                        //       Switch.adaptive(
                        //         value: false,
                        //         inactiveThumbColor: Colors.blue,
                        //         inactiveTrackColor: Colors.black45,
                        //         onChanged: (value) {},
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Column(
                            children: [
                              const SizedBox(height: 16.0),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0,
                                    vertical: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(RouteName.myServiceDetailRoute);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ],
                                            border: Border.all(
                                                color: Colors.black87
                                                    .withOpacity(0.05)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(children: [
                                                Hero(
                                                  tag: '',
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      'images/painting.jpg',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                //
                                              ]),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 6,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        const Expanded(
                                                            child: Text(
                                                                'Car Service',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    height: 1.3,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        IconButton(
                                                            onPressed: () {
                                                              // setState(() {
                                                              //   _isFavorited =
                                                              //   !_isFavorited;
                                                              // });
                                                            },
                                                            icon:
                                                                // _isFavorited
                                                                //     ?
                                                                const Icon(Icons
                                                                    .favorite)
                                                            // : const Icon(Icons
                                                            // .favorite_border)
                                                            )

                                                        // BookingOptionsPopupMenuWidget()
                                                      ],
                                                    ),
                                                    // const Divider(
                                                    //   height: 3,
                                                    //   thickness: 0.5,
                                                    // ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              spacing: 5,
                                                              children: [
                                                                SizedBox(
                                                                    height: 30,
                                                                    child: Chip(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                0),
                                                                        label: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .center,
                                                                            children: const <
                                                                                Widget>[
                                                                              Icon(Icons.star, color: kLightBlue, size: 16),
                                                                              Text('3.45', style: TextStyle(color: kLightBlue, height: 1.3))
                                                                            ]),
                                                                        backgroundColor:
                                                                            kLightBlue.withOpacity(
                                                                                0.15),
                                                                        shape:
                                                                            const StadiumBorder())),
                                                                const Text(
                                                                    '(44)',
                                                                    style: TextStyle(
                                                                        color:
                                                                            kLightBlue,
                                                                        height:
                                                                            1.3))
                                                              ]),
                                                        ]),
                                                    const Divider(
                                                        height: 3,
                                                        thickness: 0.5),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text('Description',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                              'We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority.',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .grey))
                                                        ]),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(RouteName.myServiceDetailRoute);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ],
                                            border: Border.all(
                                                color: Colors.black87
                                                    .withOpacity(0.05)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(children: [
                                                Hero(
                                                  tag: '',
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      'images/painting.jpg',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                //
                                              ]),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 6,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        const Expanded(
                                                            child: Text(
                                                                'Car Service',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    height: 1.3,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        IconButton(
                                                            onPressed: () {
                                                              // setState(() {
                                                              //   _isFavorited =
                                                              //   !_isFavorited;
                                                              // });
                                                            },
                                                            icon:
                                                                // _isFavorited
                                                                //     ?
                                                                const Icon(Icons
                                                                    .favorite)
                                                            // : const Icon(Icons
                                                            // .favorite_border)
                                                            )

                                                        // BookingOptionsPopupMenuWidget()
                                                      ],
                                                    ),
                                                    // const Divider(
                                                    //   height: 3,
                                                    //   thickness: 0.5,
                                                    // ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              spacing: 5,
                                                              children: [
                                                                SizedBox(
                                                                    height: 30,
                                                                    child: Chip(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                0),
                                                                        label: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .center,
                                                                            children: const <
                                                                                Widget>[
                                                                              Icon(Icons.star, color: kLightBlue, size: 16),
                                                                              Text('3.45', style: TextStyle(color: kLightBlue, height: 1.3))
                                                                            ]),
                                                                        backgroundColor:
                                                                            kLightBlue.withOpacity(
                                                                                0.15),
                                                                        shape:
                                                                            const StadiumBorder())),
                                                                const Text(
                                                                    '(44)',
                                                                    style: TextStyle(
                                                                        color:
                                                                            kLightBlue,
                                                                        height:
                                                                            1.3))
                                                              ]),
                                                        ]),
                                                    const Divider(
                                                        height: 3,
                                                        thickness: 0.5),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text('Description',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                              'We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority.',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .grey))
                                                        ]),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(RouteName.myServiceDetailRoute);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ],
                                            border: Border.all(
                                                color: Colors.black87
                                                    .withOpacity(0.05)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(children: [
                                                Hero(
                                                  tag: '',
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      'images/painting.jpg',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                //
                                              ]),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 6,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        const Expanded(
                                                            child: Text(
                                                                'Car Service',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    height: 1.3,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        IconButton(
                                                            onPressed: () {
                                                              // setState(() {
                                                              //   _isFavorited =
                                                              //   !_isFavorited;
                                                              // });
                                                            },
                                                            icon:
                                                                // _isFavorited
                                                                //     ?
                                                                const Icon(Icons
                                                                    .favorite)
                                                            // : const Icon(Icons
                                                            // .favorite_border)
                                                            )

                                                        // BookingOptionsPopupMenuWidget()
                                                      ],
                                                    ),
                                                    // const Divider(
                                                    //   height: 3,
                                                    //   thickness: 0.5,
                                                    // ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              spacing: 5,
                                                              children: [
                                                                SizedBox(
                                                                    height: 30,
                                                                    child: Chip(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                0),
                                                                        label: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .center,
                                                                            children: const <
                                                                                Widget>[
                                                                              Icon(Icons.star, color: kLightBlue, size: 16),
                                                                              Text('3.45', style: TextStyle(color: kLightBlue, height: 1.3))
                                                                            ]),
                                                                        backgroundColor:
                                                                            kLightBlue.withOpacity(
                                                                                0.15),
                                                                        shape:
                                                                            const StadiumBorder())),
                                                                const Text(
                                                                    '(44)',
                                                                    style: TextStyle(
                                                                        color:
                                                                            kLightBlue,
                                                                        height:
                                                                            1.3))
                                                              ]),
                                                        ]),
                                                    const Divider(
                                                        height: 3,
                                                        thickness: 0.5),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text('Description',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                              'We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority.',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .grey))
                                                        ]),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(RouteName.myServiceDetailRoute);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ],
                                            border: Border.all(
                                                color: Colors.black87
                                                    .withOpacity(0.05)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(children: [
                                                Hero(
                                                  tag: '',
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      'images/painting.jpg',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                //
                                              ]),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 6,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        const Expanded(
                                                            child: Text(
                                                                'Car Service',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    height: 1.3,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        IconButton(
                                                            onPressed: () {
                                                              // setState(() {
                                                              //   _isFavorited =
                                                              //   !_isFavorited;
                                                              // });
                                                            },
                                                            icon:
                                                                // _isFavorited
                                                                //     ?
                                                                const Icon(Icons
                                                                    .favorite)
                                                            // : const Icon(Icons
                                                            // .favorite_border)
                                                            )

                                                        // BookingOptionsPopupMenuWidget()
                                                      ],
                                                    ),
                                                    // const Divider(
                                                    //   height: 3,
                                                    //   thickness: 0.5,
                                                    // ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              spacing: 5,
                                                              children: [
                                                                SizedBox(
                                                                    height: 30,
                                                                    child: Chip(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                0),
                                                                        label: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .center,
                                                                            children: const <
                                                                                Widget>[
                                                                              Icon(Icons.star, color: kLightBlue, size: 16),
                                                                              Text('3.45', style: TextStyle(color: kLightBlue, height: 1.3))
                                                                            ]),
                                                                        backgroundColor:
                                                                            kLightBlue.withOpacity(
                                                                                0.15),
                                                                        shape:
                                                                            const StadiumBorder())),
                                                                const Text(
                                                                    '(44)',
                                                                    style: TextStyle(
                                                                        color:
                                                                            kLightBlue,
                                                                        height:
                                                                            1.3))
                                                              ]),
                                                        ]),
                                                    const Divider(
                                                        height: 3,
                                                        thickness: 0.5),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text('Description',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                              'We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority.',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .grey))
                                                        ]),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Get.toNamed(RouteName.myServiceDetailRoute);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black87
                                                      .withOpacity(0.1),
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 5))
                                            ],
                                            border: Border.all(
                                                color: Colors.black87
                                                    .withOpacity(0.05)),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(children: [
                                                Hero(
                                                  tag: '',
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.asset(
                                                      'images/painting.jpg',
                                                      height: 150,
                                                      width: 150,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                                //
                                              ]),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                child: Wrap(
                                                  runSpacing: 6,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  children: <Widget>[
                                                    Row(
                                                      children: [
                                                        const Expanded(
                                                            child: Text(
                                                                'Car Service',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    height: 1.3,
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold))),
                                                        IconButton(
                                                            onPressed: () {
                                                              // setState(() {
                                                              //   _isFavorited =
                                                              //   !_isFavorited;
                                                              // });
                                                            },
                                                            icon:
                                                                // _isFavorited
                                                                //     ?
                                                                const Icon(Icons
                                                                    .favorite)
                                                            // : const Icon(Icons
                                                            // .favorite_border)
                                                            )

                                                        // BookingOptionsPopupMenuWidget()
                                                      ],
                                                    ),
                                                    // const Divider(
                                                    //   height: 3,
                                                    //   thickness: 0.5,
                                                    // ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Wrap(
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .center,
                                                              spacing: 5,
                                                              children: [
                                                                SizedBox(
                                                                    height: 30,
                                                                    child: Chip(
                                                                        padding:
                                                                            const EdgeInsets.all(
                                                                                0),
                                                                        label: Row(
                                                                            mainAxisAlignment: MainAxisAlignment
                                                                                .center,
                                                                            children: const <
                                                                                Widget>[
                                                                              Icon(Icons.star, color: kLightBlue, size: 16),
                                                                              Text('3.45', style: TextStyle(color: kLightBlue, height: 1.3))
                                                                            ]),
                                                                        backgroundColor:
                                                                            kLightBlue.withOpacity(
                                                                                0.15),
                                                                        shape:
                                                                            const StadiumBorder())),
                                                                const Text(
                                                                    '(44)',
                                                                    style: TextStyle(
                                                                        color:
                                                                            kLightBlue,
                                                                        height:
                                                                            1.3))
                                                              ]),
                                                        ]),
                                                    const Divider(
                                                        height: 3,
                                                        thickness: 0.5),
                                                    Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: const [
                                                          Text('Description',
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      17.0,
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                              'We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority. We are providing high quality services to our customers. You are our first priority.',
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .grey))
                                                        ]),
                                                  ],
                                                ),
                                              )
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
                        SizedBox(width: 16.0),
                        // if (!Responsive.isMobile(context))
                        // Expanded(
                        //   flex: 2,
                        //   child: StarageDetails(),
                        // ),
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
