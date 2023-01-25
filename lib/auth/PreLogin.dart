import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:p2ptraffic/Home/Navbar.dart';

import '../Home/BottomController.dart';

class PRELOGINScreen extends StatefulWidget {
  const PRELOGINScreen({super.key});

  @override
  State<PRELOGINScreen> createState() => _PRELOGINStateScreen();
}

class _PRELOGINStateScreen extends State<PRELOGINScreen> {
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "PRE LOGIN",
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
                  GestureDetector(
                    onTap: () {
                      Function1();
                    },
                    child: Container(
                      width: 348.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Color(0xffEB6C0D),
                        border: Border.all(color: Color(0xffC6C8D2)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     // color: Colors.grey.withOpacity(0.5),
                        //     // spreadRadius: 5,
                        //     // blurRadius: 0,
                        //     offset: Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                        // border: Border.all(color: Colors.white, width: 3.sp),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 17),
                              child: Container(
                                width: 16.w,
                                height: 13.h,
                                child: Image.asset(
                                  "assets/images/Icon material-email.png",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // SizedBox(width: 17.h),
                            Text(
                              "Login with Username",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
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
                        color: Color(0xff3155B8),
                        border: Border.all(color: Color(0xffC6C8D2)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     // color: Colors.grey.withOpacity(0.5),
                        //     // spreadRadius: 5,
                        //     // blurRadius: 0,
                        //     offset: Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                        // border: Border.all(color: Colors.white, width: 3.sp),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 17),
                              child: Container(
                                width: 15.w,
                                height: 15.h,
                                child: Image.asset("assets/images/Icon ionic-logo-facebook.png"),
                              ),
                            ),
                            // SizedBox(width: 18.h),
                            Text(
                              "Login with Facebook",
                              style: TextStyle(color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
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
                        color: Color(0xffCB1D1D),
                        border: Border.all(color: Color(0xffC6C8D2)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     // color: Colors.grey.withOpacity(0.5),
                        //     // spreadRadius: 5,
                        //     // blurRadius: 0,
                        //     offset: Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                        // border: Border.all(color: Colors.white, width: 3.sp),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Icon ionic-logo-google.png",
                              scale: 3.7,
                            ),
                            SizedBox(width: 24.h),
                            Container(
                              width: 190.w,
                              height: 30.h,
                              child: Text(
                                "Login with Google",
                                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  15.verticalSpace,
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
                        color: Color(0xff000000),
                        border: Border.all(color: Color(0xffC6C8D2)),
                        // boxShadow: [
                        //   BoxShadow(
                        //     // color: Colors.grey.withOpacity(0.5),
                        //     // spreadRadius: 5,
                        //     // blurRadius: 0,
                        //     offset: Offset(0, 0), // changes position of shadow
                        //   ),
                        // ],
                        // border: Border.all(color: Colors.white, width: 3.sp),
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/Icon metro-apple.png",
                              scale: 3.7,
                            ),
                            SizedBox(width: 25.h),
                            Container(
                              width: 190.w,
                              height: 30.h,
                              child: Text(
                                "Login with Google",
                                style: TextStyle(color: Colors.white, fontSize: 18.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  256.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/SIGNUPScreen');
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
                              TextSpan(text: 'Dont have an account? ', style: TextStyle(color: Colors.white, fontSize: 14)),
                              TextSpan(
                                  text: 'Signup',
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

  Function1() {
    return showDialog(
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 349.w,
                  height: 348.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10.r), color: Color(0xffFFFFFF)),
                  child: ListView(
                    children: [
                      Container(
                        width: 365.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff1CC8FB),
                              Color(0xff004DF2),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 125.w,
                            ),
                            Text(
                              "Agreement",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(children: [
                        Text(
                          "I agree with the following",
                          style: TextStyle(fontSize: 18.sp, color: Colors.black),
                        ),
                        30.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 250.w,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            side: AlwaysActiveBorderSide(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.r),
                                            ),
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            }),
                                        Text(
                                          "Terms & Conditions",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                              Row(
                                children: [
                                  Container(
                                    width: 250.w,
                                    height: 20.h,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            side: AlwaysActiveBorderSide(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(5.r),
                                            ),
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            value: isChecked2,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked2 = value!;
                                              });
                                            }),
                                        Text(
                                          "Privacy Policy",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        85.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 171.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0.r),
                                    bottomLeft: Radius.circular(18.r),
                                  ),
                                  color: Color(0xffDCE3EE),
                                ),
                                child: Center(
                                  child: Text(
                                    "Decline",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xffDCE3EE),
                              height: 64.h,
                              width: 1.6.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/LOGINScreen");
                              },
                              child: Container(
                                width: 170.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(0.r),
                                    bottomRight: Radius.circular(18.r),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff1CC8FB),
                                      Color(0xff004DF2),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Accept",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ])
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) => const BorderSide(
        color: Color(0xffF58532),
      );
}
