import 'package:flutter/material.dart';
import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:p2ptraffic/Home/Camera.dart';
import 'package:p2ptraffic/Home/CheckOut.dart';
import 'package:p2ptraffic/Home/ChnageSettings.dart';
import 'package:p2ptraffic/Home/DrawerProfile.dart';
import 'package:p2ptraffic/Home/FeedUpdatesDetails.dart';
import 'package:p2ptraffic/Home/Feeds.dart';

import 'package:p2ptraffic/Home/Friends.dart';
import 'package:p2ptraffic/Home/HELP&FEEDBACK.dart';
import 'package:p2ptraffic/Home/History.dart';
import 'package:p2ptraffic/Home/MartinProfile.dart';
import 'package:p2ptraffic/Home/Navbar.dart';
import 'package:p2ptraffic/Home/Notifications.dart';
import 'package:p2ptraffic/Home/POST.dart';
import 'package:p2ptraffic/Home/PayNow.dart';
import 'package:p2ptraffic/Home/PaymentMethod.dart';
import 'package:p2ptraffic/Home/Paymentmethhod.dart';
import 'package:p2ptraffic/Home/PrivacyPolicy.dart';
import 'package:p2ptraffic/Home/Profile.dart';
import 'package:p2ptraffic/Home/SHARELIVELOCATION.dart';
import 'package:p2ptraffic/Home/Search.dart';
import 'package:p2ptraffic/Home/Setting.dart';
import 'package:p2ptraffic/Home/Subscribe.dart';
import 'package:p2ptraffic/Home/Subscribtions.dart';
import 'package:p2ptraffic/Home/Terms&Conditions.dart';
import 'package:p2ptraffic/Home/TrafficUpdates.dart';
import 'package:p2ptraffic/Home/UpdatesDetails.dart';
import 'package:p2ptraffic/Home/homeS.dart';
import 'package:p2ptraffic/auth/CreateProfile.dart';
import 'package:p2ptraffic/auth/ForgotPassword.dart';
import 'package:p2ptraffic/auth/Login.dart';
import 'package:p2ptraffic/auth/PreLogin.dart';
import 'package:p2ptraffic/auth/ResetPassword.dart';
import 'package:p2ptraffic/auth/Signup.dart';
import 'package:p2ptraffic/auth/Verification.dart';
import 'package:p2ptraffic/auth/VerificationSignup.dart';

import 'Home/EditProfile.dart';
import 'Home/drawer.dart';
import 'Home/mymap.dart';

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
          initialRoute: '/MainScreen',
          getPages: [
            GetPage(
              name: '/Mymap',
              page: (() => Mymap()),
            ),
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
            GetPage(
              name: '/RESETPASSWORDScreen',
              page: (() => RESETPASSWORDScreen()),
            ),
            GetPage(
              name: '/CREATEPROFILEScreen',
              page: (() => CREATEPROFILEScreen()),
            ),
            GetPage(
              name: '/SETTINGSScreen',
              page: (() => SETTINGSScreen()),
            ),
            GetPage(
              name: '/CHECKOUTScreen',
              page: (() => CHECKOUTScreen()),
            ),
            GetPage(
              name: '/NOTIFICATIONSScreen',
              page: (() => NOTIFICATIONSScreen()),
            ),
            GetPage(
              name: '/TRAFFICUPDATESScreen',
              page: (() => TRAFFICUPDATESScreen()),
            ),
            GetPage(
              name: '/UPDATESDETAILSScreen',
              page: (() => UPDATESDETAILSScreen()),
            ),
            GetPage(
              name: '/TERMSAndCONDITIONSScreen',
              page: (() => TERMSAndCONDITIONSScreen()),
            ),
            GetPage(
              name: '/PRIVACYPOLICYScreen',
              page: (() => PRIVACYPOLICYScreen()),
            ),
            GetPage(
              name: '/FRIENDSScreen',
              page: (() => FRIENDSScreen()),
            ),
            GetPage(
              name: '/SEARCHScreen',
              page: (() => SEARCHScreen()),
            ),
            GetPage(
              name: '/SUBSCRIPTIONScreen',
              page: (() => SUBSCRIPTIONScreen()),
            ),
            GetPage(
              name: '/PAYMENTMETHODScreen',
              page: (() => PAYMENTMETHODScreen()),
            ),
            GetPage(
              name: '/ChnageSETTINGSScreen',
              page: (() => ChnageSETTINGSScreen()),
            ),
            GetPage(
              name: '/HELPAndFEEDBACKScreen',
              page: (() => HELPAndFEEDBACKScreen()),
            ),
            GetPage(
              name: '/PROFILE2Screen',
              page: (() => PROFILE2Screen()),
            ),
            GetPage(
              name: '/HomeScreen',
              page: (() => HomeScreen()),
            ),
            GetPage(
              name: '/MainScreen',
              page: (() => MainScreen()),
            ),
            GetPage(
              name: '/HISTORYScreen',
              page: (() => HISTORYScreen()),
            ),
            GetPage(
              name: '/DrawerScreen',
              page: (() => DrawerScreen()),
            ),
            GetPage(
              name: '/FEEDSScreen',
              page: (() => FEEDSScreen()),
            ),
            GetPage(
              name: '/FeedUPDATESDETAILSScreen',
              page: (() => FeedUPDATESDETAILSScreen()),
            ),
            GetPage(
              name: '/MartinProfileScreen',
              page: (() => MartinProfileScreen()),
            ),
            GetPage(
              name: '/DrawerProfileScreen',
              page: (() => DrawerProfileScreen()),
            ),
            GetPage(
              name: '/EditProfileScreen',
              page: (() => EditProfileScreen()),
            ),
            GetPage(
              name: '/SUBSCRIBEScreen',
              page: (() => SUBSCRIBEScreen()),
            ),
            GetPage(
              name: '/PayNowScreen',
              page: (() => PayNowScreen()),
            ),
            GetPage(
              name: '/PAYMENTMETHODDScreen',
              page: (() => PAYMENTMETHODDScreen()),
            ),
            GetPage(
              name: '/SHARELIVELOCATIONsCREEN',
              page: (() => SHARELIVELOCATIONsCREEN()),
            ),
            GetPage(
              name: '/POSTScreen',
              page: (() => POSTScreen()),
            ),
            GetPage(
              name: '/CamScreen',
              page: (() => CamScreen()),
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
