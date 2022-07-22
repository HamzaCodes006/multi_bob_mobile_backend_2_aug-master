import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/Provider/provider_profile_screen.dart';
import 'package:skilled_bob_app_web/responsive.dart';
import '../Customer/dashboard.dart';
import '../constant.dart';

class PostServiceScreenDesktop extends StatefulWidget {
  const PostServiceScreenDesktop({Key? key}) : super(key: key);

  @override
  _PostServiceScreenDesktopState createState() =>
      _PostServiceScreenDesktopState();
}

class _PostServiceScreenDesktopState extends State<PostServiceScreenDesktop> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool convert = true;
  List<String> options = [
    'Cook',
    'Painter',
    'Driver',
    'Plumber',
    'Mechanic',
    'Digging',
    'Drilling',
    'Inspection Shafts',
    'Dog Training',
    'Pet Sitting',
    'Ventilation',
    'Cook2',
    'Painter2',
    'Driver2',
    'Plumber2',
    'Mechanic2',
    'Digging2',
    'Drilling2',
    'Inspection Shafts2',
    'Dog Training2',
    'Pet Sitting2',
    'Ventilation2 ',
    'Digging and Drilling'
  ];
  String? jobCategory;
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
                              primary: false,
                              scrollDirection: Axis.vertical,
                              child: Center(
                                child: Container(
                                  width: size.width,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                  child: Form(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 25.0),
                                              child: Text(
                                                'Describe the service you are offering:',
                                                style: kBodyTextBlack.copyWith(
                                                    color: kLightBlue),
                                              ),
                                            ),
                                          ),
                                        ),
                                        //Title
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: TextFormField(
                                            maxLength: 10,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                            ),
                                            decoration: InputDecoration(
                                              hintStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.money,
                                                color: Colors.blue,
                                              ),
                                              labelText: 'Service Title',
                                              labelStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            ),
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.next,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        //description
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 25.0),
                                          child: TextFormField(
                                            maxLines: 7,
                                            maxLength: 2500,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Please Enter Service Description';
                                              }
                                              return null;
                                            },
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                            ),
                                            decoration: InputDecoration(
                                              hintStyle: const TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.blue,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.description_outlined,
                                                color: Colors.blue,
                                              ),
                                              labelText: 'Description',
                                              labelStyle: const TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.blue,
                                              ),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                color: Colors.blue,
                                              )),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors.blueAccent,
                                                ),
                                              ),
                                              focusColor: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        //job category
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: DecoratedBox(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              border: Border.all(
                                                color: Colors.blue,
                                                width: 1,
                                              ),
                                            ),
                                            child: Container(
                                              width: size.width,
                                              height: size.height * 0.06,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadiusDirectional
                                                        .circular(10),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Icon(
                                                      Icons.category_outlined,
                                                      color: Colors.blue,
                                                      size: 22.0,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 5.0),
                                                    child:
                                                        DropdownButton<String>(
                                                      menuMaxHeight:
                                                          size.height,
                                                      dropdownColor:
                                                          Colors.white,
                                                      itemHeight: 60.0,
                                                      hint: const Text(
                                                        'Select Job Category',
                                                        style: TextStyle(
                                                          fontSize: 17.0,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      icon: const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    30.0),
                                                        child: Icon(
                                                          Icons
                                                              .keyboard_arrow_down_outlined,
                                                          color: Colors.blue,
                                                          size: 22,
                                                        ),
                                                      ),
                                                      underline:
                                                          const SizedBox(),
                                                      iconSize: 22.0,
                                                      style: kBodyText,
                                                      onChanged:
                                                          (String? newValue) {
                                                        setState(() {
                                                          jobCategory =
                                                              newValue;
                                                        });
                                                      },
                                                      value: jobCategory,
                                                      items: options.map<
                                                              DropdownMenuItem<
                                                                  String>>(
                                                          (String value) {
                                                        return DropdownMenuItem<
                                                            String>(
                                                          onTap: () {
                                                            setState(() {
                                                              jobCategory =
                                                                  value;
                                                            });
                                                          },
                                                          alignment:
                                                              Alignment.center,
                                                          value: value,
                                                          child: Text(
                                                            value,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        //Email
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: TextFormField(
                                            maxLength: 10,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                            ),
                                            decoration: InputDecoration(
                                              hintStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.email,
                                                color: Colors.blue,
                                              ),
                                              labelText: 'Email',
                                              labelStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            textInputAction:
                                                TextInputAction.next,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        //upload
                                        const Padding(
                                          padding: EdgeInsets.only(left: 25.0),
                                          child: Text(
                                            'Upload any three images of your services.',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.blue,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 25.0),
                                              child: Container(
                                                width: size.width / 4.7,
                                                height: size.height * 0.17,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: kLightBlue,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'images/upload.png',
                                                      height: 70,
                                                      color: kDarkBlueColor,
                                                    ),
                                                    const Text(
                                                      'Click to upload Image or Video.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 25.0),
                                              child: Container(
                                                width: size.width / 4.7,
                                                height: size.height * 0.17,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: kLightBlue,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'images/upload.png',
                                                      height: 70,
                                                      color: kDarkBlueColor,
                                                    ),
                                                    const Text(
                                                      'Click to upload Image or Video.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 25.0),
                                              child: Container(
                                                width: size.width / 4.6,
                                                height: size.height * 0.17,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: kLightBlue,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'images/upload.png',
                                                      height: 70,
                                                      color: kDarkBlueColor,
                                                    ),
                                                    const Text(
                                                      'Click to upload Image or Video.',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        // Location
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: TextFormField(
                                            maxLines: 4,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue,
                                            ),
                                            decoration: InputDecoration(
                                              hintStyle: const TextStyle(
                                                fontSize: 17.0,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.location_on,
                                                // color: Theme.of(context).primaryColor,
                                                color: Colors.blue,
                                              ),
                                              labelText: 'Location',
                                              labelStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              // focusColor: kOrange,
                                            ),
                                            keyboardType: TextInputType.text,
                                            textInputAction:
                                                TextInputAction.next,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        //budget
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: TextFormField(
                                            maxLength: 10,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              // fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                            decoration: InputDecoration(
                                              // fillColor: Colors.blue[200]!.withOpacity(0.4),
                                              // filled: true,
                                              // hoverColor: kDarkBlue,
                                              // helperText: 'Add Text',
                                              hintStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.money,
                                                color: Colors.blue,
                                              ),
                                              labelText: 'Job Budget',
                                              labelStyle: const TextStyle(
                                                fontSize: 17.0,
                                                color: Colors.blue,
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: const BorderSide(
                                                  color: Colors.blue,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            textInputAction:
                                                TextInputAction.next,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        //post A Job button
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0, horizontal: 25.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              height: size.height * 0.07,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: kLightBlue,
                                              ),
                                              child: FlatButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const Text(
                                                  'Post',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * 0.03,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
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
