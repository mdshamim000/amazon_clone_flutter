import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/pages/auth/screens/authscreen.dart';
import 'package:amazon_clone_flutter/pages/auth/services/auth_service.dart';
import 'package:amazon_clone_flutter/providers/user_provider.dart';
import 'package:amazon_clone_flutter/res/widgets/bottom_bar.dart';
import 'package:amazon_clone_flutter/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    authService.getUserData(context: context);

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
      home: Provider.of<UserProvider>(context).user.token != ' '
          ? const BottomBar()
          : const AuthScreen(),
      onGenerateRoute: ((settings) => generateRoute(settings)),
    );
  }
}
