import 'package:amazon_clone_flutter/pages/auth/screens/account_screen.dart';
import 'package:amazon_clone_flutter/pages/auth/screens/authscreen.dart';
import 'package:amazon_clone_flutter/pages/home/home_screen.dart';
import 'package:amazon_clone_flutter/res/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBar.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBar());
    case AccountScreen.routeName:
      return MaterialPageRoute(builder: (_) => const AccountScreen());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(child: Text('opps, something went wrong...')),
              ));
  }
}
