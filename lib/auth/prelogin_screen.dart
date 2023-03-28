
import '../export_all.dart';

class PreLoginScreen extends StatefulWidget {
  const PreLoginScreen({super.key});

  @override
  State<PreLoginScreen> createState() => _PRELOGINStateScreen();
}

class _PRELOGINStateScreen extends State<PreLoginScreen> {
  @override
  Widget build(BuildContext context) {
    final List preloginOptionList = [
      {
        'text': "Login with Username",
        'icon': '${imagePath}/Icon material-email.svg',
        'color': Color(0xffEB6C0D),
        'route': () => function1(context)
      },
      {
        'text': "Login with Facebook",
        'icon': '${imagePath}/Icon ionic-logo-facebook.svg',
        'color': Color(0xff3155B8),
        'route': () {
          final bottomcontroller = Get.put(BottomController());
          bottomcontroller.navBarChange(0);
          Get.to(() => MainScreen());
        }
      },
      {
        'text': "Login with Google",
        'icon': '${imagePath}/Icon ionic-logo-google.svg',
        'color': Color(0xffCB1D1D),
        'route': () {
          final bottomcontroller = Get.put(BottomController());
          bottomcontroller.navBarChange(0);
          Get.to(() => MainScreen());
        }
      },
      {
        'text': "Login with Apple",
        'icon': '${imagePath}/Icon metro-apple.svg',
        'color': Color(0xff000000),
        'route': () {
          final bottomcontroller = Get.put(BottomController());
          bottomcontroller.navBarChange(0);
          Get.to(() => MainScreen());
        }
      },
    ];
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: pageDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Text(
            "PRE LOGIN",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 30.r),
          child: GestureDetector(
            onTap: () {
              Get.toNamed('/SignupScreen');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Dont have an account? ',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                      TextSpan(
                          text: 'Signup',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 40.r),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            78.verticalSpace,
            Container(
              width: 184.w,
              height: 66.h,
              child: Image.asset("assets/images/Group 1370.png"),
            ),
            119.verticalSpace,
            ListView.separated(
              itemBuilder: (context, index) => PreLoginButtonWidget(
                text: preloginOptionList[index]['text'],
                color: preloginOptionList[index]['color'],
                iconPath: preloginOptionList[index]['icon'],
                onTap: preloginOptionList[index]['route'],
              ),
              separatorBuilder: (context, index) => 15.verticalSpace,
              itemCount: preloginOptionList.length,
              shrinkWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
