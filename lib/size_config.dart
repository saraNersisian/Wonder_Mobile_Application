// import 'package:flutter/widgets.dart';
//
// class SizeConfig {
//   static MediaQueryData _mediaQueryData;
//   static double screenWidth;
//   static double screenHeight;
//   static double blockSizeHorizontal;
//   static double blockSizeVertical;
//
//   static double _safeAreaHorizontal = _mediaQueryData.padding.left +
//       _mediaQueryData.padding.right;
//   static double _safeAreaVertical = _mediaQueryData.padding.top +
//       _mediaQueryData.padding.bottom;
//   static double safeBlockHorizontal =(screenWidth -
//       _safeAreaHorizontal) / 100;
//   static double safeBlockVertical = (screenHeight -
//       _safeAreaVertical) / 100;
//
//   void init(BuildContext context) {
//     _mediaQueryData = MediaQuery.of(context);
//     screenWidth = _mediaQueryData.size.width;
//     screenHeight = _mediaQueryData.size.height;
//     blockSizeHorizontal = screenWidth / 100;
//     blockSizeVertical = screenHeight / 100;
//
//     // _safeAreaHorizontal = _mediaQueryData.padding.left +
//     //     _mediaQueryData.padding.right;
//     // _safeAreaVertical = _mediaQueryData.padding.top +
//     //     _mediaQueryData.padding.bottom;
//     // safeBlockHorizontal = (screenWidth -
//     //     _safeAreaHorizontal) / 100;
//     // safeBlockVertical = (screenHeight -
//     //     _safeAreaVertical) / 100;
//   }
// }
