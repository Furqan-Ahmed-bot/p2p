import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TRAFFICUPDATESScreen extends StatefulWidget {
  const TRAFFICUPDATESScreen({super.key});

  @override
  State<TRAFFICUPDATESScreen> createState() => _TRAFFICUPDATESStateScreen();
}

class _TRAFFICUPDATESStateScreen extends State<TRAFFICUPDATESScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "TRAFFIC UPDATES",
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              27.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "Location",
                      style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              17.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/Icon material-location-on.png",
                      scale: 5,
                    ),
                  ),
                  Text(
                    "20 Cooper Square, New York",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  Container(
                    width: 77.w,
                    height: 29.h,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8F1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "View Map",
                        style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ),
              26.verticalSpace,
              Dividerr(),
              18.verticalSpace,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      "Updates",
                      style: TextStyle(color: Colors.black, fontSize: 22.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              19.verticalSpace,
              MArtinSmit1("assets/images/1.png", "16 min. ago"),
              15.verticalSpace,
              Martin2("assets/images/2.png", "30 min. ago"),
              15.verticalSpace,
              MArtinSmit1("assets/images/3.png", "17 min. ago"),
              15.verticalSpace,
              Martin2("assets/images/4.png", "28 min. ago"),
              15.verticalSpace,
              Martin2("assets/images/5.png", "30 min. ago"),
            ],
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
          color: Color(0xff333333),
        ),
      ],
    );
  }

  MArtinSmit1(
    Img,
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 97.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Container(
                  width: 47.w,
                  height: 47.h,
                  child: Image.asset(
                    Img,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  10.verticalSpace,
                  Text(
                    "Martin Smith",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  130.horizontalSpace,
                  Text(
                    txt,
                    style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      child: Image.asset(
                        "assets/images/Icon material-message.png",
                        scale: 5,
                      ),
                    ),
                  ),
                  11.horizontalSpace,
                  Container(
                    // width: 240.w,
                    // height: 50,
                    child: Container(
                      width: 240.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet...",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Martin2(
    img,
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 85.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.verticalSpace,
                Container(
                  width: 47.w,
                  height: 47.h,
                  child: Image.asset(
                    img,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  10.verticalSpace,
                  Text(
                    "Martin Smith",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  130.horizontalSpace,
                  Text(
                    txt,
                    style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                  ),
                ],
              ),
              10.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/Icon awesome-image.png",
                      scale: 5,
                    ),
                  ),
                  11.horizontalSpace,
                  Container(
                    // width: 240.w,
                    // height: 50,
                    child: Container(
                      child: Text(
                        "(06) Photos Updated",
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
