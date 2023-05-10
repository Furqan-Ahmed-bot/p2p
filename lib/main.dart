import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:p2ptraffic/home/feeds_screen.dart';

import 'home/MartinProfile.dart';

import 'export_all.dart';
import 'home/edit_profile_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          home: SplashScreen(),
          // initialRoute: '/SplashScreen',
          getPages: [
            // GetPage(
            //   name: '/Mymap',
            //   page: (() => Mymap()),
            // ),
            // GetPage(
            //   name: '/SplashScreen',
            //   page: (() => SplashScreen()),
            // ),
            // GetPage(
            //   name: '/PreLoginScreen',
            //   page: (() => PreLoginScreen()),
            // ),
            // GetPage(
            //   name: '/LoginScreen',
            //   page: (() => LoginScreen()),
            // ),
            // GetPage(
            //   name: '/SignupScreen',
            //   page: (() => SignupScreen()),
            // ),
            // GetPage(
            //   name: '/FORGOTPASSWORDScreen',
            //   page: (() => FORGOTPASSWORDScreen()),
            // ),
            // GetPage(
            //   name: '/VerificationScreen',
            //   page: (() => VerificationScreen()),
            // ),
            // GetPage(
            //   name: '/ResetPasswordScreen',
            //   page: (() => ResetPasswordScreen()),
            // ),
            // GetPage(
            //   name: '/CreateProfileScreen',
            //   page: (() => CreateProfileScreen()),
            // ),
            // GetPage(
            //   name: '/SETTINGSScreen',
            //   page: (() => SETTINGSScreen()),
            // ),
            // GetPage(
            //   name: '/CHECKOUTScreen',
            //   page: (() => CheckoutScreen()),
            // ),
            // GetPage(
            //   name: '/NOTIFICATIONSScreen',
            //   page: (() => NOTIFICATIONSScreen()),
            // ),
            // GetPage(
            //   name: '/TRAFFICUPDATESScreen',
            //   page: (() => TRAFFICUPDATESScreen()),
            // ),
            // GetPage(
            //   name: '/UPDATESDETAILSScreen',
            //   page: (() => UPDATESDETAILSScreen()),
            // ),
            // GetPage(
            //   name: '/TERMSAndCONDITIONSScreen',
            //   page: (() => TERMSAndCONDITIONSScreen()),
            // ),
            // GetPage(
            //   name: '/PRIVACYPOLICYScreen',
            //   page: (() => PRIVACYPOLICYScreen()),
            // ),
            // GetPage(
            //   name: '/FRIENDSScreen',
            //   page: (() => FriendsScreen()),
            // ),
            // GetPage(
            //   name: '/SEARCHScreen',
            //   page: (() => SearchScreen()),
            // ),
            // GetPage(
            //   name: '/SubscritionScreen',
            //   page: (() => SubscritionScreen()),
            // ),
            // GetPage(
            //   name: '/ChnageSETTINGSScreen',
            //   page: (() => ChangeSettingScreen()),
            // ),
            // GetPage(
            //   name: '/PROFILE2Screen',
            //   page: (() => PROFILE2Screen()),
            // ),
            // GetPage(
            //   name: '/HomeScreen',
            //   page: (() => HomeScreen()),
            // ),
            // GetPage(
            //   name: '/MainScreen',
            //   page: (() => MainScreen()),
            // ),
            // GetPage(
            //   name: '/HISTORYScreen',
            //   page: (() => HistoryScreen()),
            // ),
            // GetPage(
            //   name: '/DrawerScreen',
            //   page: (() => DrawerScreen()),
            // ),
            // GetPage(
            //   name: '/FEEDSScreen',
            //   page: (() => FeedsScreen()),
            // ),
            // GetPage(
            //   name: '/FeedUPDATESDETAILSScreen',
            //   page: (() => FeedUpdateDetailsScreen()),
            // ),
            // GetPage(
            //   name: '/MartinProfileScreen',
            //   page: (() => MartinProfileScreen()),
            // ),
            // GetPage(
            //   name: '/DrawerProfileScreen',
            //   page: (() => DrawerProfileScreen()),
            // ),
            // GetPage(
            //   name: '/EditProfileScreen',
            //   page: (() => EditProfileScreen()),
            // ),
            // GetPage(
            //   name: '/SubscritionPackageCardScreen',
            //   page: (() => SubscritionPackageCardScreen()),
            // ),
            // GetPage(
            //   name: '/PayNowScreen',
            //   page: (() => PayNowScreen()),
            // ),
            // GetPage(
            //   name: '/PAYMENTMETHODDScreen',
            //   page: (() => PAYMENTMETHODDScreen()),
            // ),
            // GetPage(
            //   name: '/SHARELIVELOCATIONsCREEN',
            //   page: (() => ShareLiveLocationScreen()),
            // ),
            // GetPage(
            //   name: '/POSTScreen',
            //   page: (() => POSTScreen()),
            // ),
            // GetPage(
            //   name: '/CamScreen',
            //   page: (() => CamScreen()),
            // ),
            // GetPage(
            //   name: '/SPOTIFYScreen',
            //   page: (() => SpotifScreen()),
            // ),
            // GetPage(
            //   name: '/FriendRequestsScreen',
            //   page: (() => FriendRequestsScreen()),
            // ),
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
    _getCurrentPosition();
    FirebaseMessaging _firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((token) {
      deviceToken = token!;
      log('DEVICE TOKEN: $deviceToken');
    });
    if (Platform.isAndroid) {
      deviceType = "android";
    } else if (Platform.isIOS) {
      deviceType = "ios";
    }
    deviceToken = "abcdedf";
    Timer(Duration(seconds: 3), () => Get.toNamed('/PreLoginScreen'));
    super.initState();
  }

  Position? _currentPosition;

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        latitude = _currentPosition?.latitude;
        longitude = _currentPosition?.longitude;
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
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
