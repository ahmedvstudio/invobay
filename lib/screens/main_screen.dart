import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/widgets/buttons/inventory_button.dart';
import 'package:invobay/widgets/low_stock_marquee.dart';
import 'package:invobay/widgets/buttons/rectangule_buttons.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 70,
              margin: const EdgeInsets.all(16),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Iconsax.wifi,
                    color: Colors.white,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'أهلا وسهلا احمد',
                        style: ArabicTextStyle(
                          arabicFont: ArabicFont.avenirArabic,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      CircleAvatar(
                          backgroundImage: AssetImage('assets/ahmed.jpg'),
                          radius: 25),
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.only(top: 100),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    spacing: 5,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'المكتب Shop',
                        style: ArabicTextStyle(
                          arabicFont: ArabicFont.narmattan,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 15),
                      InventoryButton(
                        onPressed: () {},
                      ),
                      const SizedBox(height: 30),
                      const LowStockMarquee(
                        text: 'لا يوجد مواد على وشك النفاذ',
                      ),
                      RectangleButtons(
                        sellOnPressed: () {},
                        buyOnPressed: () {},
                        receiptsOnPressed: () {},
                        expensesOnPressed: () {},
                        reportsOnPressed: () {},
                        settingsOnPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
