import 'package:flutter/cupertino.dart';

import 'package:p2ptraffic/export_all.dart';

class SETTINGSScreen extends StatefulWidget {
  const SETTINGSScreen({super.key});

  @override
  State<SETTINGSScreen> createState() => _SETTINGSScreenState();
}

class _SETTINGSScreenState extends State<SETTINGSScreen> {
  var switchnot = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SETTINGS",
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
      body: DisAllowIndicatorWidget(
        child: ListView(
          padding: EdgeInsets.all(20.r),
          children: [
            20.verticalSpace,
            Cupertino(),
            10.verticalSpace,
            Drop("Changes Password", "assets/images/Icon ionic-ios-lock.png",
                () {
              Get.toNamed("/ChnageSETTINGSScreen");
            }),
            10.verticalSpace,
            Drop("Card Details", "assets/images/Icon metro-credit-card.png",
                () {
              Get.to(() => PaymentMethodScreen(payButtonText: 'Save'));
            }),
            10.verticalSpace,
            Drop("Terms & Conditions", "assets/images/Group 976.png", () {
              Get.toNamed("/TERMSAndCONDITIONSScreen");
            }),
            10.verticalSpace,
            Drop("Privacy Policy", "assets/images/Group 977.png", () {
              Get.toNamed("/PRIVACYPOLICYScreen");
            }),
          ],
        ),
      ),
    );
  }

  Cupertino() {
    return Container(
      padding: EdgeInsets.only(left: 20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        border: Border.all(color: Color(0xffD5DEEB), width: 1.sp),
        borderRadius: BorderRadius.circular(15.r),
      ),
      height: 56.h,
      child: Row(
        children: [
          Container(
            child: Image.asset(
              "assets/images/Icon ionic-ios-notifications.png",
              scale: 5,
            ),
          ),
          20.horizontalSpace,
          Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal),
          ),
          Spacer(),
          Transform.scale(
            scale: 0.5,
            child: CupertinoSwitch(
              activeColor: Color(0xffAAEC09),
              onChanged: (value) {
                setState(() {
                  switchnot = value;
                });
              },
              value: switchnot,
            ),
          )
        ],
      ),
    );
  }

  Drop(
    txt,
    Img,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.only(left: 20.r),
          height: 56.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            border: Border.all(color: Color(0xffD5DEEB), width: 1.sp),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            children: [
              Container(
                child: Image.asset(
                  Img,
                  scale: 5,
                ),
              ),
              20.horizontalSpace,
              Text(
                txt,
              ),
            ],
          )),
    );
  }
}
