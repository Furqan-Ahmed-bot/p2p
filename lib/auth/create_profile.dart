import 'dart:io';

import '../export_all.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => CreateProfileScreenStateScreen();
}

class CreateProfileScreenStateScreen extends State<CreateProfileScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? selectFile;
  uploadProfileImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      selectFile = File(result.files.single.path!);
      setState(() {});
    }
  }

  String? genderValue;
  String? stateValue;
  PhoneCountryData? _initialCountryData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Mask Group 3.png"),
          fit: BoxFit.cover,
        ),
      ),
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
            "CREATE PROFILE",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16.sp),
          ),
          centerTitle: true,
        ),
        body: DisAllowIndicatorWidget(
          child: Form(
            key: formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 40.r),
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2.r),
                        width: 134.r,
                        height: 134.r,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Color(0xff00DBFA).withOpacity(0.64),
                            //       blurRadius: 32,
                            //       offset: Offset(0, 0))
                            // ],
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=901'),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            border: Border.all(
                                width: 2.r,
                                color: Color(0xff00DBFA),
                                strokeAlign: BorderSide.strokeAlignInside)),
                        child: selectFile != null
                            ? CircleAvatar(
                                // radius: 134.r,
                                maxRadius: 134.r,
                                minRadius: 134.r,
                                backgroundColor: Color(0xff21CDFB),
                                backgroundImage: FileImage(selectFile!),
                              )
                            : null,
                      ),
                      Positioned(
                        bottom: 0,
                        right: -20,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.bottomRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff1CC8FB),
                                  Color(0xff004DF2),
                                ],
                              ),
                              border: Border.all(color: Color(0xffF6F6F6))),
                          height: 40.h,
                          child: RawMaterialButton(
                            // highlightColor: Color(0xff21CDFB),
                            onPressed: () => uploadProfileImage(),
                            elevation: 1,
                            // fillColor: Color(0xff21CDFB),

                            child: Image.asset(
                              "assets/images/Icon ionic-ios-reverse-camera.png",
                              scale: 4,
                            ),
                            // padding: EdgeInsets.all(2),
                            shape: CircleBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                49.verticalSpace,
                CustomTextFieldWidget(
                  labelText: 'Full Name',
                  controller: fullNameController,
                  hintText: 'Smith',
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
                20.verticalSpace,
                20.verticalSpace,
                CustomTextFieldWidget(
                  labelText: "Username",
                  controller: userNameController,
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                ),
                DropdownWigdet(
                  labelText: 'Gender',
                  hintText: 'Select Gender',
                  validator: (txt) {
                    if (txt.toString().isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  list: ['Male', 'Female'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black, fontSize: 16.sp),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    print(value.toString());
                    genderValue = value;
                  },
                ),
                20.verticalSpace,
                CustomTextFieldWidget(
                  labelText: 'Phone Number',
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (txt) {
                    if (txt!.isEmpty) {
                      return "* Required";
                    } else
                      return null;
                  },
                  inputFormatters: [
                    PhoneInputFormatter(
                      allowEndlessPhone: false,
                      defaultCountryCode: _initialCountryData?.countryCode,
                    )
                  ],
                ),
                20.verticalSpace,
                CustomTextFieldWidget(
                    validator: (txt) {
                      if (txt!.isEmpty) {
                        return "* Required";
                      } else
                        return null;
                    },
                    labelText: 'Country',
                    controller: countryController),
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: CustomTextFieldWidget(
                        labelText: 'City',
                        controller: cityController,
                        validator: (txt) {
                          if (txt!.isEmpty) {
                            return "* Required";
                          } else
                            return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.4,
                      child: DropdownWigdet(
                        labelText: 'State',
                        hintText: 'Select State',
                        validator: (txt) {
                          if (txt == null) {
                            return "* Required";
                          } else
                            return null;
                        },
                        list: ['USA', 'UAE'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {},
                      ),
                    )
                  ],
                ),
                40.verticalSpace,
                CustomButtonWidget(
                    text: 'Create',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        var data = {
                          'fullName': fullNameController.text,
                          'userName': userNameController.text,
                          'phoneNumber': phoneNumberController.text,
                          'country': countryController.text,
                          'city': cityController.text,
                          'state': 
                        };
                      } else if (selectFile == null) {
                        Get.snackbar('Error', 'Please upload profile picture',
                            colorText: Colors.white);
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
