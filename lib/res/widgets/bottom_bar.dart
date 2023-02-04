import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';

import '../../pages/home/home_screen.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = '/bottom-home';
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 0;
  double bottomWidth = 42;
  double bottomBorderWidth = 6;
 
  updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    BottomNavigationBarItem bottomItem(page, IconData _icon) {
      return BottomNavigationBarItem(
          icon: Container(
            width: bottomWidth,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: bottomBorderWidth,
                        color: _page == page
                            ? GlobalVariables.selectedNavBarColor
                            : Colors.transparent))),
            child: Icon(_icon),
          ),
          label: '');
    }

    return  Scaffold(
        body: pages[_page],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _page,
          selectedItemColor: GlobalVariables.selectedNavBarColor,
          unselectedItemColor: GlobalVariables.unselectedNavBarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          onTap: updatePage,
          items: <BottomNavigationBarItem>[
            bottomItem(0, Icons.home),
            bottomItem(1, Icons.person_outline),
            BottomNavigationBarItem(
                icon: Container(
                  width: bottomWidth,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              width: bottomBorderWidth,
                              color: _page == 2
                                  ? GlobalVariables.selectedNavBarColor
                                  : Colors.transparent))),
                  child: const badges.Badge(
                      badgeContent: Text('11'),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.white,
                        elevation: 0,
                      ),
                      child: Icon(Icons.shopping_cart_outlined)),
                ),
                label: ''),
            //  bottomItem(3, Icons.menu)
          ],
        ),
    
    );
  }
}
