import 'dart:async';

import 'Home/Feeds.dart';
import 'Home/MartinProfile.dart';

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
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
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
              name: '/SignupScreen',
              page: (() => SignupScreen()),
            ),
            GetPage(
              name: '/FORGOTPASSWORDScreen',
              page: (() => FORGOTPASSWORDScreen()),
            ),
            GetPage(
              name: '/VerificationScreen',
              page: (() => VerificationScreen()),
            ),
            GetPage(
              name: '/ResetPasswordScreen',
              page: (() => ResetPasswordScreen()),
            ),
            GetPage(
              name: '/CreateProfileScreen',
              page: (() => CreateProfileScreen()),
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
              page: (() => SearchScreen()),
            ),
            GetPage(
              name: '/SubscritionScreen',
              page: (() => SubscritionScreen()),
            ),
            
            GetPage(
              name: '/ChnageSETTINGSScreen',
              page: (() => ChnageSETTINGSScreen()),
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
              page: (() => HistoryScreen()),
            ),
            GetPage(
              name: '/DrawerScreen',
              page: (() => DrawerScreen()),
            ),
            GetPage(
              name: '/FEEDSScreen',
              page: (() => FeedsScreen()),
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
              name: '/SubscritionPackageCardScreen',
              page: (() => SubscritionPackageCardScreen()),
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
              page: (() => ShareLiveLocationScreen()),
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
              page: (() => SpotifScreen()),
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
