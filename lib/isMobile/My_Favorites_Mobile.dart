import 'package:flutter/material.dart';
import '../constant.dart';

class MyFavoritesMobile extends StatefulWidget {
  const MyFavoritesMobile({Key? key}) : super(key: key);

  @override
  _MyFavoritesMobileState createState() => _MyFavoritesMobileState();
}

class _MyFavoritesMobileState extends State<MyFavoritesMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            color: Colors.blueAccent,
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: kDarkBlueColor,
              size: 26,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'My Favorites',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kDarkBlueColor,
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          titleSpacing: 0,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.myServiceDetailRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ],
                      border:
                          Border.all(color: Colors.black87.withOpacity(0.05)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Hero(
                            tag: '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'images/painting.jpg',
                                height: 100,
                                width: 100,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 6,
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text('Car Service',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              height: 1.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))),
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
                                          const Icon(Icons.favorite)
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 5,
                                        children: [
                                          SizedBox(
                                              height: 30,
                                              child: Chip(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  label: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Icon(Icons.star,
                                                            color: kLightBlue,
                                                            size: 16),
                                                        Text('3.45',
                                                            style: TextStyle(
                                                                color:
                                                                    kLightBlue,
                                                                height: 1.3))
                                                      ]),
                                                  backgroundColor: kLightBlue
                                                      .withOpacity(0.15),
                                                  shape:
                                                      const StadiumBorder())),
                                          const Text('(44)',
                                              style: TextStyle(
                                                  color: kLightBlue,
                                                  height: 1.3))
                                        ]),
                                  ]),
                              const Divider(height: 3, thickness: 0.5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Description',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black87)),
                                    Text(
                                        'We are providing high quality services to our customers. You are our first priority',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey))
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.myServiceDetailRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ],
                      border:
                          Border.all(color: Colors.black87.withOpacity(0.05)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Hero(
                            tag: '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'images/painting.jpg',
                                height: 100,
                                width: 100,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 6,
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text('Car Service',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              height: 1.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))),
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
                                          const Icon(Icons.favorite)
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 5,
                                        children: [
                                          SizedBox(
                                              height: 30,
                                              child: Chip(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  label: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Icon(Icons.star,
                                                            color: kLightBlue,
                                                            size: 16),
                                                        Text('3.45',
                                                            style: TextStyle(
                                                                color:
                                                                    kLightBlue,
                                                                height: 1.3))
                                                      ]),
                                                  backgroundColor: kLightBlue
                                                      .withOpacity(0.15),
                                                  shape:
                                                      const StadiumBorder())),
                                          const Text('(44)',
                                              style: TextStyle(
                                                  color: kLightBlue,
                                                  height: 1.3))
                                        ]),
                                  ]),
                              const Divider(height: 3, thickness: 0.5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Description',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black87)),
                                    Text(
                                        'We are providing high quality services to our customers. You are our first priority',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey))
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.myServiceDetailRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ],
                      border:
                          Border.all(color: Colors.black87.withOpacity(0.05)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Hero(
                            tag: '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'images/painting.jpg',
                                height: 100,
                                width: 100,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 6,
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text('Car Service',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              height: 1.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))),
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
                                          const Icon(Icons.favorite)
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 5,
                                        children: [
                                          SizedBox(
                                              height: 30,
                                              child: Chip(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  label: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Icon(Icons.star,
                                                            color: kLightBlue,
                                                            size: 16),
                                                        Text('3.45',
                                                            style: TextStyle(
                                                                color:
                                                                    kLightBlue,
                                                                height: 1.3))
                                                      ]),
                                                  backgroundColor: kLightBlue
                                                      .withOpacity(0.15),
                                                  shape:
                                                      const StadiumBorder())),
                                          const Text('(44)',
                                              style: TextStyle(
                                                  color: kLightBlue,
                                                  height: 1.3))
                                        ]),
                                  ]),
                              const Divider(height: 3, thickness: 0.5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Description',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black87)),
                                    Text(
                                        'We are providing high quality services to our customers. You are our first priority',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey))
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.myServiceDetailRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ],
                      border:
                          Border.all(color: Colors.black87.withOpacity(0.05)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Hero(
                            tag: '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'images/painting.jpg',
                                height: 100,
                                width: 100,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 6,
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text('Car Service',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              height: 1.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))),
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
                                          const Icon(Icons.favorite)
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 5,
                                        children: [
                                          SizedBox(
                                              height: 30,
                                              child: Chip(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  label: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Icon(Icons.star,
                                                            color: kLightBlue,
                                                            size: 16),
                                                        Text('3.45',
                                                            style: TextStyle(
                                                                color:
                                                                    kLightBlue,
                                                                height: 1.3))
                                                      ]),
                                                  backgroundColor: kLightBlue
                                                      .withOpacity(0.15),
                                                  shape:
                                                      const StadiumBorder())),
                                          const Text('(44)',
                                              style: TextStyle(
                                                  color: kLightBlue,
                                                  height: 1.3))
                                        ]),
                                  ]),
                              const Divider(height: 3, thickness: 0.5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Description',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black87)),
                                    Text(
                                        'We are providing high quality services to our customers. You are our first priority',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey))
                                  ]),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Get.toNamed(RouteName.myServiceDetailRoute);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    // margin: const EdgeInsets.symmetric(
                    //     horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black87.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 5))
                      ],
                      border:
                          Border.all(color: Colors.black87.withOpacity(0.05)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [
                          Hero(
                            tag: '',
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'images/painting.jpg',
                                height: 100,
                                width: 100,
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
                        const SizedBox(width: 10),
                        Expanded(
                          child: Wrap(
                            runSpacing: 6,
                            alignment: WrapAlignment.start,
                            children: <Widget>[
                              Row(
                                children: [
                                  const Expanded(
                                      child: Text('Car Service',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              height: 1.3,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold))),
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
                                          const Icon(Icons.favorite)
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(
                                        crossAxisAlignment:
                                            WrapCrossAlignment.center,
                                        spacing: 5,
                                        children: [
                                          SizedBox(
                                              height: 30,
                                              child: Chip(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  label: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: const <Widget>[
                                                        Icon(Icons.star,
                                                            color: kLightBlue,
                                                            size: 16),
                                                        Text('3.45',
                                                            style: TextStyle(
                                                                color:
                                                                    kLightBlue,
                                                                height: 1.3))
                                                      ]),
                                                  backgroundColor: kLightBlue
                                                      .withOpacity(0.15),
                                                  shape:
                                                      const StadiumBorder())),
                                          const Text('(44)',
                                              style: TextStyle(
                                                  color: kLightBlue,
                                                  height: 1.3))
                                        ]),
                                  ]),
                              const Divider(height: 3, thickness: 0.5),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text('Description',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 17.0,
                                            color: Colors.black87)),
                                    Text(
                                        'We are providing high quality services to our customers. You are our first priority',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 15.0, color: Colors.grey))
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
      ),
    );
  }
}
