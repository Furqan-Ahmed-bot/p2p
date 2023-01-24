import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SPOTIFYScreen extends StatefulWidget {
  const SPOTIFYScreen({super.key});

  @override
  State<SPOTIFYScreen> createState() => _SPOTIFYScreenState();
}

class _SPOTIFYScreenState extends State<SPOTIFYScreen> {
  var selcted = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SPOTIFY",
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
                Container(
                  width: 388.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.2),
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                    border: Border.all(color: Color(0xFFC6C8D2)),
                    borderRadius: BorderRadius.circular(25.r),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                    ),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 25, top: 9),
                      // labelText: "Type a message",
                      hintText: "Search here",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      labelStyle: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xffA7B1BF),
                        fontFamily: "Inter, Regular",
                      ),
                      prefixIcon: Container(
                        width: 50.w,
                        height: 30.h,
                        child: Row(
                          children: [
                            7.horizontalSpace,
                            Container(
                              width: 40.w,
                              height: 40.h,
                              // decoration: BoxDecoration(
                              //   shape: BoxShape.circle,
                              //   color: Color(0xff00DBFA),
                              // ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/Icon feather-search.png",
                                  scale: 5,
                                  color: Color(0xffA7B1BF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                17.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Music",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 1 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 1 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 2;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Rock",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 2 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 2 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 3;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Soul",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 3 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 3 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 4;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 50.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Classic",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 4 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 4 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 5;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Pop",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 5 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 5 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 6;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "R&B",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 6 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 6 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                12.verticalSpace,
                Boxss("assets/images/NoPath - Copy (16).png", "assets/images/NoPath - Copy (44).png", "Feelin' Good", "Feel good with positively",
                    "Peaceful Piano", "Relax and induge with"),
                17.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 1;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Music",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 1 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 1 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 2;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Rock",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 2 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 2 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 3;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Soul",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 3 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 3 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 4;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 50.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Classic",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 4 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 4 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 5;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "Pop",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 5 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 5 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selcted = 6;
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 45.w,
                            height: 30.h,
                            // decoration: BoxDecoration(
                            //   borderRadius: BorderRadius.circular(15.r),
                            //   gradient: LinearGradient(
                            //     begin: Alignment.bottomLeft,
                            //     end: Alignment.bottomRight,
                            //     colors: [
                            //       Color(0xffC95B00),
                            //       Color(0xff903400),
                            //     ],
                            //   ),
                            // ),
                            child: Center(
                              child: Text(
                                "R&B",
                                style: GoogleFonts.abel(
                                  fontWeight: FontWeight.bold,
                                  color: selcted == 6 ? Colors.black : Colors.grey,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 47.w,
                            height: 2.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: selcted == 6 ? Color(0XFF004DF2) : Colors.transparent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                17.verticalSpace,
                Boxss("assets/images/NoPath - Copy (21).png", "assets/images/NoPath - Copy (23).png", "Feelin' Good", "Feel good with positively",
                    "ABCDEFU", "Relax and induge with"),
                17.verticalSpace,
                Boxss("assets/images/NoPath - Copy (26).png", "assets/images/NoPath - Copy (28).png", "Feelin' Good", "", "ABCDEFU", ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Boxss(
    Img1,
    Img2,
    ftxt,
    ftxt2,
    stxt,
    stxt2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Container(
              width: 183.w,
              height: 182.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  Img1,
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              ftxt,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              ftxt2,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            )
          ],
        ),
        Column(
          children: [
            Container(
              width: 183.w,
              height: 182.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  Img2,
                ),
              ),
            ),
            10.verticalSpace,
            Text(
              stxt,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            ),
            Text(
              stxt2,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ],
    );
  }
}
