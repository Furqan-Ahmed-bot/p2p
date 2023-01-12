import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class VERIFICATIONScreen extends StatefulWidget {
  const VERIFICATIONScreen({super.key});

  @override
  State<VERIFICATIONScreen> createState() => _VERIFICATIONScreenState();
}

class _VERIFICATIONScreenState extends State<VERIFICATIONScreen> {
  CountDownController _CountDownController = CountDownController();
  void initState() {
// TODO: implement initState
    super.initState();
    _CountDownController = CountDownController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Mask Group 3.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "VERIFICATION",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  78.verticalSpace,
                  Container(
                    width: 184.w,
                    height: 66.h,
                    child: Image.asset("assets/images/Group 1370.png"),
                  ),
                  119.verticalSpace,
                  Container(
                    width: 346.w,
                    height: 75.h,
                    child: Text(
                      textAlign: TextAlign.center,
                      "We have sent you an email containing 6 digits verification code. Please enter the code to verify your identity",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  40.verticalSpace,
                  Container(
                    width: 346,
                    height: 56.h,
                    decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.1),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                        ),
                    child: OTPTextField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      // controller: otpController,
                      otpFieldStyle: OtpFieldStyle(
                          disabledBorderColor: Color(0xff1CC8FB),
                          focusBorderColor: Color(0xff1CC8FB),
                          borderColor: Color(0xff1CC8FB),
                          enabledBorderColor: Color(0xff1CC8FB),
                          backgroundColor: Colors.white,
                          errorBorderColor: Colors.blue),

                      // obscureText: true,
                      length: 6,
                      // width: Get.width * 0.5,

                      fieldWidth: 49.w,

                      style: TextStyle(
                        fontSize: 28,
                      ),
                      textFieldAlignment: MainAxisAlignment.spaceBetween,
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                    ),
                  ),
                  // 60.verticalSpace,
                  // 155.verticalSpace,
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.toNamed("/RESETPASSWORDScreen");
                  //   },
                  //   child: Container(
                  //     child: Image.asset(
                  //       "assets/images/Component.png",
                  //       scale: 5,
                  //     ),
                  //   ),
                  // ),
                  // 105.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/RESETPASSWORDScreen");
                    },
                    child: CircularCountDownTimer(
                      duration: 60,
                      initialDuration: 0,
                      controller: _CountDownController,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 3,
                      ringColor: Colors.transparent,
                      ringGradient: null,
                      fillColor: Color(0xff21CDFB),

                      // fillGradient: LinearGradient(colors: [Color(0xff21CDFB), Color(0xff010118)]),
                      backgroundGradient: LinearGradient(colors: [Color(0xff21CDFB), Color(0xff004DF2)]),
                      strokeWidth: 5.0,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(fontSize: 15.0, color: Colors.white, fontWeight: FontWeight.bold),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverse: false,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: true,
                      onStart: () {
                        print('Countdown Started');
                      },
                      onComplete: () {
                        setState(() {
                          // resend = 1;
                        });
                      },
                    ),
                  ),
                  Text(
                    "data",
                    style: TextStyle(color: Colors.white),
                  ),
                  Container(
                    child: Center(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(text: 'Code didnt received? ', style: TextStyle(color: Colors.white, fontSize: 14)),
                            TextSpan(
                                text: 'Resend',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.white,
                                  // decoration: TextDecoration.underline,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
