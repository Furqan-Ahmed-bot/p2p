import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:p2ptraffic/home/BottomController.dart';
import 'package:p2ptraffic/home/Navbar.dart';

class POSTScreen extends StatefulWidget {
  const POSTScreen({super.key});

  @override
  State<POSTScreen> createState() => _POSTScreenState();
}

class _POSTScreenState extends State<POSTScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Post",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                26.verticalSpace,
                Imgss(),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/Group 16588.png",
                        scale: 4,
                      ),
                    ),
                    8.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        "More Photo",
                        style: TextStyle(
                          fontSize: 12.sp,
                        ),
                      ),
                    )
                  ],
                ),
                29.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Caption",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xff010231),
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                20.verticalSpace,
                Container(
                  width: 388.w,
                  height: 89.h,
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
                      hintText: "Write Caption",
                      // suffixIcon: Container(
                      //   child: Image.asset(
                      //     "assets/images/Icon ionic-md-eye-off.png",
                      //     scale: 5,
                      //   ),
                      // ),
                      hintStyle:
                          TextStyle(color: Color(0xff878B9E), fontSize: 15.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                29.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Past Availabilty",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xff010231),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Container(
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
                        top: 15,
                        left: 20,
                      ),
                      hintText: "Select Time",
                      suffixIcon: Container(
                        child: Image.asset(
                          "assets/images/Icon ionic-ios-arrow-down.png",
                          scale: 4,
                        ),
                      ),
                      hintStyle:
                          TextStyle(color: Color(0xff878B9E), fontSize: 15.sp),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                29.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Tag People",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xff010231),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                29.verticalSpace,
                Container(
                  width: 388.w,
                  height: 56.h,
                  decoration: BoxDecoration(
                    color: Color(0xffEAEAEE),
                    borderRadius: BorderRadius.circular(
                      5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 140.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                              color: Color(0xff878B9E).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                20,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "William Smith",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  child: Image.asset(
                                    "assets/images/redcross.png",
                                    scale: 5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Container(
                          width: 100.w,
                          height: 36.h,
                          decoration: BoxDecoration(
                              color: Color(0xff878B9E).withOpacity(0.5),
                              borderRadius: BorderRadius.circular(
                                20,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Amelia",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  child: Image.asset(
                                    "assets/images/redcross.png",
                                    scale: 5,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                29.verticalSpace,
                Row(
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Color(0xff010231),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 15.w,
                      height: 21.h,
                      child: Image.asset(
                          "assets/images/Icon material-location-onn.png"),
                    ),
                    15.horizontalSpace,
                    Text("20 Cooper Square, New York"),
                  ],
                ),
                30.verticalSpace,
                GestureDetector(
                  onTap: () {
                    final bottomcontroller = Get.put(BottomController());
                    bottomcontroller.navBarChange(1);
                    Get.to(() => MainScreen());
                  },
                  child: Container(
                    width: 388.w,
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
                            "Post",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Imgss() {
    return Container(
      width: double.infinity,
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 117.w,
                height: 125.h,
                child: Image.asset(
                  "assets/images/NoPath - Copy (29).png",
                ),
              ),
              Positioned(
                  top: 0,
                  left: 93,
                  child: Container(
                    width: 21.w,
                    height: 21.h,
                    child: Image.asset("assets/images/Group 1005.png"),
                  )),
            ],
          ),
          15.horizontalSpace,
          Stack(
            children: [
              Container(
                width: 117.w,
                height: 125.h,
                child: Image.asset(
                  "assets/images/NoPath - Copy (30).png",
                ),
              ),
              Positioned(
                  top: 0,
                  left: 93,
                  child: Container(
                    width: 21.w,
                    height: 21.h,
                    child: Image.asset("assets/images/Group 1005.png"),
                  )),
            ],
          ),
          15.horizontalSpace,

          Stack(
            children: [
              Container(
                width: 117.w,
                height: 125.h,
                child: Image.asset(
                  "assets/images/NoPath - Copy (32).png",
                ),
              ),
              Positioned(
                  top: 0,
                  left: 93,
                  child: Container(
                    width: 21.w,
                    height: 21.h,
                    child: Image.asset("assets/images/Group 1005.png"),
                  )),
            ],
          ),
          // Container(
          //   width: 87.w,
          //   height: 97.h,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(5.r),
          //   ),
          //   child: DottedBorder(
          //     borderType: BorderType.RRect,
          //     radius: Radius.circular(2.r),
          //     dashPattern: [3, 8],
          //     color: Colors.grey,
          //     strokeWidth: 2,
          //     child: Center(
          //       child: Container(
          //         child: Image.asset(
          //           "assets/images/Icon ionic-ios-add-circle.png",
          //           height: 29.h,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
