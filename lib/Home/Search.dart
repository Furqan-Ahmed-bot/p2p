import '../export_all.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SEARCH",
          style: TextStyle(fontSize: 16.sp),
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                width: 18.w,
                height: 18.h,
                child: Image.asset("assets/images/Icon ionic-ios-close.png"),
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.black,
                Colors.black,
              ],
            ),
            // backgroundBlendMode: BlendMode.colorBurn,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                20.verticalSpace,
                SearchTextFieldWidget(
                  controller: searchTextController,
                  hintText: "Search here...",
                ),
                33.verticalSpace,
                martin("assets/images/1.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/2.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/3.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/4.png"),
                20.verticalSpace,
                Dividerr(),
                20.verticalSpace,
                martin("assets/images/5.png"),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }

  martin(
    img,
  ) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/MartinProfileScreen");
      },
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 60.w,
            child: Image.asset(
              img,
            ),
          ),
          22.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Martin Smith",
                style: TextStyle(fontSize: 18.sp, color: Color(0xffFFFFFF)),
              ),
              Text(
                "New York",
                style: TextStyle(fontSize: 14.sp, color: Color(0xffFFFFFF)),
              ),
            ],
          ),
          151.horizontalSpace,
          Container(
            height: 26.h,
            width: 26.w,
            child: Image.asset(
              "assets/images/Group 1683.png",
            ),
          ),
        ],
      ),
    );
  }

  Dividerr() {
    return Column(
      children: [
        Container(
          width: 388.w,
          height: 1.h,
          color: Color(0xff707070),
        ),
      ],
    );
  }
}
