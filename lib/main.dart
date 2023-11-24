import 'package:ecommerceapp_firebase/constants/app_theme.dart';
import 'package:ecommerceapp_firebase/firebase_options.dart';
import 'package:ecommerceapp_firebase/ui/screen/internet_screen/internet_checker.dart';
import 'package:ecommerceapp_firebase/ui/screen/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constants/app_strings.dart';

Future<void> main() async {
  /// biding app
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase biding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// Fix size for app
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      ///
      builder: (context, child) {
        return MaterialApp(
          /// remove banner
          debugShowCheckedModeBanner: false,

          title: AppString.strAppName,
          theme: themeData,

          // ThemeData(
          //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          //   useMaterial3: true,
          // ),

          home: const SplashScreen(),
        );
      },
    );
  }
}
