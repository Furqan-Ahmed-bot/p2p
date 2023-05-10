import '../export_all.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "Checkout",
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
          onTap: () => Get.back(),
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
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
          children: [
            Container(
              width: 388.w,
              height: 113.h,
              decoration: BoxDecoration(
                  color: Color(0xffE7EFF2),
                  borderRadius: BorderRadius.circular(
                    10,
                  )),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    17.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Gold Package",
                          style:
                              TextStyle(fontSize: 22.sp, color: Colors.black),
                        ),
                        Container(
                          child: Image.asset(
                            "assets/images/Icon awesome-check-circle.png",
                            scale: 5,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 246.w,
                      height: 41.h,
                      child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do.",
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
            38.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$50.00",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Dividerr(),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tax",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$2.00",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Dividerr(),
                  10.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Subtotal (incl.VAT)",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "\$52.00",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Dividerr(),
                  418.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      Get.to(() => PaymentMethodScreen(
                            payButtonText: 'Pay Now',
                          ));
                    },
                    child: Container(
                      width: 388.w,
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
                              "Checkout",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff010231).withOpacity(0.3),
        ),
      ],
    );
  }
}
