import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/isDesktop/My_Favorite_Desktop.dart';
import 'package:skilled_bob_app_web/isMobile/My_Favorites_Mobile.dart';
import 'package:skilled_bob_app_web/responsive.dart';

class MyFavorites extends StatefulWidget {
  static const String id = 'MyFavorites';
  const MyFavorites({Key? key}) : super(key: key);

  @override
  _MyFavoritesState createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool convert = false;
  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MyFavoritesMobile(),
      isDesktopMobile: MyFavoritesMobile(),
      desktop: MyFavoritesDesktop(),
    );
  }
}
