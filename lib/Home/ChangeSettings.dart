import '../export_all.dart';

class ChangeSettingScreen extends StatefulWidget {
  const ChangeSettingScreen({super.key});

  @override
  State<ChangeSettingScreen> createState() => _ChangeSettingScreenState();
}

class _ChangeSettingScreenState extends State<ChangeSettingScreen> {
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

  
}
