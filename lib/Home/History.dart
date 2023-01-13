import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'Drawer.dart';

class HISTORYScreen extends StatefulWidget {
  const HISTORYScreen({super.key});

  @override
  State<HISTORYScreen> createState() => _HISTORYScreenState();
}

class _HISTORYScreenState extends State<HISTORYScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      key: _key,
      drawer: DrawerScreen(),
      appBar: AppBar(
        title: Text(
          "HISTORY",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(18),
          ),
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            _key.currentState!.openDrawer();
          },
          child: Container(
              child: Image.asset(
            "assets/images/Group 16.png",
            scale: 4,
          )),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
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
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Get.toNamed("/NOTIFICATIONSScreen");
              },
              child: Container(
                child: Image.asset(
                  "assets/images/Group 1377.png",
                  scale: 4,
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                22.verticalSpace,
                Cont(),
                15.verticalSpace,
                Cont2(),
                15.verticalSpace,
                Cont(),
                15.verticalSpace,
                Cont2(),
                15.verticalSpace,
                Cont(),
                15.verticalSpace,
                Cont2(),
                15.verticalSpace,
                Cont(),
                15.verticalSpace,
                Cont2(),
                15.verticalSpace,
                Cont(),
                15.verticalSpace,
                Cont2(),
                50.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Cont() {
    return Container(
      width: 388.w,
      height: 97.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 15.w,
                  height: 21.h,
                  child: Image.asset("assets/images/Icon material-location-on.png"),
                ),
                10.horizontalSpace,
                Container(
                  child: Text(
                    "20 Cooper Square, New York",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
                60.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Container(
                    child: Text(
                      "28 min.ago",
                      style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                    ),
                  ),
                )
              ],
            ),
          ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  child: Image.asset("assets/images/Icon material-message.png"),
                ),
                10.horizontalSpace,
                Container(
                  width: 311.w,
                  height: 35.h,
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor exercitation.",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff010231)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Cont2() {
    return Container(
      width: 388.w,
      height: 85.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  width: 15.w,
                  height: 21.h,
                  child: Image.asset("assets/images/Icon material-location-on.png"),
                ),
                10.horizontalSpace,
                Container(
                  child: Text(
                    "20 Cooper Square, New York",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                ),
                60.horizontalSpace,
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Container(
                    child: Text(
                      "28 min.ago",
                      style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                    ),
                  ),
                )
              ],
            ),
          ),
          0.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 16.w,
                  height: 16.h,
                  child: Image.asset("assets/images/Icon awesome-image.png"),
                ),
                10.horizontalSpace,
                Container(
                  width: 311.w,
                  height: 35.h,
                  child: Text(
                    "(06) Photos Updated",
                    style: TextStyle(fontSize: 12.sp, color: Color(0xff010231)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
