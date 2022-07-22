import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/constant.dart';
import '../Provider/provider_profile_screen.dart';
import '../responsive.dart';

class ProviderProfileScreenDesktop extends StatefulWidget {
  const ProviderProfileScreenDesktop({Key? key}) : super(key: key);

  @override
  _ProviderProfileScreenDesktopState createState() =>
      _ProviderProfileScreenDesktopState();
}

class _ProviderProfileScreenDesktopState
    extends State<ProviderProfileScreenDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isFavorited = false;
  bool convert = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: ProviderSideMenu(
        selected: 1,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                // flex: 1, (default)
                child: ProviderSideMenu(
                  selected: 1,
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
                          "Profile",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
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
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          //flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  image: const DecorationImage(
                                                      image: AssetImage(
                                                          'images/img.jpg'),
                                                      fit: BoxFit.cover)),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Robert Anderson',
                                                style: kHeadTextBlack,
                                              ),
                                              const Text(
                                                'robert@gmail.com',
                                                style: kBodyTextGrey,
                                              ),
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Wrap(
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                spacing: 4,
                                                children: [
                                                  SizedBox(
                                                    height: 32,
                                                    child: Chip(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                      label: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const <
                                                            Widget>[
                                                          Icon(Icons.star,
                                                              color: kLightBlue,
                                                              size: 14),
                                                          Text(
                                                            '3.5',
                                                            style: TextStyle(
                                                                color:
                                                                    kLightBlue,
                                                                height: 1.4,
                                                                fontSize: 15),
                                                          )
                                                        ],
                                                      ),
                                                      backgroundColor:
                                                          kLightBlue
                                                              .withOpacity(
                                                                  0.15),
                                                    ),
                                                  ),
                                                  const Text('(44)',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.blueAccent,
                                                          height: 1.4))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        height: 14,
                                        color: Colors.grey,
                                        thickness: 1,
                                        indent: 30,
                                        endIndent: 30,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Description',
                                          style: kHeadTextBlack,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          'This is Robert, a professional Flutter (Android & IOS) App Developer. We are a team of Professional Developers and have great experience in Mobile app development and Web development. We have done multiple projects of Android and IOS apps for our clients. Our Main Goal is to help our clients by providing a satisfactory services to fulfill his/her dream ideas and to grow your business.',
                                          style: kBodyTextGrey,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Skill Work',
                                          style: kHeadTextBlack,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          'Professional Painter',
                                          style: kBodyTextGrey,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Location',
                                          style: kHeadTextBlack,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Text(
                                          'SANRIO SURPRISES ARDEN, 1689 ARDEN WAY, SACRAMENTO CA',
                                          style: kBodyTextGrey,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: 1000,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Rating',
                                              style: kBodyText.copyWith(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text('4.5',
                                                  style: kHeadTextBlack),
                                            ),
                                            Wrap(
                                                children: getStarsList(4.5,
                                                    size: 32)),
                                          ],
                                        ),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Expanded(
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                    onTap: () {},
                                                    child: Container(
                                                      width: size.width,
                                                      height:
                                                          size.height * 0.23,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      margin: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 10),
                                                      decoration: BoxDecoration(
                                                        color: Colors.white54,
                                                        borderRadius:
                                                            const BorderRadius
                                                                    .all(
                                                                Radius.circular(
                                                                    10)),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors
                                                                  .black87
                                                                  .withOpacity(
                                                                      0.2),
                                                              blurRadius: 1,
                                                              offset:
                                                                  const Offset(
                                                                      0, 5))
                                                        ],
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.05)),
                                                      ),
                                                      child: Wrap(
                                                        runSpacing: 20,
                                                        children: <Widget>[
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Column(
                                                                children: [
                                                                  ClipRRect(
                                                                    borderRadius: const BorderRadius
                                                                            .all(
                                                                        Radius.circular(
                                                                            10)),
                                                                    child: Image
                                                                        .asset(
                                                                      'images/painting.jpg',
                                                                      height:
                                                                          80,
                                                                      width: 80,
                                                                      fit: BoxFit
                                                                          .cover,
//   errorWidget: (context, url,
//           error) =>
//       const Icon(Icons.error_outline),
// ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding:
                                                                        const EdgeInsets.all(
                                                                            8.0),
                                                                    child: SizedBox(
                                                                        height: 32,
                                                                        child: Chip(
                                                                            padding: const EdgeInsets.all(0),
                                                                            label: Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: <Widget>[
                                                                                Text('2.41', style: kBodyText.copyWith(color: Colors.white)),
                                                                                const Icon(Icons.star_border, color: Colors.white, size: 16)
                                                                              ],
                                                                            ),
                                                                            backgroundColor: kLightBlue.withOpacity(0.9),
                                                                            shape: const StadiumBorder())),
                                                                  )
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  width:
                                                                      size.width *
                                                                          0.02),
                                                              Expanded(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                        'Peter',
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style:
                                                                            kBodyText),
                                                                    Text(
                                                                        'Hamza is such a great and experienced Man. He took all my suggestions and gave me an output that is beyond to my thinking, I am highly Impressed by his work and thoughts, He is a flutter Expert, ',
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        softWrap:
                                                                            true,
                                                                        maxLines:
                                                                            5,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Theme.of(context).hintColor)),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                                itemCount: 10,
                                                primary: false,
                                                shrinkWrap: true,
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
                        const SizedBox(width: 16.0)
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
