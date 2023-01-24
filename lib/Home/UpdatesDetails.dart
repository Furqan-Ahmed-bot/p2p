import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UPDATESDETAILSScreen extends StatefulWidget {
  const UPDATESDETAILSScreen({super.key});

  @override
  State<UPDATESDETAILSScreen> createState() => _UPDATESDETAILSStateScreen();
}

class _UPDATESDETAILSStateScreen extends State<UPDATESDETAILSScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 38),
        child: Row(
// mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
// Get.to(() => AddChildScreen());
              },
              child: Container(
                width: 388.w,
                height: 55.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30.r),
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
                    contentPadding: EdgeInsets.only(left: 25, top: 10),
                    labelText: "Type a message",
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelStyle: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff636365),
                      fontFamily: "Inter, Regular",
                    ),
                    suffixIcon: Container(
                      width: 130.h,
                      height: 30.w,
                      child: Row(
                        children: [
                          7.horizontalSpace,
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff00DBFA),
                              ),
                              child: Center(
                                child: Image.asset(
                                  "assets/images/Icon ionic-ios-send.png",
                                  scale: 3.5,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

// button second

// button third

// Add more buttons here
          ],
        ),
      ),
      resizeToAvoidBottomInset: true,
// resizeToAvoidBottomInset: true,

      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "UPDATES DETAILS",
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
                15.verticalSpace,
                MArtinSmit1("assets/images/1.png", "28 min. ago"),
                21.verticalSpace,
                Row(
                  children: [
                    Text(
                      "12 Comments",
                      style: TextStyle(color: Color(0xff010231)),
                    )
                  ],
                ),
                18.verticalSpace,
                Dividerr(),
                16.verticalSpace,
                MArtinSmit2("assets/images/1.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/2.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/3.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/4.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/5.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/1.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/2.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/3.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/4.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
                16.verticalSpace,
                MArtinSmit2("assets/images/5.png"),
                15.verticalSpace,
                Dividerr(),
                15.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  MArtinSmit1(
    Img,
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 154.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Color(0xffE7EFF2),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 5,
        //     blurRadius: 7,
        //     offset: Offset(0, 3), // changes position of shadow
        //   ),
        // ],
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
                  30.verticalSpace,
                  Text(
                    "John Smith",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  145.horizontalSpace,
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
                    padding: const EdgeInsets.only(bottom: 75),
                    child: Container(
                      child: Image.asset(
                        "assets/images/Icon-message.png",
                        scale: 5,
                      ),
                    ),
                  ),
                  11.horizontalSpace,
                  Container(
                    // width: 240.w,
                    // height: 50,
                    child: Container(
                      width: 270.w,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.",
                        style: TextStyle(fontSize: 12.sp, color: Color(0xff3A3A3A)),
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

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xffCECECE),
        ),
      ],
    );
  }

  MArtinSmit2(
    Img,
  ) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(bottom: 25),
                child: Container(
                  width: 47.w,
                  height: 47.h,
                  child: Image.asset(
                    Img,
                  ),
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
                Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Text(
                    "Martin Smith",
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                120.horizontalSpace,
                Text(
                  "28 min. ago",
                  style: TextStyle(fontSize: 10.sp, color: Color(0xff878B9E)),
                ),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Container(
                  // width: 240.w,
                  // height: 50,
                  child: Container(
                    width: 310.w,
                    height: 40.h,
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor exercitation.",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
