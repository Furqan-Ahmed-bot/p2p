import 'dart:async';

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2ptraffic/auth/ForgotPassword.dart';
import 'package:p2ptraffic/auth/Login.dart';
import 'package:p2ptraffic/auth/PreLogin.dart';
import 'package:p2ptraffic/auth/ResetPassword.dart';
import 'package:p2ptraffic/auth/Signup.dart';
import 'package:p2ptraffic/auth/Verification.dart';
import 'package:p2ptraffic/auth/VerificationSignup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          ),
          debugShowCheckedModeBanner: false,
          // home: SplashScreen(),
          initialRoute: '/SplashScreen',
          getPages: [
            GetPage(
              name: '/SplashScreen',
              page: (() => SplashScreen()),
            ),
            GetPage(
              name: '/PRELOGINScreen',
              page: (() => PRELOGINScreen()),
            ),
            GetPage(
              name: '/LOGINScreen',
              page: (() => LOGINScreen()),
            ),
            GetPage(
              name: '/SIGNUPScreen',
              page: (() => SIGNUPScreen()),
            ),
            GetPage(
              name: '/FORGOTPASSWORDScreen',
              page: (() => FORGOTPASSWORDScreen()),
            ),
            GetPage(
              name: '/VERIFICATIONScreen',
              page: (() => VERIFICATIONScreen()),
            ),
            GetPage(
              name: '/VERIFICATIONSignupScreen',
              page: (() => VERIFICATIONSignupScreen()),
            ),
          ],
        );
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.toNamed('/PRELOGINScreen'));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed("/SocialLoginScreen");
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/Mask Group 3.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: Container(
                    width: 202.w,
                    height: 73.h,
                    child: Image.asset("assets/images/Group 1370.png"),
                  ),
                ),
              ),

              // Container(
              //   child: Image.asset(
              //     "assets/images/Mask Group 17@3x.png",
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
