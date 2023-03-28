import '../export_all.dart';

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  
  
  @override
  BorderSide? resolve(_) => const BorderSide(
        color: Color(0xffF58532),
      );
}

class AlwaysActiveBorderSide2 extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) => const BorderSide(
        color: Color(0xff1CC8FB),
      );
}

function1(BuildContext context) {
      bool isChecked = false;
      bool isChecked2 = false;
    return showDialog(
      
      barrierDismissible: true,
      // barrierColor: Colors.white,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          
          builder: (BuildContext context, setState) {
            return AlertDialog(
              backgroundColor: Color(0xff000000B8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
              contentPadding: EdgeInsets.all(0),
              actionsPadding: EdgeInsets.all(0),
              actions: [
                Container(
                  width: 349.w,
                  height: 348.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffFFFFFF)),
                  child: ListView(
                    children: [
                      Container(
                        width: 365.w,
                        height: 59.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.r),
                            topRight: Radius.circular(10.r),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Color(0xff1CC8FB),
                              Color(0xff004DF2),
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 125.w,
                            ),
                            Text(
                              "Agreement",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 80.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(children: [
                        Text(
                          "I agree with the following",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        ),
                        30.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 20.h,
                                    width: 250.w,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            side: AlwaysActiveBorderSide(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            }),
                                        Text(
                                          "Terms & Conditions",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                              Row(
                                children: [
                                  Container(
                                    width: 250.w,
                                    height: 20.h,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                            side: AlwaysActiveBorderSide(),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
                                            ),
                                            checkColor: Colors.black,
                                            activeColor: Colors.white,
                                            value: isChecked2,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked2 = value!;
                                              });
                                            }),
                                        Text(
                                          "Privacy Policy",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        85.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                width: 171.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(0.r),
                                    bottomLeft: Radius.circular(18.r),
                                  ),
                                  color: Color(0xffDCE3EE),
                                ),
                                child: Center(
                                  child: Text(
                                    "Decline",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              color: Color(0xffDCE3EE),
                              height: 64.h,
                              width: 1.6.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/LoginScreen");
                              },
                              child: Container(
                                width: 170.w,
                                height: 64.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(0.r),
                                    bottomRight: Radius.circular(18.r),
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                      Color(0xff1CC8FB),
                                      Color(0xff004DF2),
                                    ],
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "Accept",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ])
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
final imagePath = 'assets/images';
