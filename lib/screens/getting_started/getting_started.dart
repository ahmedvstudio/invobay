import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invobay/screens/getting_started/widgets/getting_started_button.dart';
import 'package:invobay/screens/getting_started/widgets/getting_started_dots.dart';
import 'package:invobay/screens/getting_started/widgets/getting_started_page.dart';
import 'package:invobay/utils/constants/image_strings.dart';
import 'package:invobay/utils/constants/text_strings.dart';
import '../../features/controllers/getting_started_controller.dart';
import 'widgets/getting_started_skip.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GettingStartedController());
    return Scaffold(
      body: Stack(
        children: [
          // Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              GettingStartedPage(
                image: VImages.gettingStarted1,
                title: VText.gettingStartedTitle1,
                subTitle: VText.gettingStartedSubTitle1,
              ),
              GettingStartedPage(
                image: VImages.gettingStarted2,
                title: VText.gettingStartedTitle2,
                subTitle: VText.gettingStartedSubTitle2,
              ),
              GettingStartedPage(
                image: VImages.gettingStarted3,
                title: VText.gettingStartedTitle3,
                subTitle: VText.gettingStartedSubTitle3,
              ),
            ],
          ),

          // skip button
          const GettingStartedSkip(),

          //dots
          const GettingStartedDots(),

          // Circular button
          const GettingStartedButton(),
        ],
      ),
    );
  }
}
