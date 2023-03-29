import '../export_all.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => CreateProfileScreenStateScreen();
}

class CreateProfileScreenStateScreen extends State<CreateProfileScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
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
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 40.r, vertical: 40.r),
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      // padding: EdgeInsets.all(0.5.r),
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
                          color: Colors.white,
                          border: Border.all(
                              width: 1.r,
                              color: Color(0xff00DBFA),
                              strokeAlign: BorderSide.strokeAlignInside)),
                      child: CircleAvatar(
                        // radius: 134.r,
                        maxRadius: 134.r,
                        minRadius: 134.r,
                        backgroundColor: Color(0xff21CDFB),
                        backgroundImage: NetworkImage(
                            'https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=901'),
                      ),
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
                          onPressed: () {},
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
              ),
              20.verticalSpace,
              DropdownWigdet(
                labelText: 'Gender',
                hintText: 'Select Gender',
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
                inputFormatters: [
                  PhoneInputFormatter(
                    allowEndlessPhone: false,
                    defaultCountryCode: _initialCountryData?.countryCode,
                  )
                ],
              ),
              20.verticalSpace,
              CustomTextFieldWidget(
                  labelText: 'Country', controller: countryController),
              20.verticalSpace,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width * 0.41,
                    child: CustomTextFieldWidget(
                      labelText: 'City',
                      controller: cityController,
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.41,
                    child: DropdownWigdet(
                      labelText: 'State',
                      hintText: 'Select State',
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
              GestureDetector(
                onTap: () {
                  final bottomcontroller = Get.put(BottomController());
                  bottomcontroller.navBarChange(0);
                  Get.to(() => MainScreen());
                },
                child: Container(
                  width: 348.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xff1CC8FB),
                        Color(0xff004DF2),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create",
                          style:
                              TextStyle(color: Colors.white, fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Container(
              //   width: 134.w,
              //   height: 130.h,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     border: Border.all(color: Color(0xff21CDFB)),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Color(0xff21CDFB).withOpacity(0.25),
              //         spreadRadius: 20,
              //         blurRadius: 7,
              //         offset: Offset(0, 3), // changes position of shadow
              //       ),
              //     ],
              //     // boxShadow: [
              //     //   BoxShadow(
              //     //     color: Color(0xff00DBFA),
              //     //     spreadRadius: 9,
              //     //     blurRadius: 9,
              //     //     offset: Offset(0, 3), // changes position of shadow
              //     //   ),
              //     // ],
              //   ),
              //   child: Center(
              //     child: Image.asset(
              //       "assets/images/NoPath.png",
              //       scale: 3.8,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
