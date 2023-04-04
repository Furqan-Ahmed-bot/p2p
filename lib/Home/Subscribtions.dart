import '../export_all.dart';

class SubscritionScreen extends StatefulWidget {
  const SubscritionScreen({super.key});

  @override
  State<SubscritionScreen> createState() => SubscritionScreenState();
}

class SubscritionScreenState extends State<SubscritionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SUBSCRIPTION",
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
            text: 'Upgrade',
            onTap: () => Get.to(() => SubscritionPackageCardScreen())),
      ),
      body: DisAllowIndicatorWidget(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
          children: [
            Row(
              children: [
                Text(
                  "Subscription Details",
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Color(0xff010231),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            25.verticalSpace,
            Dividerr(),
            textt("Package", "Gold Package"),
            14.verticalSpace,
            Dividerr(),
            textt("Validity", "6 Months"),
            14.verticalSpace,
            Dividerr(),
            textt("Subscribe", "Nov 05, 2022"),
            14.verticalSpace,
            Dividerr(),
            textt("Expire", "Nov 04, 2023"),
            14.verticalSpace,
            Dividerr(),
            textt("Price", "\$100"),
            14.verticalSpace,
            Dividerr(),
            textt("Payment Method", "Apple Pay"),
            14.verticalSpace,
            Dividerr(),
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
          color: Color(0xff010231).withOpacity(0.1),
        ),
      ],
    );
  }

  textt(
    txt,
    txt1,
  ) {
    return Column(
      children: [
        14.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt,
              style: TextStyle(fontSize: 16.sp, color: Color(0xff010231)),
            ),
            Text(
              txt1,
              style: TextStyle(fontSize: 16.sp, color: Color(0xff010231)),
            ),
          ],
        ),
      ],
    );
  }
}
