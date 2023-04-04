import 'package:flutter/cupertino.dart';
import 'package:p2ptraffic/export_all.dart';

class PAYMENTMETHODDScreen extends StatefulWidget {
  const PAYMENTMETHODDScreen({super.key});

  @override
  State<PAYMENTMETHODDScreen> createState() => _PAYMENTMETHODStateDScreen();
}

class _PAYMENTMETHODStateDScreen extends State<PAYMENTMETHODDScreen> {
  var switchnot = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "PAYMENT METHOD",
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.r),
        child: CustomButtonWidget(text: 'Add Card', onTap: () => Get.close(1)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          TextField("Card Holder Name"),
          10.verticalSpace,
          TextField("Card Number"),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Exp Date",
                        style: TextStyle(color: Color(0xff878B9E)),
                      ),
                    ),
                    5.verticalSpace,
                    sTextField("10 / 25"),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "CVV",
                        style: TextStyle(color: Color(0xff878B9E)),
                      ),
                    ),
                    5.verticalSpace,
                    sTextField(""),
                  ],
                ),
              ),
            ],
          ),
          30.verticalSpace,
          Cupertino(),
        ],
      ),
    );
  }

  TextField(
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 73.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 0, 0, 0.06),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 1),
          contentPadding: EdgeInsets.only(top: 25, bottom: 10, left: 20),
          hintText: txt,
          // label: Text(
          //   txt2,
          //   style: TextStyle(color: Color(0xffA2A5B7), fontSize: 12.sp),
          // ),
          // prefixIcon: Container(
          //   width: 30,
          //   child: Image.asset(
          //     img,
          //     scale: 5,
          //   ),
          // ),
          hintStyle: TextStyle(color: Color(0xff878B9E), fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Cupertino() {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.2),
      //       spreadRadius: 5,
      //       blurRadius: 7,
      //       offset: Offset(0, 3), // changes position of shadow
      //     ),
      //   ],
      //   border: Border.all(color: Color(0xff283891), width: 1.sp),
      //   borderRadius: BorderRadius.circular(15.r),
      // ),
      width: 378.w,
      height: 53.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Save card details",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.normal),
            ),
            Transform.scale(
              scale: 0.7,
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
      ),
    );
  }

  sTextField(
    txt,
  ) {
    return Container(
      height: 57.h,
      // width: Get.width * 0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(255, 0, 0, 0.06),
            spreadRadius: 0,
            blurRadius: 7,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.only(left: 1),
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 60),
          hintText: txt,
          // label: Text(
          //   txt2,
          //   style: TextStyle(color: Color(0xffA2A5B7), fontSize: 12.sp),
          // ),
          // prefixIcon: Container(
          //   width: 30,
          //   child: Image.asset(
          //     img,
          //     scale: 5,
          //   ),
          // ),
          hintStyle: TextStyle(color: Color(0xff878B9E), fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Names(
    txt,
  ) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
            ),
          ),
        )
      ],
    );
  }
}
