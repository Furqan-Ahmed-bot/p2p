import '../export_all.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool _value = false;
  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  final List<PaymentDataModel> paymentOptionList = [
    PaymentDataModel(
        "assets/images/Rectangle 364.png", "456751******4566", false),
    PaymentDataModel("assets/images/paypal.png", "456751******4566", false),
    PaymentDataModel("assets/images/apple-pay.png", "456751******4566", false),
    PaymentDataModel(
        "assets/images/Rectangle 363.png", "456751******4566", false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "PAYMENT METHOD",
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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.r),
        child: CustomButtonWidget(
          onTap: () => Get.toNamed("/PayNowScreen"),
          text: 'Pay Now',
        ),
      ),
      body: DisAllowIndicatorWidget(
        child: ListView(
          padding: EdgeInsets.all(20.r),
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                      width: 388.w,
                      height: 57.h,
                      padding: EdgeInsets.symmetric(horizontal: 10.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(255, 0, 0, 0.06),
                            spreadRadius: 0,
                            blurRadius: 7,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                for (var element in paymentOptionList) {
                                  element.isCheck = false;
                                }
                                paymentOptionList[index].isCheck =
                                    !(paymentOptionList[index].isCheck);
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: paymentOptionList[index].isCheck
                                          ? Color(0xff6A6A6A)
                                          : Color(0xff6A6A6A),
                                      width: 1)),
                              child: Icon(
                                Icons.circle_rounded,
                                color: paymentOptionList[index].isCheck
                                    ? Color(0xff303030)
                                    : Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          20.horizontalSpace,
                          Container(
                            width: 32.w,
                            height: 25.h,
                            child: Image.asset(
                              paymentOptionList[index].paymentIcon,
                            ),
                          ),
                          29.horizontalSpace,
                          Text(
                            paymentOptionList[index].paymentHintText,
                            style: TextStyle(
                              color: Color(0xff878B9E),
                              fontSize: 17.sp,
                            ),
                          ),
                          65.horizontalSpace,
                          Container(
                            width: 15.w,
                            height: 19.h,
                            child: Image.asset(
                                "assets/images/Icon material-delete-forever.png"),
                          )
                        ],
                      ),
                    ),
                separatorBuilder: (context, index) => 20.verticalSpace,
                itemCount: paymentOptionList.length),
            10.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 13.w,
                  height: 13.h,
                  child: Image.asset(
                    "assets/images/Icon material-add-box.png",
                  ),
                ),
                9.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/PAYMENTMETHODDScreen");
                  },
                  child: Text(
                    "Add Card",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            // 380.verticalSpace,
            // GestureDetector(
            //   onTap: () {
            //     Get.toNamed("/PayNowScreen");
            //   },
            //   child: Container(
            //     width: 388.w,
            //     height: 60.h,
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(
            //         begin: Alignment.bottomRight,
            //         end: Alignment.bottomLeft,
            //         colors: [
            //           Color(0xff1CC8FB),
            //           Color(0xff004DF2),
            //         ],
            //       ),
            //       boxShadow: [
            //         BoxShadow(
            //           offset: Offset(0, 0),
            //         ),
            //       ],
            //       borderRadius: BorderRadius.circular(30.r),
            //     ),
            //     child: Center(
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           Text(
            //             "Pay Now",
            //             style: TextStyle(color: Colors.white, fontSize: 18.sp),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  paymentt(
    img,
  ) {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 57,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(255, 0, 0, 0.06),
                spreadRadius: 0,
                blurRadius: 7,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _value = !_value;
                    });
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                _value ? Color(0xff6A6A6A) : Color(0xff6A6A6A),
                            width: 1)),
                    child: Icon(
                      Icons.circle_rounded,
                      color: _value ? Color(0xff303030) : Colors.white,
                      size: 18,
                    ),
                  ),
                ),
                20.horizontalSpace,
                Container(
                  width: 32.w,
                  height: 25.h,
                  child: Image.asset(
                    img,
                  ),
                ),
                29.horizontalSpace,
                Text(
                  "456751******4566",
                  style: TextStyle(
                    color: Color(0xff878B9E),
                    fontSize: 17.sp,
                  ),
                ),
                65.horizontalSpace,
                Container(
                  width: 15.w,
                  height: 19.h,
                  child: Image.asset(
                      "assets/images/Icon material-delete-forever.png"),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentDataModel {
  String paymentIcon;
  String paymentHintText;
  bool isCheck;

  PaymentDataModel(this.paymentIcon, this.paymentHintText, this.isCheck);
}
