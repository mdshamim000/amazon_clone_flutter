import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/pages/account/widgets/lower_appbar.dart';
import 'package:amazon_clone_flutter/pages/account/widgets/orders.dart';
import 'package:amazon_clone_flutter/pages/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  static const routeName = '/account';
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
          title: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon.png',
                  width: 110,
                  height: 42,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          LowerAppBar(),
          SizedBox(
            height: 10,
          ),
          TopButtons(),
          SizedBox(
            height: 20,
          ),
          Orders()
        ],
      ),
    );
  }
}
