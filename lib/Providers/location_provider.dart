import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'custom_snackbars.dart';

class LocationProvider extends ChangeNotifier {
  String pickerError = '';
  bool isPicAvail = false;
  double? serviceLatitude;
  double? serviceLongitude;
  String? serviceAddress;
  String? street;
  String? countryName;
  String? locality;
  String? subLocality;
  String? adminArea;
  String? postalCode;
  String? email;
  String? error;
  Position? currentUserPosition;
  double? distanceImMeter = 0.0;

  Future<Position> getCurrentAddress() async {
    // Location location = Location();
    //
    // bool _serviceEnabled;
    // PermissionStatus _permissionGranted;
    // LocationData _locationData;
    //
    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return;
    //   }
    // }
    //
    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != PermissionStatus.granted) {
    //     return;
    //   }
    // }

    // _locationData = await location.getLocation();
    // verticalAccuracy= _locationData.verticalAccuracy;
    // speed=_locationData.speed;
    // time=_locationData.time;
    // serviceLatitude = _locationData.latitude;
    // serviceLongitude = _locationData.longitude;

    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    serviceLatitude = position.latitude;
    serviceLongitude = position.longitude;
    notifyListeners();

    // From coordinates
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);
    Placemark place = placemarks[0];
    serviceAddress =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    subLocality = place.subLocality;
    locality = place.locality;
    adminArea = place.administrativeArea;
    countryName = place.country;
    print(countryName);
    notifyListeners();
    return position;
  }

  List distanceOfAllService = [];

  Future getDistance() async {
    List newDistanceOfAllService = [];
    print('1111111111111111');
    currentUserPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print('222222222222222222222222222');
    final snapShot =
        FirebaseFirestore.instance.collection('Services').snapshots();
    print('333333333333333333333333333');
    snapShot.forEach((element) {
      print('444444444444444444444');
      for (var ele in element.docs) {
        double? serviceLat = double.parse(ele.get('serviceLatitude'));
        double? serviceLng = double.parse(ele.get('serviceLongitude'));
        print('........------>>>>>>>>>>$serviceLat,$serviceLng');
        distanceImMeter = Geolocator.distanceBetween(
            currentUserPosition!.latitude,
            currentUserPosition!.longitude,
            serviceLat,
            serviceLng);
        var distance = distanceImMeter?.round().toInt();
        newDistanceOfAllService.add((distance! / 100));
        print(
            '----------->>>>>>distanceOfAllService: $newDistanceOfAllService km,,,');
      }
    }).whenComplete(() {
      distanceOfAllService = newDistanceOfAllService;
      print(
          '+++++++++++================Final distanceOfAllService: $distanceOfAllService km,');
      notifyListeners();
    });
  }

  List<dynamic> get getDistanceOfAllServices {
    return distanceOfAllService;
  }
}
