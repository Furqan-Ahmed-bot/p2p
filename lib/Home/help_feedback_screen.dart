import '../export_all.dart';

class HelpAndFeedbackScreen extends StatefulWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  State<HelpAndFeedbackScreen> createState() => HelpAndFeedbackScreenState();
}

class HelpAndFeedbackScreenState extends State<HelpAndFeedbackScreen> {
  final TextEditingController subjectTextController = TextEditingController();
  final TextEditingController messageTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "HELP & FEEDBACK",
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
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          CustomTextFieldWidget2(
              hintText: 'Subject', controller: subjectTextController),
          17.verticalSpace,
          CustomTextFieldWidget2(
              hintText: 'Type your message here...',
              maxLines: 12,
              controller: messageTextController),
          33.verticalSpace,
        GetBuilder(

          builder: (context) {
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              clipBehavior: Clip.none,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        childAspectRatio: Get.width / (Get.height / 1.6),
                        crossAxisSpacing: 20.5,
                        mainAxisSpacing: 20.5),
                   itemBuilder: (context, index) => Text('asf'),);
          }
        ),
        42.verticalSpace,
        CustomButtonWidget(
              text: "Submit",
              onTap: () {
                final bottomcontroller = Get.put(BottomController());
                bottomcontroller.navBarChange(0);
                Get.to(() => MainScreen());
              })
        ],
      ),
    );
  }

  Imgss() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  width: 87.w,
                  height: 97.h,
                  child: Image.asset(
                    "assets/images/NoPath - Copy (29).png",
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 65,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      child: Image.asset("assets/images/Group 1005.png"),
                    )),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 87.w,
                  height: 97.h,
                  child: Image.asset(
                    "assets/images/NoPath - Copy (30).png",
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 65,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      child: Image.asset("assets/images/Group 1005.png"),
                    )),
              ],
            ),
            Stack(
              children: [
                Container(
                  width: 87.w,
                  height: 97.h,
                  child: Image.asset(
                    "assets/images/NoPath - Copy (32).png",
                  ),
                ),
                Positioned(
                    top: 0,
                    left: 65,
                    child: Container(
                      width: 21.w,
                      height: 21.h,
                      child: Image.asset("assets/images/Group 1005.png"),
                    )),
              ],
            ),
            Container(
              width: 87.w,
              height: 97.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(2.r),
                dashPattern: [3, 8],
                color: Colors.grey,
                strokeWidth: 2,
                child: Center(
                  child: Container(
                    child: Image.asset(
                      "assets/images/Icon ionic-ios-add-circle.png",
                      height: 29.h,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class UploadImage extends GetxController {
  List uploadImage = [
    "assets/images/NoPath - Copy (29).png",
    "assets/images/NoPath - Copy (30).png",
    "assets/images/NoPath - Copy (32).png"
  ];

  addImage(String path) {
    uploadImage.add(path);
    update();
  }

  removeImage(int index) {
    uploadImage.removeAt(index);
    update();
  }
}
