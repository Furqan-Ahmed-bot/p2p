import '../export_all.dart';

class PaymentMethodScreen extends StatefulWidget {
  final String payButtonText;
  const PaymentMethodScreen({super.key, required this.payButtonText});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
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
          onTap: () => widget.payButtonText == 'Pay Now'
              ? Get.toNamed("/PayNowScreen")
              : Get.close(1),
          text: widget.payButtonText,
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
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                paymentOptionList.removeAt(index);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.delete_forever,
                                color: Color(0xffC6C8D2),
                              ))
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
          ],
        ),
      ),
    );
  }
}

class PaymentDataModel {
  String paymentIcon;
  String paymentHintText;
  bool isCheck;

  PaymentDataModel(this.paymentIcon, this.paymentHintText, this.isCheck);
}
