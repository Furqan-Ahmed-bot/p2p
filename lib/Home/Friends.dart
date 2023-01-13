import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FRIENDSScreen extends StatefulWidget {
  const FRIENDSScreen({super.key});

  @override
  State<FRIENDSScreen> createState() => _FRIENDSScreenState();
}

class _FRIENDSScreenState extends State<FRIENDSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "FRIENDS",
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
          151.horizontalSpace,
          Container(
            height: 26.h,
            width: 26.w,
            child: Image.asset(
              "assets/images/Icon ionic-ios-close-circle.png",
            ),
          ),
        ],
      ),
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
