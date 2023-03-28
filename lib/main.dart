import 'dart:async';

import 'Home/Feeds.dart';
import 'Home/MartinProfile.dart';
import 'auth/forgot_password.dart';
import 'auth/prelogin_screen.dart';
import 'auth/reset_password_screen.dart';
import 'auth/signup_screen.dart';
import 'export_all.dart';

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
              name: '/Mymap',
              page: (() => Mymap()),
            ),
            GetPage(
              name: '/SplashScreen',
              page: (() => SplashScreen()),
            ),
            GetPage(
              name: '/PreLoginScreen',
              page: (() => PreLoginScreen()),
            ),
            GetPage(
              name: '/LoginScreen',
              page: (() => LoginScreen()),
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
            GetPage(
              name: '/SPOTIFYScreen',
              page: (() => SPOTIFYScreen()),
            ),
            GetPage(
              name: '/SettingsPaymentmethodsScreen',
              page: (() => SettingsPaymentmethodsScreen()),
            ),
            GetPage(
              name: '/FriendRequestsScreen',
              page: (() => FriendRequestsScreen()),
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
    Timer(Duration(seconds: 3), () => Get.toNamed('/PreLoginScreen'));
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
