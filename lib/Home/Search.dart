import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SEARCHScreen extends StatefulWidget {
  const SEARCHScreen({super.key});

  @override
  State<SEARCHScreen> createState() => _SEARCHScreenState();
}

class _SEARCHScreenState extends State<SEARCHScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SEARCH",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(30),
        //   ),
        // ),
        elevation: 0,
        // leading: Container(
        //   child: Image.asset(
        //     "assets/images/Icon ionic-ios-arrow-round-back.png",
        //     scale: 5,
        //   ),
        // ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 18.w,
              height: 18.h,
              child: Image.asset("assets/images/Icon ionic-ios-close.png"),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black,
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
                20.verticalSpace,
                TextField("Search here"),
                33.verticalSpace,
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
    return Row(
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
              style: TextStyle(fontSize: 18.sp, color: Color(0xffFFFFFF)),
            ),
            Text(
              "New York",
              style: TextStyle(fontSize: 14.sp, color: Color(0xffFFFFFF)),
            ),
          ],
        ),
        151.horizontalSpace,
        Container(
          height: 26.h,
          width: 26.w,
          child: Image.asset(
            "assets/images/Group 1683.png",
          ),
        ),
      ],
    );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff707070),
        ),
      ],
    );
  }

  TextField(
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 51.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xff707070), width: 2.sp),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30),
          hintText: txt,
          hintStyle: TextStyle(color: Color(0xff010231).withOpacity(0.2), fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
