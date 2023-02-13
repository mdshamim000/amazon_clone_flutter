import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/providers/user_provider.dart';
import 'package:flutter/material.dart'; 
import 'package:provider/provider.dart';

class LowerAppBar extends StatelessWidget {
  const LowerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: const BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      child: Row(
        children: [
          RichText(
              text: TextSpan(
                  text: 'Hello, ',
                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  children: [
                TextSpan(
                  text: user.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ])),
        ],
      ),
    );
  }
}
