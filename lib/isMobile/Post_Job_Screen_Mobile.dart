import 'package:flutter/material.dart';
import 'package:skilled_bob_app_web/responsive.dart';

import '../constant.dart';
import '../hover.dart';

class PostJobScreenMobile extends StatefulWidget {
  const PostJobScreenMobile({Key? key}) : super(key: key);

  @override
  _PostJobScreenMobileState createState() => _PostJobScreenMobileState();
}

class _PostJobScreenMobileState extends State<PostJobScreenMobile> {
  List<String> options = ['Cook', 'Painter', 'Driver', 'Plumber', 'Mechanic'];
  String? jobCategory;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Post A Job',
            style: TextStyle(color: kLightBlue),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: kLightBlue,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 5,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              // key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Email',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                      // TextFieldInput(
                      //   validator: (value) {
                      //     if (value == null || value.isEmpty) {
                      //       return 'Please Enter Product Description!';
                      //     }
                      //     setState(() {
                      //       productDescription = value;
                      //     });
                      //     return null;
                      //   },
                      //   icon: Icons.description_outlined,
                      //   labelText: 'Description',
                      //   inputType: TextInputType.text,
                      //   inputAction: TextInputAction.next,
                      //   maxLines: 5,
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.work,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Job Title',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          maxLines: 4,
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Location',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(10),
                            // border: Border.all(color: kLightBlue, width: 1,),
                          ),
                          child: Container(
                            width: size.width,
                            height: size.height * 0.06,
                            decoration: BoxDecoration(
                              color: Colors.blue[200]!.withOpacity(0.4),
                              borderRadius:
                                  BorderRadiusDirectional.circular(10),
                              // border: Border.all(color: kLightBlue, width: 1,),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.category_outlined,
                                    color: kLightBlue,
                                    size: 22.0,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: DropdownButton<String>(
                                    // focusColor: Colors.red,

                                    dropdownColor: kLightBlue.withOpacity(0.8),
                                    itemHeight: 60.0,
                                    hint: const Text(
                                      'Select Job Category',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    // value: jobCategory,
                                    icon: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Icon(
                                        Icons.keyboard_arrow_down_outlined,
                                        color: kLightBlue,
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
                                    // newValue // selectedItemBuilder: (BuildContext context) {
                                    //   return options.map((String value) {
                                    //     return Text(
                                    //       dropdownValue,
                                    //       style: const TextStyle(color: Colors.black87),
                                    //     );
                                    //   }).toList();
                                    // },
                                    items: options
                                        .map<DropdownMenuItem<String>>(
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
                                              color: Colors.white),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.work_outline,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Job Category',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          maxLength: 10,
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.money,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Job Price',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            contentPadding: EdgeInsets.zero,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 25.0),
                        child: TextFormField(
                          maxLines: 5,
                          style: const TextStyle(
                              fontSize: 18,
                              // fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            fillColor: Colors.blue[200]!.withOpacity(0.4),
                            filled: true,
                            hoverColor: kDarkBlue,
                            // helperText: 'Add Text',
                            hintStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.grey,
                            ),
                            prefixIcon: Icon(
                              Icons.description,
                              color: Theme.of(context).primaryColor,
                            ),
                            labelText: 'Job Description',
                            labelStyle: const TextStyle(
                              fontSize: 17.0,
                              color: Colors.blue,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                              borderRadius: BorderRadius.circular(10.0),
                              color: kLightBlue,
                            ),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Post',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ), // Navigator.pushNamed(context, SuccessScreen.id),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
