import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
