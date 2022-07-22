import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/Customer/job_detail_page.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import '../constant.dart';

class ProviderJobScreenDesktop extends StatefulWidget {
  const ProviderJobScreenDesktop({Key? key}) : super(key: key);

  @override
  _ProviderJobScreenDesktopState createState() =>
      _ProviderJobScreenDesktopState();
}

class _ProviderJobScreenDesktopState extends State<ProviderJobScreenDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool convert = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ProviderSideMenu(
        selected: 2,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
// flex: 1, (default)
                child: ProviderSideMenu(
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
                              _scaffoldKey.currentState!.openDrawer();
//context.read<MenuController>().controlMenu();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        Text(
                          "My Jobs",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
//Expanded(child: SearchField()),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SwitchListTile(
                                title: const Text(
                                  'Provider Mode',
                                  style: kBodyTextBlack,
                                ),
                                subtitle: const Text(
                                  'Turn switch off  to go to Customer Mode.',
                                  style: kBodyTextGrey,
                                ),
                                activeColor: kLightBlue,
                                value: convert,
                                onChanged: (selected) {
                                  setState(() {
                                    convert = !convert;
                                    Navigator.pushReplacementNamed(
                                        context, Dashboard.id);
                                  });
                                }),
                          ),
                        ),
//                           Container(
//                             margin: const EdgeInsets.only(left: 16),
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 16 / 2,
//                             ),
//                             decoration: BoxDecoration(
// //color: const Color(0xFF2A2D3E),
//                               borderRadius:
//                                   const BorderRadius.all(Radius.circular(10)),
//                               border: Border.all(color: Colors.white10),
//                             ),
//                             child: Row(
//                               children: [
//                                 if (!Responsive.isMobile(context))
//                                   const Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 16 / 2),
//                                     child: Text(
//                                       "Switch To Provider",
//                                       style: TextStyle(
//                                         color: CupertinoColors.black,
//                                       ),
//                                     ),
//                                   ),
// //Icon(Icons.keyboard_arrow_down),
//                                 Switch.adaptive(
//                                   value: true,
//                                   inactiveThumbColor: Colors.blue,
//                                   inactiveTrackColor: Colors.black45,
//                                   onChanged: (value) {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const Dashboard()));
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 5,
                          child: CustomScrollView(
                            shrinkWrap: true,
                            slivers: [
                              SliverToBoxAdapter(
                                child: Wrap(
                                  children: [
                                    ListView.builder(
                                        padding: const EdgeInsets.only(
                                            bottom: 10, top: 10),
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: 6,
                                        itemBuilder: ((_, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              // Get.toNamed(RouteName.myServiceDetailRoute);
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return const JobDetail();
                                              }));
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
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
                                                      offset:
                                                          const Offset(0, 5))
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
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Image.asset(
                                                          'images/painting.jpg',
                                                          height: 80,
                                                          width: 80,
                                                          fit: BoxFit.cover,
                                                          //   errorWidget: (context, url,
                                                          //           error) =>
                                                          //       const Icon(Icons.error_outline),
                                                          // ),
                                                        ),
                                                      ),
                                                    ),

                                                    //
                                                  ]),
                                                  const SizedBox(width: 12),
                                                  Expanded(
                                                    child: Wrap(
                                                      runSpacing: 10,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      children: <Widget>[
                                                        Row(children: const [
                                                          Expanded(
                                                              child: Text(
                                                                  'Painting Service',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black87,
                                                                      height:
                                                                          1.4,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold))),
                                                          // BookingOptionsPopupMenuWidget()
                                                        ]),
                                                        const Divider(
                                                          height: 6,
                                                          thickness: 0.5,
                                                        ),
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
                                                                        height:
                                                                            32,
                                                                        child: Chip(
                                                                            padding: const EdgeInsets.all(0),
                                                                            label: Row(mainAxisAlignment: MainAxisAlignment.center, children: const <Widget>[
                                                                              Icon(Icons.star, color: kLightBlue, size: 16),
                                                                              Text('3.45', style: TextStyle(color: kLightBlue, height: 1.4))
                                                                            ]),
                                                                            backgroundColor: kLightBlue.withOpacity(0.15),
                                                                            shape: const StadiumBorder())),
                                                                    const Text(
                                                                        '(44)',
                                                                        style: TextStyle(
                                                                            color:
                                                                                kLightBlue,
                                                                            height:
                                                                                1.4))
                                                                  ]),
                                                              const Text(
                                                                '30 km',
                                                                style: TextStyle(
                                                                    color:
                                                                        kLightBlue,
                                                                    height:
                                                                        1.4),
                                                              ),
                                                            ]),
                                                        const Divider(
                                                            height: 6,
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
                                                                'We are providing high quality services to our customers. You are our first priority',
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    color: Colors
                                                                        .grey))
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
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
