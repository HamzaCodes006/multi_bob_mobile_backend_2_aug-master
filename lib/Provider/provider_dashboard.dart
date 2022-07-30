import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Chat/customer_main_chat_screen.dart';
import 'package:skilled_bob_app_web/Chat/provider_chat_main_screen.dart';
import 'package:skilled_bob_app_web/Customer/dashboard.dart';
import 'package:skilled_bob_app_web/Customer/index_page.dart';
import 'package:skilled_bob_app_web/Provider/customer_requests.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/Provider/post_service_screen.dart';
import 'package:skilled_bob_app_web/Provider/provider_jobs_screen.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/authentication/login_screen.dart';
import 'package:skilled_bob_app_web/authentication/register_screen.dart';

import '../Chat/provider_chat_screen.dart';
import '../Providers/chat_provider.dart';
import '../authentication/authentication_services.dart';
import '../constant.dart';
import 'job_requests.dart';

class ProviderDashboard extends StatefulWidget {
  static const String id = 'ProviderDashboard';
  const ProviderDashboard({Key? key}) : super(key: key);

  @override
  _ProviderDashboardState createState() => _ProviderDashboardState();
}

class _ProviderDashboardState extends State<ProviderDashboard> {
  bool convert = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.96),
        drawer: Drawer(
          child: Material(
            color: Colors.blueAccent,
            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  const SizedBox(
                    height: 40.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 90,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('images/car service.jpg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  BuildMenuItem(
                    icon: Icons.account_circle_outlined,
                    text: 'My Profile',
                    onPresed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ProviderProfileScreen()));
                    },
                  ),
                  BuildMenuItem(
                    icon: Icons.shopping_bag_rounded,
                    text: 'My Jobs',
                    onPresed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyServicesScreen()));
                    },
                  ),
                  BuildMenuItem(
                    icon: Icons.post_add,
                    text: 'Post My Service',
                    onPresed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PostServiceScreen()));
                    },
                  ),
                  BuildMenuItem(
                    icon: Icons.chat,
                    text: 'Chat',
                    onPresed: () {
                      // context
                      //     .read<ChatProvider>()
                      //     .setCustomerUidAndEmail(widget.providerId.toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CustomerMainChatScreen()));
                    },
                  ),
                  BuildMenuItem(
                    icon: Icons.request_page_outlined,
                    text: 'Job Requests',
                    onPresed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const JobRequests()));
                    },
                  ),
                  BuildMenuItem(
                    icon: Icons.language,
                    text: 'Languages',
                    onPresed: () {
                      //Navigator.pushNamed(context, MyFavorites.id);
                    },
                  ),
                  const SizedBox(height: 35),
                  const Divider(color: Colors.white, thickness: 1.4),
                  const SizedBox(
                    height: 35.0,
                  ),
                  BuildMenuItem(
                    icon: Icons.help,
                    text: 'Help',
                    onPresed: () {},
                  ),
                  BuildMenuItem(
                    icon: Icons.logout,
                    text: 'Log Out',
                    onPresed: () {
                      context.read<AuthenticationService>().signOut(context);
                      Navigator.pushReplacementNamed(context, LoginScreen.id);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const LoginScreen(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          shadowColor: Colors.transparent,
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              'Dashboard',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                child: Image.asset(
                  'images/user profile.png',
                  color: Colors.transparent,
                  height: 30,
                  width: 26,
                ),
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            fit: StackFit.loose,
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                            child: Text(
                          'Usama',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white),
                        )),
                        Center(
                            child: Padding(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: Text(
                            FirebaseAuth.instance.currentUser!.email.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: SwitchListTile(
                              title: const Text(
                                'Switch To Buyer',
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

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ProviderProfileScreen()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    //switch to customer
                                    // SizedBox(height: 10.0,),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                'images/user profile.png',
                                                color: Colors.blue,
                                                height: 25,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'My Profile',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        //my favorite
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const MyServicesScreen()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.shopping_bag,
                                                color: Colors.blue,
                                                size: 26,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'My Jobs',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        //my job
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PostServiceScreen()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.post_add,
                                                color: Colors.blue,
                                                size: 26,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'Post My Service',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        //chat
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             ProviderProfileScreen()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.chat,
                                                color: Colors.blue,
                                                size: 25,
                                              ),
                                              // Image.asset(
                                              //   'images/writing down.png',
                                              //   color: Colors.blue,
                                              //   height: 25,
                                              // ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'Chat',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        //job requests
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const JobRequests()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.request_page_outlined,
                                                color: Colors.blue,
                                                size: 25,
                                              ),
                                              // Image.asset(
                                              //   'images/writing down.png',
                                              //   color: Colors.blue,
                                              //   height: 25,
                                              // ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'Job Requests',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        //customer requests
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CustomerRequests()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.request_page_outlined,
                                                color: Colors.blue,
                                                size: 25,
                                              ),
                                              // Image.asset(
                                              //   'images/writing down.png',
                                              //   color: Colors.blue,
                                              //   height: 25,
                                              // ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'Customer Requests',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        // logout
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10.0, right: 20, left: 20),
                          child: InkWell(
                            onTap: () {
                              context
                                  .read<AuthenticationService>()
                                  .signOut(context);
                              Navigator.pushReplacementNamed(
                                  context, LoginScreen.id);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const RegisterScreen()));
                            },
                            child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                                //height: 300,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.logout,
                                                color: Colors.blue,
                                                size: 26,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              Container(
                                                color: Colors.black45,
                                                height: 26,
                                                width: 1.5,
                                              ),
                                              const SizedBox(
                                                width: 15,
                                              ),
                                              const Text(
                                                'LogOut',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_ios,
                                            size: 17,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3),
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    child: Image.asset(
                      'images/car service.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
