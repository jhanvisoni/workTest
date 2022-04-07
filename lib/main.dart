import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:worktask/screens/public_lists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //initialBinding: DataBinding(),
        theme: ThemeData(
            textTheme: const TextTheme(bodyText1: TextStyle(fontSize: 18))),
        home: const UsersList(),
      ),
    );
  }
}
