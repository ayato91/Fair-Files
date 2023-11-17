import 'package:flutter/material.dart';
import 'package:sharefair/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Integrity Checker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                splashFactory: NoSplash.splashFactory,
                iconColor: MaterialStatePropertyAll(Colors.deepPurple))),
        scaffoldBackgroundColor: Color(0xFFF4FBF6),
        appBarTheme: AppBarTheme(
          color: Color(0xFFCCE5E7),
        ),
      ),
      home: HomePage(),
    );
  }
}
