import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/pages/auth/screens/authscreen.dart';
import 'package:amazon_clone_flutter/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: AuthScreen(),
      onGenerateRoute: ((settings) => generateRoute(settings)),
    );
  }
}
