import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NOTIFICATIONSScreen extends StatefulWidget {
  const NOTIFICATIONSScreen({super.key});

  @override
  State<NOTIFICATIONSScreen> createState() => _NOTIFICATIONSScreenState();
}

class _NOTIFICATIONSScreenState extends State<NOTIFICATIONSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "NOTIFICATIONS",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 0,
        leading: Container(
          child: Image.asset(
            "assets/images/Icon ionic-ios-arrow-round-back.png",
            scale: 5,
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Notificationss(),
                Notificationss(),
                Notificationss(),
                Notificationss(),
                Notificationss(),
                Notificationss(),
                Notificationss(),
                Notificationss(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff3A3A3A).withOpacity(0.2),
        ),
      ],
    );
  }

  Notificationss() {
    return Column(
      children: [
        17.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Lorem ipsum dolor sit amet",
              style: TextStyle(color: Color(0xff010231), fontSize: 16.sp),
            ),
            Text(
              "16 min. ago",
              style: TextStyle(color: Color(0xff3A3A3A).withOpacity(0.6), fontSize: 11.sp),
            ),
          ],
        ),
        9.verticalSpace,
        Container(
          width: 386.w,
          height: 70.h,
          child: Text(
            textAlign: TextAlign.left,
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xff3A3A3A).withOpacity(0.6),
            ),
          ),
        ),
        9.5.verticalSpace,
        Dividerr(),
      ],
    );
  }
}
