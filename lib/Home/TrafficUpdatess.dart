// import 'package:p2ptraffic/export_all.dart';

// class NewTrafficUpdates extends StatefulWidget {
//   const NewTrafficUpdates({super.key});

//   @override
//   State<NewTrafficUpdates> createState() => _NewTrafficUpdatesState();
// }

// class _NewTrafficUpdatesState extends State<NewTrafficUpdates> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "TRAFFIC UPDATES",
//           style: TextStyle(fontSize: 16.sp),
//         ),
//         centerTitle: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(
//             bottom: Radius.circular(30),
//           ),
//         ),
//         elevation: 0,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Container(
//             child: Image.asset(
//               "assets/images/Icon ionic-ios-arrow-round-back.png",
//               scale: 5,
//             ),
//           ),
//         ),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(30),
//             ),
//             gradient: LinearGradient(
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               colors: [
//                 Color(0xff004DF2),
//                 Color(0xff1CC8FB),
//               ],
//             ),
//             // backgroundBlendMode: BlendMode.colorBurn,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           27.verticalSpace,
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 6),
//                 child: Text(
//                   "Location",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 22.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ],
//           ),
//           17.verticalSpace,
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 child: Image.asset(
//                   "assets/images/Icon material-location-on.png",
//                   scale: 5,
//                 ),
//               ),
//               Text(
//                 "20 Cooper Square, New York",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16.sp,
//                 ),
//               ),
//               Container(
//                 width: 77.w,
//                 height: 29.h,
//                 decoration: BoxDecoration(
//                   color: Color(0xffE8E8F1),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Center(
//                   child: Text(
//                     '',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.sp,
//                         fontWeight: FontWeight.w900),
//                   ),
//                 ),
//               )
//             ],
//           ),
//           26.verticalSpace,
//           Dividerr(),
//           18.verticalSpace,
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 6),
//                 child: Text(
//                   "Updates",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 22.sp,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
