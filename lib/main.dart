import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:skilled_bob_app_web/Customer/category.dart';
import 'package:skilled_bob_app_web/Customer/customer_construction_service_screen.dart';
import 'package:skilled_bob_app_web/Customer/customer_it_service_screen.dart';
import 'package:skilled_bob_app_web/Customer/customer_vehicle_services_screen.dart';
import 'package:skilled_bob_app_web/Customer/post_a_request_customer.dart';
import 'package:skilled_bob_app_web/Customer/request_page.dart';
import 'package:skilled_bob_app_web/Provider/job_requests.dart';
import 'package:skilled_bob_app_web/Provider/post_service_screen.dart';
import 'package:skilled_bob_app_web/Provider/provider_jobs_screen.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/Provider/my_services_screen.dart';
import 'package:skilled_bob_app_web/Providers/auth_provider.dart';
import 'package:skilled_bob_app_web/Providers/chat_provider.dart';
import 'package:skilled_bob_app_web/Providers/custom_snackbars.dart';
import 'package:skilled_bob_app_web/Providers/location_provider.dart';
import 'package:skilled_bob_app_web/Providers/my_favourite_provider.dart';
import 'package:skilled_bob_app_web/Providers/profile_data.dart';
import 'package:skilled_bob_app_web/Providers/service_provider.dart';
import 'package:skilled_bob_app_web/authentication/authentication_check.dart';
import 'package:skilled_bob_app_web/authentication/register_screen.dart';
import 'package:skilled_bob_app_web/isMobile/Dashboard_mobile.dart';
import 'package:skilled_bob_app_web/something_went_wrong.dart';
import 'Customer/CustomAnimation.dart';
import 'Customer/dashboard.dart';
import 'Customer/index_page.dart';
import 'Customer/job_detail_page.dart';
import 'Customer/my_bookings.dart';
import 'Customer/my_favorites.dart';
import 'Customer/profile.dart';
import 'Provider/provider_dashboard.dart';
import 'authentication/authentication_services.dart';
import 'authentication/login_screen.dart';
import 'firebase_options.dart';
import 'isMobile/Post_Service_Screen_Mobile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    FacebookAuth.i.webInitialize(
      appId: "722342258860819", // Replace with your app id
      cookie: true,
      xfbml: true,
      version: "v12.0",
    );
  }
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ServiceProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => CustomSnackBars(),
      ),
      ChangeNotifierProvider(
        create: (_) => LocationProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ChatProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => MyFavouriteProvider(),
      ),
      Provider<ProfileData>(
        create: (_) => ProfileData(),
        child: const DashboardMobile(),
      ),
      StreamProvider<Map<String, dynamic>?>(
        create: (_) => ProfileData().setDashboardData(),
        initialData: null,
        // child: const DashboardMobile(),
      ),
      Provider<AuthenticationService>(
        create: (_) => AuthenticationService(FirebaseAuth.instance),
      ),
      StreamProvider(
        create: (context) =>
            context.read<AuthenticationService>().authStateChanges,
        initialData: null,
      ),
    ],
    child: const MyApp(),
  ));
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.blue
    ..backgroundColor = Colors.blue
    ..indicatorColor = Colors.blue
    ..textColor = Colors.blue
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AuthenticationCheck.id,
      routes: {
        AuthenticationCheck.id: (context) => AuthenticationCheck(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        IndexPage.id: (context) => const IndexPage(),
        MyServicesScreen.id: (context) => const MyServicesScreen(),
        ProviderProfileScreen.id: (context) => const ProviderProfileScreen(),
        PostServiceScreen.id: (context) => const PostServiceScreen(),
        ProviderJobsScreen.id: (context) => const ProviderJobsScreen(),
        Categories.id: (context) => const Categories(),
        // Request.id: (context) => const Request(),
        JobRequests.id: (context) => const JobRequests(),
        MyFavorites.id: (context) => const MyFavorites(),
        Dashboard.id: (context) => const Dashboard(),
        PostARequestCustomer.id: (context) => const PostARequestCustomer(),
        ProviderDashboard.id: (context) => const ProviderDashboard(),
        JobDetail.id: (context) => const JobDetail(),
        MyBookings.id: (context) => const MyBookings(),
        Profile.id: (context) => Profile(),
        // PostServiceScreen.id: (context) =>
        //     const PostServiceScreen(),
        CustomerVehicleServicesScreen.id: (context) =>
            const CustomerVehicleServicesScreen(
                serviceName: 'Cars & Motorbike Service'),
        CustomerConstructionServicesScreen.id: (context) =>
            const CustomerConstructionServicesScreen(
              serviceName: 'Construction & Painting',
            ),
        CustomerITServicesScreen.id: (context) =>
            const CustomerITServicesScreen(
              serviceName: 'Web, Computer & IT Service',
            ),
        SomethingWentWrong.id: (context) => const SomethingWentWrong(),
      },
      builder: EasyLoading.init(),
    );
  }
}
