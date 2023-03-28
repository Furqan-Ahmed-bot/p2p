import 'package:flutter/material.dart';

import '../export_all.dart';


class CREATEPROFILEScreen extends StatefulWidget {
  const CREATEPROFILEScreen({super.key});

  @override
  State<CREATEPROFILEScreen> createState() => _CREATEPROFILEStateScreen();
}

class _CREATEPROFILEStateScreen extends State<CREATEPROFILEScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Mask Group 3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              child: Image.asset(
                "assets/images/Icon ionic-ios-arrow-round-back.png",
                scale: 5,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "CREATE PROFILE",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: [
                  20.verticalSpace,
                  Stack(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: Color(0xff00DBFA).withOpacity(0.2),
                          child: CircleAvatar(
                            backgroundColor: Color(0xff21CDFB),
                            child: Padding(
                              padding: EdgeInsets.all(0),
                              child: Image(
                                image: AssetImage("assets/images/NoPath.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            radius: 60,
                          ),
                        ),
                        decoration: BoxDecoration(),
                      ),
                      Positioned(
                        bottom: 10,
                        right: -20,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff1CC8FB),
                                  Color(0xff004DF2),
                                ],
                              ),
                              border: Border.all(color: Color(0xffF6F6F6))),
                          height: 40.h,
                          child: RawMaterialButton(
                            // highlightColor: Color(0xff21CDFB),
                            onPressed: () {},
                            elevation: 1,
                            // fillColor: Color(0xff21CDFB),

                            child: Image.asset(
                              "assets/images/Icon ionic-ios-reverse-camera.png",
                              scale: 4,
                            ),
                            // padding: EdgeInsets.all(2),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  49.verticalSpace,
                  Names("Full Name"),
                  5.verticalSpace,
                  TextField("Martin Smith"),
                  20.verticalSpace,
                  Names("Gender"),
                  5.verticalSpace,
                  DropdownButtonn(),
                  20.verticalSpace,
                  Names("Phone Number"),
                  5.verticalSpace,
                  TextField22(), 20.verticalSpace,
                  Names("Country"),
                  5.verticalSpace,
                  TextField22(), 20.verticalSpace,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "City",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          5.verticalSpace,
                          TextFieldsmall(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              "State",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          5.verticalSpace,
                          DropdownButtonnsmall(),
                        ],
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      final bottomcontroller = Get.put(BottomController());
                      bottomcontroller.navBarChange(0);
                      Get.to(() => MainScreen());
                    },
                    child: Container(
                      width: 348.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff1CC8FB),
                            Color(0xff004DF2),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Create",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Container(
                  //   width: 134.w,
                  //   height: 130.h,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(color: Color(0xff21CDFB)),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Color(0xff21CDFB).withOpacity(0.25),
                  //         spreadRadius: 20,
                  //         blurRadius: 7,
                  //         offset: Offset(0, 3), // changes position of shadow
                  //       ),
                  //     ],
                  //     // boxShadow: [
                  //     //   BoxShadow(
                  //     //     color: Color(0xff00DBFA),
                  //     //     spreadRadius: 9,
                  //     //     blurRadius: 9,
                  //     //     offset: Offset(0, 3), // changes position of shadow
                  //     //   ),
                  //     // ],
                  //   ),
                  //   child: Center(
                  //     child: Image.asset(
                  //       "assets/images/NoPath.png",
                  //       scale: 3.8,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  DropdownButtonn() {
    return 
    Container(
      width: 348.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: DropdownButtonFormField(
        hint: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "Male",
            style: TextStyle(color: Colors.black),
          ),
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        items: ['Male', 'Female'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          // Handle the value change
        },
      ),
    );
  }

  TextField(
    txt,
  ) {
    return Container(
      width: 348.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        border: Border.all(color: Color(0xffDCDFE2), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          hintText: txt,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Names(
    txt,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }

  TextField22() {
    return Container(
      width: 348.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        border: Border.all(color: Color(0xffDCDFE2), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          // hintText: txt,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  TextFieldsmall() {
    return Container(
      width: 169.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
        border: Border.all(color: Color(0xffDCDFE2), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          // hintText: txt,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  DropdownButtonnsmall() {
    return Container(
      width: 169.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: DropdownButtonFormField(
        // hint: Padding(
        //   padding: const EdgeInsets.only(left: 20),
        //   child: Text(
        //     "Male",
        //     style: TextStyle(color: Colors.black),
        //   ),
        // ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        items: ['USA', 'UAE'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          // Handle the value change
        },
      ),
    );
  }
}
