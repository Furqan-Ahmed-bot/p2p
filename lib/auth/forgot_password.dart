import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:p2ptraffic/auth/prelogin_screen.dart';

class FORGOTPASSWORDScreen extends StatefulWidget {
  const FORGOTPASSWORDScreen({super.key});

  @override
  State<FORGOTPASSWORDScreen> createState() => _FORGOTPASSWORDScreenState();
}

class _FORGOTPASSWORDScreenState extends State<FORGOTPASSWORDScreen> {
  bool isChecked = false;
  bool isChecked2 = false;
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
            "FORGOT PASSWORD",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  78.verticalSpace,
                  Container(
                    width: 184.w,
                    height: 66.h,
                    child: Image.asset("assets/images/Group 1370.png"),
                  ),
                  119.verticalSpace,
                  Names("Username / Phone"),
                  5.verticalSpace,
                  TextField(),
                  50.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/VERIFICATIONScreen");
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
                              "Continue",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  351.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/LOGINScreen");
                    },
                    child: Container(
                      child: Center(
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'Already have an account? ', style: TextStyle(color: Colors.white, fontSize: 14)),
                              TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.white,
                                    decoration: TextDecoration.underline,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextField() {
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

  Names(
    txt,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
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

  TextField1(
    txt,
    Img,
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
          contentPadding: EdgeInsets.only(left: 30, top: 10),
          hintText: txt,
          suffixIcon: Container(
            child: Image.asset(
              Img,
              scale: 5,
            ),
          ),
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }
}


