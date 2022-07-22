import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Customer/dashboard.dart';
import '../Provider/provider_profile_screen.dart';
import '../Providers/menu_controller.dart';
import '../constant.dart';
import '../responsive.dart';

class DashboardDesktop extends StatefulWidget {
  @override
  State<DashboardDesktop> createState() => _DashboardDesktopState();
}

class _DashboardDesktopState extends State<DashboardDesktop> {
  bool convert = false;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer: const SideMenu(
        selected: 1,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                // flex: 1, (default)
                child: SideMenu(
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
                              // context.read<MenuController>().controlMenu();
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        Text(
                          "Dashboard",
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
                          child: Column(
                            children: [
                              const SizedBox(height: 16.0),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'User Avatar:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Center(
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            //border: Border.all(color: Colors.blue, width: 3),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.blue,
                                          ),
                                          width: 180,
                                          height: 140,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            child: Image.asset(
                                              'images/car service.jpg',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      //heading
                                      const Text(
                                        'About Me:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      //username textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Username',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons
                                                            .account_circle_outlined,
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
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    const SizedBox(
                                                      width: 200,
                                                      child: TextField(
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Username',
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
                                      //first name textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'First Name',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons
                                                            .account_circle_outlined,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'First Name',
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
                                      //last name textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Last Name',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons
                                                            .account_circle_outlined,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Last Name',
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
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      //heading
                                      const Text(
                                        'Contact Detail:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      //mobile number textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Mobile Number',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.phone_android,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Mobile Number',
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
                                      //telephone number textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Telephone Number',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.phone,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Telephone Number',
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
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Email',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.email_outlined,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Email',
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
                                      const SizedBox(
                                        height: 18,
                                      ),
                                      //heading
                                      const Text(
                                        'Address Detail:',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      //ADDRESS textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Address',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.location_on,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Address',
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
                                      //Apt/Suite # textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Apt/Suite #',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.location_on,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText:
                                                              'Apt/Suite #',
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
                                      //cITY textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'City',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.location_on,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'City',
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
                                      //STATE number textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'State',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.location_on,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'State',
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
                                      //COUNTRY textfield
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 2.0, bottom: 2),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 18.0, top: 13),
                                                child: Text(
                                                  'Country',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Row(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 15.0),
                                                      child: Icon(
                                                        Icons.location_on,
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
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          hintText: 'Country',
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
