import 'package:amazon_clone_flutter/pages/account/widgets/account_button.dart';
import 'package:flutter/material.dart'; 

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            accountButton('My Orders', () {}),
            accountButton('Wish List', () {}),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            accountButton('My Orders', () {}),
            accountButton('Refund', () {}),
          ],
        ),
      ],
    );
  }
}
