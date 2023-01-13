import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SUBSCRIBEScreen extends StatefulWidget {
  const SUBSCRIBEScreen({super.key});

  @override
  State<SUBSCRIBEScreen> createState() => _SUBSCRIBEScreenState();
}

class _SUBSCRIBEScreenState extends State<SUBSCRIBEScreen> {
  var subs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SUBSCRIBE",
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
                GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    // Note: Sensitivity is integer used when you don't want to mess up vertical drag
                    int sensitivity = 8;
                    if (details.delta.dx > sensitivity) {
                      setState(() {
                        subs = 1;
                      });
                      print("object");
                      // Right Swipe
                    } else if (details.delta.dx < -sensitivity) {
                      setState(() {
                        subs = 2;
                      });
                      //Left Swipe
                    }
                  },
                  child: Container(
                    height: 550.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 400.h,
                          width: 400.h,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(17.r), color: Color(0xffC6C8D2).withOpacity(0.56)),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          left: 20,
                          child: Container(
                            height: 490.h,
                            width: 322.w,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: Colors.white, width: 0.5.w),
                                borderRadius: BorderRadius.circular(17.r),
                                color: Color(0xffFFFFFF)),
                            child: Container(
                              width: 322.w,
                              height: 427.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(17.r), color: Color(0xffFFFFFF)),
                              child: ListView(children: [
                                Container(
                                  width: 322.w,
                                  height: 93.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(17.r),
                                      topRight: Radius.circular(17.r),
                                    ),
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      // end: Alignment.bottomCenter,
                                      colors: [Color(0xff004DF2), Color(0xff21CDFB)],
                                    ),
                                  ),
                                  child: Center(
                                    child: subs == 1
                                        ? Text(
                                            "Gold Package",
                                            style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w500),
                                          )
                                        : Text(
                                            "Gold Package",
                                            style: TextStyle(color: Colors.white, fontSize: 30.sp, fontWeight: FontWeight.w500),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color(0xff707070),
                                        size: 20,
                                      )),
                                  SizedBox(
                                    width: 14.h,
                                  ),
                                  Container(
                                    width: 250.w,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color(0xff707070),
                                        size: 20,
                                      )),
                                  SizedBox(
                                    width: 14.h,
                                  ),
                                  Container(
                                    width: 250.w,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed .",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Row(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 0),
                                      child: Icon(
                                        Icons.check,
                                        color: Color(0xff707070),
                                        size: 20,
                                      )),
                                  SizedBox(
                                    width: 14.h,
                                  ),
                                  Container(
                                    width: 250.w,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                                    ),
                                  ),
                                ]),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 13),
                                          child: RichText(
                                            text: TextSpan(
                                              text: "\$",
                                              style: TextStyle(fontSize: 25.sp, color: Color(0xff004DF2)),
                                            ),
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                              text: "",
                                              style: TextStyle(fontSize: 25.sp, color: Colors.black),
                                              children: subs == 1
                                                  ? <TextSpan>[
                                                      TextSpan(
                                                          text: '9.99',
                                                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 70, color: Color(0xff878B9E))),
                                                      // TextSpan(text: '.00', style: TextStyle(color: Colors.black, fontSize: 25.sp)),
                                                    ]
                                                  : <TextSpan>[
                                                      TextSpan(
                                                          text: '24',
                                                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 70, color: Color(0xff878B9E))),
                                                      TextSpan(text: '.00', style: TextStyle(color: Colors.black, fontSize: 25.sp)),
                                                    ]),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Text(
                                        "6 Months",
                                        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 53.w,
                          height: 9.h,
                          decoration: BoxDecoration(color: Color(0xff004DF2), borderRadius: BorderRadius.circular(10)),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          size: 10,
                          color: Color(0xff010231),
                        ),
                        Icon(
                          Icons.circle_outlined,
                          size: 10,
                          color: Color(0xff010231),
                        )
                      ],
                    ),
                  ],
                ),
                180.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/CHECKOUTScreen");
                  },
                  // onTap: () {
                  //   final bottomcontroller = Get.put(BottomController());
                  //   bottomcontroller.navBarChange(0);
                  //   Get.to(() => MainScreen());
                  // },
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
                            "Subscribe",
                            style: TextStyle(color: Colors.white, fontSize: 18.sp),
                          ),
                        ],
                      ),
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
}
