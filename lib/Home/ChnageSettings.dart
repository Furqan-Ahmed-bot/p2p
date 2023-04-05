import '../export_all.dart';

class ChnageSETTINGSScreen extends StatefulWidget {
  const ChnageSETTINGSScreen({super.key});

  @override
  State<ChnageSETTINGSScreen> createState() => _ChnageSETTINGSScreenState();
}

class _ChnageSETTINGSScreenState extends State<ChnageSETTINGSScreen> {
  final existingPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SETTINGS",
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
      body: DisAllowIndicatorWidget(
        child: ListView(
          padding: EdgeInsets.all(20.r),
          children: [
            CustomTextFieldWidget2(
                hintText: 'Existing Passsword',
                controller: existingPasswordController),
            // TextField1("Existing Passsword"),
            15.verticalSpace,
            CustomTextFieldWidget2(
                hintText: 'New Password', controller: newPasswordController),
            15.verticalSpace,
            CustomTextFieldWidget2(
                hintText: 'Confirm New Password',
                controller: confirmPasswordController),
            50.verticalSpace,
            CustomButtonWidget(
                text: 'Change',
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                })
          ],
        ),
      ),
    );
  }

  TextField1(
    txt,
  ) {
    return Container(
      width: 388.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: Color(0xffEAEAEE),
        boxShadow: [
          BoxShadow(
            color: Color(0xff66708026).withOpacity(0.06),
            spreadRadius: 0,
            blurRadius: 2,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            left: 30,
          ),
          hintText: txt,
          // suffixIcon: Container(
          //   child: Image.asset(
          //     "assets/images/Icon ionic-md-eye-off.png",
          //     scale: 5,
          //   ),
          // ),
          hintStyle: TextStyle(color: Color(0xff878B9E), fontSize: 16.sp),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
