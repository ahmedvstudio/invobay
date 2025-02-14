import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RectangleButtons extends StatelessWidget {
  final VoidCallback sellOnPressed;
  final VoidCallback buyOnPressed;
  final VoidCallback receiptsOnPressed;
  final VoidCallback expensesOnPressed;
  final VoidCallback reportsOnPressed;
  final VoidCallback settingsOnPressed;
  const RectangleButtons({
    super.key,
    required this.sellOnPressed,
    required this.buyOnPressed,
    required this.receiptsOnPressed,
    required this.expensesOnPressed,
    required this.reportsOnPressed,
    required this.settingsOnPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 2,
          children: [
            GestureDetector(
              onTap: sellOnPressed,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  // color: kBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.sell,
                        size: 40,
                        // color: kIconColor,
                      ),
                    ),
                    const Text(
                      'Sell',
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: buyOnPressed,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  // color: kBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.shopping_cart_rounded,
                        size: 40,
                        // color: kIconColor,
                      ),
                    ),
                    const Text('Buy'),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: expensesOnPressed,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  // color: kBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.attach_money_rounded,
                        size: 40,
                        // color: kIconColor,
                      ),
                    ),
                    const Text(
                      'Expenses',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          spacing: 2,
          children: [
            GestureDetector(
              onTap: receiptsOnPressed,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  // color: kBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Icon(
                        Iconsax.receipt,
                        size: 40,
                        // color: kIconColor,
                      ),
                    ),
                    const Text(
                      'Receipts',
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: reportsOnPressed,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  // color: kBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.lightGreen,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.receipt,
                        size: 40,
                        // color: kIconColor,
                      ),
                    ),
                    const Text(
                      'Reports',
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: settingsOnPressed,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: const BoxDecoration(
                  // color: kBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(1, 1),
                      blurRadius: 2,
                      blurStyle: BlurStyle.outer,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: const Icon(
                        Icons.settings,
                        size: 40,
                        // color: kIconColor,
                      ),
                    ),
                    const Text(
                      'Settings',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
