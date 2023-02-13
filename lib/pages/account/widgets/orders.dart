import 'package:amazon_clone_flutter/consts/global_var.dart';
import 'package:amazon_clone_flutter/pages/account/widgets/single_product.dart';
import 'package:flutter/material.dart'; 

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List templist = [
    'https://gw.alicdn.com/bao/uploaded/i1/454300200/O1CN01dqoak81DLdzymLPBd_!!0-saturn_solar.jpg_300x300q90.jpg',
    'https://gw.alicdn.com/bao/uploaded///asearch.alicdn.com/bao/uploaded/O1CN01s5TFXN1JXRtAAHSya_!!2779481038.jpg_300x300q90.jpg',
    'https://gw.alicdn.com/bao/uploaded/i1/454300200/O1CN01dqoak81DLdzymLPBd_!!0-saturn_solar.jpg_300x300q90.jpg',
    'https://gw.alicdn.com/bao/uploaded/i1/454300200/O1CN01dqoak81DLdzymLPBd_!!0-saturn_solar.jpg_300x300q90.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'My Orders',
                style: GlobalVariables.text18b,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                'See all',
                style: TextStyle(color: GlobalVariables.selectedNavBarColor),
              ),
            )
          ],
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return SingleProduct(text: 'text ', image: templist[index]);
            }),
            itemCount: templist.length,
          ),
        )
      ],
    );
  }
}
