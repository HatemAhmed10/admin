import 'dart:ui';

const kPrimaryColor = Color(0xff62FCD7);
// const kNotesBox = 'notes_box';
List<Color> kColors = const [
  Color(0xffAC3931),
  Color(0xffE5D352),
  Color(0xffD9E76C),
  Color(0xff537D8D),
  Color(0xff482C3D),
];



// // POST
// // UPDATE
// // DELETE
//
// // GET
//
// // base url : https://newsapi.org/
// // method (url) : v2/top-headlines?
// // queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//
// // https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
//
// import 'package:pharmacy_manager2/modules/shop_app/login/shop_login_screen.dart';
// import 'package:pharmacy_manager2/shared/components/components.dart';
// import 'package:pharmacy_manager2/shared/network/local/cache_helper.dart';
//
// void signOut(context)
// {
//   CacheHelper.removeData(
//     key: 'token',
//   ).then((value)
//   {
//     if (value)
//     {
//       navigateAndFinish(
//         context,
//         ShopLoginScreen(),
//       );
//     }
//   });
// }
//
// void printFullText(String text) {
//   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
//   pattern.allMatches(text).forEach((match) => print(match.group(0)));
// }
//
// String token = '';
//
// String uId = '';