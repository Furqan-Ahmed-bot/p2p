import 'package:carousel_slider/carousel_slider.dart';

import '../export_all.dart';

class SubscritionPackageCardScreen extends StatefulWidget {
  const SubscritionPackageCardScreen({super.key});

  @override
  State<SubscritionPackageCardScreen> createState() =>
      _SubscritionPackageCardScreenState();
}

class _SubscritionPackageCardScreenState
    extends State<SubscritionPackageCardScreen> {
  var subs;
  int activeIndex = 0;
  var counts = 3;
  @override
  Widget build(BuildContext context) {
    List<Widget> cards = [
      subscriptionCard("Gold Package", "24.00", "6 Months"),
      subscriptionCard("Permium Package", "50.00", "9 Months"),
      subscriptionCard("Unlimited Package", "100.00", "1 Year"),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SUBSCRIBE",
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
        padding: EdgeInsets.all(30.r),
        children: [
          CarouselSlider(
            // carouselController: CarouselController(),
            items: cards,

            options: CarouselOptions(
              // autoPlay: true,

              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  activeIndex = index;
                });
              },
              height: 550.h,
              enlargeFactor: 1.0,
            ),
          ),
          Center(child: dotIndicator()),
          180.verticalSpace,
          CustomButtonWidget(
              text: 'Subscribe',
              onTap: () {
                Get.toNamed("/CHECKOUTScreen");
              }),
        ],
      ),
    );
  }

  subscriptionCard(title, price, month) => Container(
        height: 550.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 400.h,
              width: 400.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.r),
                  color: Color(0xffC6C8D2).withOpacity(0.56)),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: Container(
                height: 490.h,
                width: 322.w,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.white, width: 0.5.w),
                    borderRadius: BorderRadius.circular(17.r),
                    color: Color(0xffFFFFFF)),
                child: Container(
                  width: 322.w,
                  height: 427.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(17.r),
                      color: Color(0xffFFFFFF)),
                  child: ListView(children: [
                    Container(
                      width: 322.w,
                      height: 93.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(17.r),
                          topRight: Radius.circular(17.r),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          // end: Alignment.bottomCenter,
                          colors: [Color(0xff004DF2), Color(0xff21CDFB)],
                        ),
                      ),
                      child: FittedBox(
                        child: Text(
                          title.toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 20.r),
                        itemBuilder: (context, index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Color(0xff707070),
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 14.h,
                                  ),
                                  Container(
                                    width: 250.w,
                                    child: Text(
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.black),
                                    ),
                                  ),
                                ]),
                        separatorBuilder: (context, index) => 20.verticalSpace,
                        itemCount: 3),
                    Center(
                      child: Text.rich(TextSpan(children: [
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(0.0, -28.0),
                            child: Text(
                              '\$',
                              style: TextStyle(
                                  fontSize: 25.sp, color: Color(0xff004DF2)),
                            ),
                          ),
                        ),
                        TextSpan(
                            text: price.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 70,
                                color: Color(0xff878B9E)))
                      ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          month.toString(),
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ]),
                ),
              ),
            ),
          ],
        ),
      );
  Widget dotIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: counts,
        effect: ExpandingDotsEffect(
            dotWidth: 9.r,
            dotColor: Color(0xffA4AFBF),
            strokeWidth: 1.0,
            activeDotColor: Color(0xff004CF2),
            dotHeight: 9.h),
      );
}
