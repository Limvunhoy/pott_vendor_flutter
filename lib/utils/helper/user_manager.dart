// import 'package:pott_vendor/core/model/auth/user_response.dart';
// import 'package:pott_vendor/utils/constants/shared_preference_keys.dart';
// import 'package:pott_vendor/utils/helper/shared_preference_helper.dart';
//
// class UserManager {
//   SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
//
//   UserDataResponse? _auth;
//
//   UserDataResponse get auth => _auth!;
//
//   set setAuth(UserDataResponse user) {
//     _auth = user;
//   }
//
//   saveUser() {
//     sharedPreferenceHelper.save(SharedPreferenceKey.user, auth);
//   }
//
//   Future<UserDataResponse?> readUser() async {
//     try {
//       UserDataResponse user = UserDataResponse.fromJson(
//           await sharedPreferenceHelper.read(SharedPreferenceKey.user));
//       return user;
//     } catch (e) {
//       print("Failed to get user from sf $e");
//       return null;
//     }
//   }
// }
