import 'package:algo_ease/core/design/shared/theme.dart';
import 'package:algo_ease/features/auth/ui/login_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:algo_ease/core/dependencies/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'AlgoEase',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
