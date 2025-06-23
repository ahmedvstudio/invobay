import 'package:flutter/material.dart';
import 'package:invobay/features/auth/on_boarding/widgets/on_boarding_body.dart';
import 'package:invobay/features/auth/on_boarding/widgets/on_boarding_footer.dart';
import 'package:invobay/features/auth/on_boarding/widgets/on_boarding_header.dart';
import '../../../common/styles/spacing_style.dart';
import '../../../core/utils/constants/sizes.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: VSpacingStyle.all,
        child: Column(
          children: [
            /// --> Header
            OnBoardingHeader(),

            SizedBox(height: VSizes.spaceBtwSections),

            /// --> Body
            OnBoardingBody(),

            SizedBox(height: VSizes.spaceBtwSections),

            /// --> Footer
            OnBoardingFooter(),
            SizedBox(height: VSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
