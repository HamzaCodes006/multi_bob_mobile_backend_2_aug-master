import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class MyFavouriteProvider extends ChangeNotifier{

  ///// add myFavourites Data ///////
  addMyFavListData({
    String? myFavouriteId,
    String? myFavouriteTitle,
    String? myFavouriteRating,
    var myFavouritePrice,
    List? myFavouriteImages,
    String? myFavouriteDescription,
  }) {
    FirebaseFirestore.instance
        .collection("Favourite")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyFavourite")
        .doc(myFavouriteId)
        .set({
      "myFavouriteId": myFavouriteId,
      "myFavouriteTitle": myFavouriteTitle,
      "myFavouriteImage": myFavouriteImages,
      "myFavouritePrice": myFavouritePrice,
      "myFavouriteDescription": myFavouriteDescription,
      "myFavouriteRating": myFavouriteRating,
      "myFavourite": true,
    }).then((value) {
      print('MY FAVOURITE ADDED SUCCESSFULLY!');
    });
  }


////////// Delete MyFavourite Data /////
  deleteMyFavData(String myFavouriteId){
    FirebaseFirestore.instance
        .collection("Favourite")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("MyFavourite")
        .doc(myFavouriteId).delete();
  }

}