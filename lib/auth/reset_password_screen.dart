import '../export_all.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool isChecked = false;
  bool isChecked2 = false;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: pageDecoration,
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
            "RESET PASSWORD",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: formKey,
          child: DisAllowIndicatorWidget(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 20.r),
              children: [
                78.verticalSpace,
                Image.asset(
                  "assets/images/Group 1370.png",
                  width: 184.r,
                  height: 66.r,
                ),
                119.verticalSpace,
                CustomTextFieldWidget(
                  isPassword: true,
                  labelText: "Password",
                  controller: passwordController,
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
                20.verticalSpace,
                CustomTextFieldWidget(
                    isPassword: true,
                    labelText: "Confirm New Password",
                    controller: confirmNewPasswordController,
                    validator: (txt) {
                      if (txt!.isEmpty) {
                        return "* Required";
                      } else if (txt.toString() !=
                          passwordController.text.toString()) {
                        return "* Please enter correct password";
                      } else
                        return null;
                    }),
                50.verticalSpace,
                CustomButtonWidget(
                    text: 'Reset',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        final Map<String, String> data = {
                          // "otpId": otpId,
                          "email": email.toString(),
                          "password": passwordController.text.trim(),
                          "deviceToken": deviceToken.toString(),
                          "deviceType": deviceType.toString()
                        };
                        ApiService().callResetPassword(context, data);
                        // Get.to(() => LoginScreen());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
