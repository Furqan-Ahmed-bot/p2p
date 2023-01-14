import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:p2ptraffic/Home/BottomController.dart';
import 'package:p2ptraffic/Home/Navbar.dart';

class PayNowScreen extends StatefulWidget {
  const PayNowScreen({super.key});

  @override
  State<PayNowScreen> createState() => _PayNowStateScreen();
}

class _PayNowStateScreen extends State<PayNowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              300.verticalSpace,
              Container(
                width: 126.w,
                height: 126.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFFFFFF),
                ),
                child: Image.asset(
                  "assets/images/Icon awesome-thumbs-up.png",
                  scale: 4,
                ),
              ),
              23.verticalSpace,
              Container(
                width: 200.w,
                height: 43.h,
                child: Text(
                  "Thank you!",
                  style: TextStyle(
                    fontSize: 30.sp,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              14.verticalSpace,
              Container(
                child: Text(
                  "You have successfully subscribe",
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Color(0xffFFFFFF),
                  ),
                ),
              ),
              40.verticalSpace,
              GestureDetector(
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                },
                child: Container(
                  width: 192.w,
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
                          "Go Back",
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
    );
  }
}
