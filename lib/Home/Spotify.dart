import '../export_all.dart';

class SpotifScreen extends StatefulWidget {
  const SpotifScreen({super.key});

  @override
  State<SpotifScreen> createState() => _SpotifScreenState();
}

class _SpotifScreenState extends State<SpotifScreen> {
  var selcted = 1;
  final List tabList = ['Music', 'Rock', 'Soul', 'Classic', 'Pop'];
  final List<SpotifyPlaylistModel> songList = [
    SpotifyPlaylistModel('As it Was',
        'https://i.scdn.co/image/ab67616d00001e02b46f74097655d7f353caab14'),
    SpotifyPlaylistModel('STAY (with Justin Bieber)',
        'https://i.scdn.co/image/ab67616d0000b27341e31d6ea1d493dd77933ee5'), //MIDDLE OF THE NIGHT
    SpotifyPlaylistModel('MIDDLE OF THE NIGHT',
        'https://i.scdn.co/image/ab67616d0000b27353a2e11c1bde700722fecd2e'), //I Love You So
    SpotifyPlaylistModel('I Love You So',
        'https://i.scdn.co/image/ab67616d0000b2739214ff0109a0e062f8a6cf0f'),
    SpotifyPlaylistModel('As it Was',
        'https://i.scdn.co/image/ab67616d00001e02b46f74097655d7f353caab14'),
    SpotifyPlaylistModel('STAY (with Justin Bieber)',
        'https://i.scdn.co/image/ab67616d0000b27341e31d6ea1d493dd77933ee5'), //MIDDLE OF THE NIGHT
    SpotifyPlaylistModel('MIDDLE OF THE NIGHT',
        'https://i.scdn.co/image/ab67616d0000b27353a2e11c1bde700722fecd2e'), //I Love You So
    SpotifyPlaylistModel('I Love You So',
        'https://i.scdn.co/image/ab67616d0000b2739214ff0109a0e062f8a6cf0f')
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          "SPOTIFY",
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
      body: DisAllowIndicatorWidget(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 20.r),
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // 17.verticalSpace,
            Container(
              height: 50.r,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffC6C8D2).withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: -1,
                        offset: Offset(0, 3))
                  ],
                  border: Border.all(color: Color(0xffC6C8D2)),
                  borderRadius: BorderRadius.circular(25.r)),
              child: TextFormField(
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                ),
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  isDense: true,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20.r, vertical: 12.r),
                  // labelText: "Type a message",
                  hintText: "Search here",
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelStyle: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xffA7B1BF),
                    fontFamily: "Inter, Regular",
                  ),
                  prefixIcon: Image.asset(
                    "assets/images/Icon feather-search.png",
                    scale: 5,
                    color: Color(0xffA7B1BF),
                  ),
                ),
              ),
            ),
            17.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                tabList.length,
                (index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      selcted = index;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 45.w,
                        height: 30.h,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(15.r),
                        //   gradient: LinearGradient(
                        //     begin: Alignment.bottomLeft,
                        //     end: Alignment.bottomRight,
                        //     colors: [
                        //       Color(0xffC95B00),
                        //       Color(0xff903400),
                        //     ],
                        //   ),
                        // ),
                        child: Center(
                          child: Text(
                            tabList[index]!,
                            style: GoogleFonts.abel(
                              fontWeight: FontWeight.bold,
                              color:
                                  selcted == index ? Colors.black : Colors.grey,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 47.w,
                        height: 2.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: selcted == index
                              ? Color(0XFF004DF2)
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: Get.height,
              child: GridView.builder(
                padding: EdgeInsets.only(top: 20.r, bottom: 230),
                itemCount: songList.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: Get.width / (Get.height / 1.6),
                    crossAxisSpacing: 20.5,
                    mainAxisSpacing: 20.5),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    final bottomcontroller = Get.put(BottomController());
                    bottomcontroller.navBarChange(3);
                    Get.to(() => MainScreen());
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 183.w,
                        height: 182.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  songList[index].songThumbnailImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      10.verticalSpace,
                      FittedBox(
                        child: Text(
                          songList[index].songTitle,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }

 
}

class SpotifyPlaylistModel {
  String songTitle;
  String songThumbnailImage;

  SpotifyPlaylistModel(this.songTitle, this.songThumbnailImage);
}
