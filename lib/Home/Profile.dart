import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PROFILE2Screen extends StatefulWidget {
  const PROFILE2Screen({super.key});

  @override
  State<PROFILE2Screen> createState() => _PROFIL2EScreenState();
}

class _PROFIL2EScreenState extends State<PROFILE2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "PROFILE",
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
            backgroundBlendMode: BlendMode.colorBurn,
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
                75.verticalSpace,
                Container(
                  width: 143.w,
                  height: 143.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff004DF2),
                        Color(0xff1CC8FB),
                      ],
                    ),
                  ),
                  child: Image.asset(
                    "assets/images/NoPath.png",
                    scale: 4.3,
                  ),
                ),
                27.verticalSpace,
                Text(
                  "Julie Smith",
                  style: TextStyle(
                    color: Color(
                      0xff3A3A3A,
                    ),
                    fontSize: 25.sp,
                  ),
                ),
                27.verticalSpace,
                contts(
                  "assets/images/Icon material-email.png",
                  "Julie.smith@domain.com",
                ),
                15.verticalSpace,
                contts(
                  "assets/images/Icon feather-phone.png",
                  "+1 234 567890",
                ),
                15.verticalSpace,
                contts(
                  "assets/images/Icon awesome-transgender.png",
                  "Female",
                ),
                15.verticalSpace,
                contts(
                  "assets/images/location.png",
                  "20 Cooper Square",
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 188.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(255, 0, 0, 0.06),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          20.horizontalSpace,
                          10.horizontalSpace,
                          Text(
                            "New York",
                            style: TextStyle(
                              color: Color(0xff0C0D26),
                              fontSize: 16.sp,
                            ),
                          ),
                          65.horizontalSpace,
                        ],
                      ),
                    ),
                    Container(
                      width: 188.w,
                      height: 55.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(255, 0, 0, 0.06),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          20.horizontalSpace,
                          10.horizontalSpace,
                          Text(
                            "NY",
                            style: TextStyle(
                              color: Color(0xff0C0D26),
                              fontSize: 16.sp,
                            ),
                          ),
                          // 65.horizontalSpace,
                        ],
                      ),
                    ),
                  ],
                ),
                50.verticalSpace,
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
                          "Edit Profile",
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

  contts(
    img,
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 57,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 0, 0, 0.06),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            20.horizontalSpace,
            Container(
              width: 20.w,
              height: 16.h,
              child: Image.asset(
                img,
              ),
            ),
            10.horizontalSpace,
            Text(
              txt,
              style: TextStyle(
                color: Color(0xff878B9E),
                fontSize: 17.sp,
              ),
            ),
            65.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
