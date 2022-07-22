import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../constant.dart';
import '../hover.dart';

class PostJobScreenDesktop extends StatefulWidget {
  const PostJobScreenDesktop({Key? key}) : super(key: key);

  @override
  _PostJobScreenDesktopState createState() => _PostJobScreenDesktopState();
}

class _PostJobScreenDesktopState extends State<PostJobScreenDesktop> {
  List<String> options = ['Cook', 'Painter', 'Driver', 'Plumber', 'Mechanic'];
  String? jobCategory;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          elevation: 0,
          bottomOpacity: 6,
          shadowColor: Colors.grey,
          // shadowColor: Colors.transparent,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Container(
                height: size.height * 0.06,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'),
                  ),
                ),
                child: Image.asset('images/logo.png'),
              ),
              const Text(
                'MultiBob',
                style: TextStyle(
                  color: Colors.black87,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PTSans',
                  fontSize: 24,
                ),
              ),
            ],
          ),
          actions: [
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Home',
                      style: TextStyle(
                        color: isHovered ? kDarkBlueColor : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        color: isHovered ? kDarkBlueColor : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Post A Request',
                      style: TextStyle(
                        color: isHovered ? kDarkBlueColor : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 10,
            ),
            OnHover(
              builder: (bool isHovered) {
                //final color = ;
                return Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: isHovered ? kLightBlueColor : kDarkBlueColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    border: Border.all(
                      width: 2,
                      color: isHovered ? kDarkBlueColor : kLightBlueColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                        color: isHovered ? kDarkBlueColor : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ));
              },
            ),
            const SizedBox(
              width: 40,
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          primary: false,
          scrollDirection: Axis.vertical,
          child: Center(
            child: Container(
              width: size.width * 0.5,
              decoration: const BoxDecoration(color: Colors.white),
              child: Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Please fill the form for your job.',
                        style: kBodyTextBlack,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        decoration: InputDecoration(
                          // fillColor: Colors.blue[200]!.withOpacity(0.4),
                          // filled: true,
                          // hoverColor: kDarkBlue,
                          // helperText: 'Add Text',
                          hintStyle: const TextStyle(
                            fontSize: 17.0,
                          ),
                          prefixIcon: const Icon(
                            Icons.account_circle,
                          ),
                          labelText: 'Email',
                          labelStyle: const TextStyle(
                            fontSize: 17.0,
                            // color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          // focusColor: kOrange,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //job title
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.work,
                            // color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Job Title',
                          labelStyle: const TextStyle(
                            fontSize: 17.0,
                            // color: Colors.blue,
                          ),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          // focusColor: kOrange,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //Location
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: TextFormField(
                        maxLines: 5,
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        decoration: InputDecoration(
                          // fillColor: Colors.blue[200]!.withOpacity(0.4),
                          // filled: true,
                          // hoverColor: kDarkBlue,
                          // helperText: 'Add Text',
                          hintStyle: const TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.location_on,
                            // color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Location',
                          labelStyle: const TextStyle(
                            fontSize: 17.0,
                            // color: Colors.blue,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          // focusColor: kOrange,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                      ),
                    ),

                    //job category
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(5),
                          // border: Border.all(color: kLightBlue, width: 1,),
                        ),
                        child: Container(
                          width: size.width,
                          height: size.height * 0.06,
                          decoration: BoxDecoration(
                            // color: Colors.blue[200]!.withOpacity(0.4),
                            borderRadius: BorderRadiusDirectional.circular(5),
                            border: Border.all(width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.category_outlined,
                                  // color: kLightBlue,
                                  size: 22.0,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: DropdownButton<String>(
                                  menuMaxHeight: size.height,
                                  // isDense: true,
                                  // focusColor: Colors.blueAccent,
                                  // autofocus: true,
                                  dropdownColor: Colors.white,
                                  itemHeight: 60.0,
                                  hint: const Text(
                                    'Select Job Category',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      // color: Colors.blue,
                                    ),
                                  ),
                                  value: jobCategory,

                                  icon: const Padding(
                                    padding: EdgeInsets.only(left: 480.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      // color: kLightBlue,
                                      size: 22,
                                    ),
                                  ),
                                  underline: const SizedBox(),
                                  iconSize: 22.0,
                                  style: kBodyText,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      jobCategory = newValue;
                                    });
                                  },
                                  items: options.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      onTap: () {
                                        setState(() {
                                          jobCategory = value;
                                        });
                                      },
                                      alignment: Alignment.center,
                                      value: value,
                                      child: Text(
                                        value,
                                        style: const TextStyle(
                                            color: Colors.black87),
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

                    //job price
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: TextFormField(
                        maxLength: 10,
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        decoration: InputDecoration(
                          // fillColor: Colors.blue[200]!.withOpacity(0.4),
                          // filled: true,
                          // hoverColor: kDarkBlue,
                          // helperText: 'Add Text',
                          hintStyle: const TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.money,
                            // color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Job Price',
                          labelStyle: const TextStyle(
                            fontSize: 17.0,
                            // color: Colors.blue,
                          ),
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          // focusColor: kOrange,
                        ),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //job description
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 25.0),
                      child: TextFormField(
                        maxLines: 6,
                        style: const TextStyle(
                            fontSize: 18,
                            // fontWeight: FontWeight.bold,
                            color: Colors.black87),
                        decoration: InputDecoration(
                          hintStyle: const TextStyle(
                            fontSize: 17.0,
                            color: Colors.grey,
                          ),
                          prefixIcon: const Icon(
                            Icons.description,
                            // color: Theme.of(context).primaryColor,
                          ),
                          labelText: 'Job Description',
                          labelStyle: const TextStyle(
                            fontSize: 17.0,
                            // color: Colors.blue,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor),
                          ),
                          // focusColor: kOrange,
                        ),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    //button
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
                            borderRadius: BorderRadius.circular(5.0),
                            color: kLightBlue,
                          ),
                          child: FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Post',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    //end
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
