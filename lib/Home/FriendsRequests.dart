import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FriendRequestsScreen extends StatefulWidget {
  const FriendRequestsScreen({super.key});

  @override
  State<FriendRequestsScreen> createState() => _FriendRequestsScreenState();
}

class _FriendRequestsScreenState extends State<FriendRequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "FRIEND REQUESTS",
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                28.verticalSpace,
                martin("assets/images/1.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/2.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/3.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/4.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/5.png"),
                20.verticalSpace,
                Dividerr(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  martin(
    img,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/MartinProfileScreen");
      },
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            child: Image.asset(
              img,
            ),
          ),
          22.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Martin Smith",
                style: TextStyle(fontSize: 18.sp, color: Color(0xff3A3A3A)),
              ),
              Text(
                "New York",
                style: TextStyle(fontSize: 14.sp, color: Color(0xff3A3A3A)),
              ),
            ],
          ),
          50.horizontalSpace,
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Rejected();
                },
                child: Container(
                  height: 26.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  child: Center(
                    child: Text(
                      "Reject",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              10.horizontalSpace,
              GestureDetector(
                onTap: () {
                  Accepted();
                },
                child: Container(
                  height: 26.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Color(0xff00E5FE),
                      borderRadius: BorderRadius.circular(
                        20,
                      )),
                  child: Center(
                    child: Text(
                      "Accept",
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Rejected() {
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
                  width: 388.w,
                  height: 200.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10.r), color: Color(0xffFFFFFF)),
                  child: Container(
                    width: 500.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "Request has been rejected",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Accepted() {
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
                  width: 388.w,
                  height: 200.h,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(10.r), color: Color(0xffFFFFFF)),
                  child: Container(
                    width: 500.w,
                    height: 100.h,
                    child: Center(
                      child: Text(
                        "Request has been accepted successfully",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30.sp, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff010231).withOpacity(0.1),
        ),
      ],
    );
  }
}
