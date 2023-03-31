import 'dart:developer';
import 'dart:io';

import '../export_all.dart';

class HelpAndFeedbackScreen extends StatefulWidget {
  const HelpAndFeedbackScreen({super.key});

  @override
  State<HelpAndFeedbackScreen> createState() => HelpAndFeedbackScreenState();
}

class HelpAndFeedbackScreenState extends State<HelpAndFeedbackScreen> {
  final TextEditingController subjectTextController = TextEditingController();
  final TextEditingController messageTextController = TextEditingController();
  final UploadImageController imageController =
      Get.put(UploadImageController());
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
              init: imageController,
              builder: (context) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  clipBehavior: Clip.none,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: imageController.uploadImage.length + 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: Get.width / (Get.height / 1.9),
                      crossAxisSpacing: 10.5,
                      mainAxisSpacing: 10.5),
                  itemBuilder: (context, index) => index !=
                          imageController.uploadImage.length
                      ? Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              // width: 87.r,
                              // height: 97.r,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  image: imageController.uploadImage[index]!
                                          .contains('http')
                                      ? DecorationImage(
                                          image: NetworkImage(imageController
                                              .uploadImage[index]!),
                                          fit: BoxFit.cover)
                                      : DecorationImage(
                                          image: FileImage(File(imageController
                                              .uploadImage[index]!)),
                                          fit: BoxFit.cover)),
                            ),
                            Positioned(
                                top: -3,
                                right: -3,
                                child: Container(
                                  width: 21.w,
                                  height: 21.h,
                                  child: Image.asset(
                                      "assets/images/Group 1005.png"),
                                )),
                          ],
                        )
                      : GestureDetector(
                          onTap: () async {
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles(
                              type: FileType.image,
                              allowMultiple: true,
                            );
                            if (result != null) {
                              List<File> files = result.paths
                                  .map((path) => File(path!))
                                  .toList();
                              for (var element in files) {
                                imageController
                                    .addImage(element.path.toString());
                              }
                              log(files.toString());
                            }
                          },
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(8.r),
                            dashPattern: [5, 4],
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
                );
              }),
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
}

class UploadImageController extends GetxController {
  List uploadImage = [...trafficPictureImages];

  addImage(String path) {
    uploadImage.add(path);
    update();
  }

  removeImage(int index) {
    uploadImage.removeAt(index);
    update();
  }
}
