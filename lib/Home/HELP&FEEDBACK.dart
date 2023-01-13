import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HELPAndFEEDBACKScreen extends StatefulWidget {
  const HELPAndFEEDBACKScreen({super.key});

  @override
  State<HELPAndFEEDBACKScreen> createState() => _HELPAndFEEDBACKStateScreen();
}

class _HELPAndFEEDBACKStateScreen extends State<HELPAndFEEDBACKScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "HELP & FEEDBACK",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 0,
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
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color(0xff004DF2),
                Color(0xff1CC8FB),
              ],
            ),
            // backgroundBlendMode: BlendMode.colorBurn,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                17.verticalSpace,
                TextField1("Subject"),
                17.verticalSpace,
                Container(
                  width: 388.w,
                  height: 317.h,
                  decoration: BoxDecoration(
                    color: Color(0xffEAEAEE),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff66708026).withOpacity(0.06),
                        spreadRadius: 0,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        left: 20,
                      ),
                      hintText: "Type your message here...",
                      // suffixIcon: Container(
                      //   child: Image.asset(
                      //     "assets/images/Icon ionic-md-eye-off.png",
                      //     scale: 5,
                      //   ),
                      // ),
                      hintStyle: TextStyle(color: Color(0xff878B9E), fontSize: 16.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                33.verticalSpace,
                Imgss(),
                42.verticalSpace,
                Container(
                  width: 387.w,
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
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
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

  TextField1(
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Color(0xffEAEAEE),
        boxShadow: [
          BoxShadow(
            color: Color(0xff66708026).withOpacity(0.06),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 20,
          ),
          hintText: txt,
          // suffixIcon: Container(
          //   child: Image.asset(
          //     "assets/images/Icon ionic-md-eye-off.png",
          //     scale: 5,
          //   ),
          // ),
          hintStyle: TextStyle(color: Color(0xff878B9E), fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Imgss() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: 87.w,
                  height: 97.h,
                  child: Image.asset(
                    "assets/images/NoPath - Copy (29).png",
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 65,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      child: Image.asset("assets/images/Group 1005.png"),
                    )),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 87.w,
                  height: 97.h,
                  child: Image.asset(
                    "assets/images/NoPath - Copy (30).png",
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 65,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      child: Image.asset("assets/images/Group 1005.png"),
                    )),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 87.w,
                  height: 97.h,
                  child: Image.asset(
                    "assets/images/NoPath - Copy (32).png",
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 65,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      child: Image.asset("assets/images/Group 1005.png"),
                    )),
              ],
            ),
            Container(
              width: 87.w,
              height: 97.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(2.r),
                dashPattern: [3, 8],
                color: Colors.grey,
                strokeWidth: 2,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      "assets/images/Icon ionic-ios-add-circle.png",
                      height: 29.h,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
