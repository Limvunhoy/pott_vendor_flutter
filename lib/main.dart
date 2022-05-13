import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pott_vendor/core/api/api_base_helper.dart';
import 'package:pott_vendor/config/app_pages.dart';
import 'package:pott_vendor/config/app_routes.dart';
import 'package:pott_vendor/feature/sign_in/controller/auth_controller.dart';
import 'package:pott_vendor/utils/extension/color%20+%20extension.dart';
import 'package:pott_vendor/utils/helper/base_notification_manager.dart';

final authController = Get.put(AuthController());

const AndroidNotificationChannel androidNotificationChannel =
    AndroidNotificationChannel(
  "high_importance_channel",
  "Notification Title",
  description: "Notification Description",
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put<ApiBaseHelper>(ApiBaseHelper());
  await authController.readUser();

  await Firebase.initializeApp();

  await BaseNotificationManager.initialize(flutterLocalNotificationsPlugin);
  // BaseNotificationManager.configLocationNotification(
  //     flutterLocalNotificationsPlugin);

  FirebaseMessaging.onBackgroundMessage(
      BaseNotificationManager.firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      color: Colors.white,
      title: 'PottVendor',
      unknownRoute: GetPage(
        name: "/unknown",
        page: () => Scaffold(
          backgroundColor: Colors.red,
        ),
      ),
      theme: ThemeData(
        primaryColor: colorExt.PRIMARY_COLOR,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: colorExt.PRIMARY_COLOR),
        ),
      ),
      // initialBinding: AuthBinding(),
      getPages: AppPages.routes,
      initialRoute:
          authController.isAuthentication.isTrue ? Routes.MENU : Routes.SIGNIN,
    );
  }
}

// void main() => runApp(MyMaterialApp());
//
// class MyMaterialApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'flutter_typeahead demo',
//       home: DataTableDemo(),
//     );
//   }
// }
//
// class User {
//   String? firstName;
//   String? lastName;
//
//   User({this.firstName, this.lastName});
//
//   static List<User> getUsers() {
//     return users;
//     /*return <User>[
//       User(firstName: "Aaryan", lastName: "Shah"),
//       User(firstName: "Ben", lastName: "John"),
//       User(firstName: "Carrie", lastName: "Brown"),
//       User(firstName: "Deep", lastName: "Sen"),
//       User(firstName: "Emily", lastName: "Jane"),
//     ];*/
//   }
//
//   static addUsers(firstName, lastName) {
//     var user = new User();
//     user.firstName = firstName;
//     user.lastName = lastName;
//     users.add(user);
//   }
// }
//
// List<User> users = [];
//
// class DataTableDemo extends StatefulWidget {
//   DataTableDemo() : super();
//
//   final String title = "Data Table Flutter Demo";
//
//   @override
//   DataTableDemoState createState() => DataTableDemoState();
// }
//
// class DataTableDemoState extends State<DataTableDemo> {
//   List<User>? users;
//   List<User>? selectedUsers;
//   bool? sort;
//
//   @override
//   void initState() {
//     sort = false;
//     selectedUsers = [];
//     users = User.getUsers();
//     super.initState();
//   }
//
//   onSortColum(int columnIndex, bool ascending) {
//     if (columnIndex == 0) {
//       if (ascending) {
//         users?.sort((a, b) => a.firstName!.compareTo(b.firstName!));
//       } else {
//         users?.sort((a, b) => b.firstName!.compareTo(a.firstName!));
//       }
//     }
//   }
//
//   onSelectedRow(bool selected, User user) async {
//     setState(() {
//       if (selected) {
//         selectedUsers?.add(user);
//       } else {
//         selectedUsers?.remove(user);
//       }
//     });
//   }
//
//   deleteSelected() async {
//     setState(() {
//       if (selectedUsers!.isNotEmpty) {
//         List<User> temp = [];
//         temp.addAll(selectedUsers!);
//         for (User user in temp) {
//           users?.remove(user);
//           selectedUsers?.remove(user);
//         }
//       }
//     });
//   }
//
//   SingleChildScrollView dataBody() {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: <Widget>[
//           MaterialButton(
//             child: Text('add button'),
//             onPressed: () {
//               var user = new User();
//               user.firstName = "default firstName";
//               user.lastName = "default lastName";
//               users?.add(user);
//               setState(() {});
//             },
//           ),
//           MaterialButton(
//             child: Text('print all button'),
//             onPressed: () {
//               users?.forEach((u) => print("${u.firstName} ${u.lastName}"));
//             },
//           ),
//           DataTable(
//             sortAscending: sort!,
//             sortColumnIndex: 0,
//             columns: [
//               DataColumn(
//                   label: Text("FIRST NAME"),
//                   numeric: false,
//                   tooltip: "This is First Name",
//                   onSort: (columnIndex, ascending) {
//                     setState(() {
//                       sort = !sort!;
//                     });
//                     onSortColum(columnIndex, ascending);
//                   }),
//               DataColumn(
//                 label: Text("LAST NAME"),
//                 numeric: false,
//                 tooltip: "This is Last Name",
//               ),
//             ],
//             rows: users!
//                 .map(
//                   (user) => DataRow(
//                       selected: selectedUsers!.contains(user),
//                       onSelectChanged: (b) {
//                         print("Onselect");
//                         onSelectedRow(b!, user);
//                       },
//                       cells: [
//                         DataCell(
//                           //Text(user.firstName),
//                           TextField(
//                             onChanged: (text) {
//                               print("First text field: $text");
//                               user.firstName = text;
//                             },
//                           ),
//                         ),
//                         DataCell(
//                           Text(user.lastName!),
//                         ),
//                       ]),
//                 )
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         verticalDirection: VerticalDirection.down,
//         children: <Widget>[
//           Expanded(
//             child: dataBody(),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: OutlineButton(
//                   child: Text('SELECTED ${selectedUsers!.length}'),
//                   onPressed: () {},
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(20.0),
//                 child: OutlineButton(
//                   child: Text('DELETE SELECTED'),
//                   onPressed: selectedUsers!.isEmpty
//                       ? null
//                       : () {
//                           deleteSelected();
//                         },
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
