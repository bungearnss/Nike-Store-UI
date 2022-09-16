import 'package:flutter/material.dart';

import './src/screen/auth/sign_screen.dart';
import './src/util/appColor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Sfui",
        primaryColor: appColors.primaryColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w300,
            color: Colors.black,
          ),
        ),
      ),
      home: const SignScreen(),
    );
  }
}
