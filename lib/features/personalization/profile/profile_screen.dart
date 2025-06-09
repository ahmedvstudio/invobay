import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/features/personalization/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VAppBar(
        title: Text(context.loc.profile),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(VSizes.defaultSpace),
          child: Column(
            children: [
              // profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const VCircularImage(
                        image: VImages.darkAppLogo, height: 80, width: 80),
                    TextButton(
                        onPressed: () {},
                        child: Text(context.loc.changeProfilePicture)),
                  ],
                ),
              ),

              // details
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems),
              VSectionHeading(
                  title: context.loc.profileInformation,
                  showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems),

              VProfileMenu(
                  title: context.loc.name,
                  value: 'Ahmed Adnan',
                  onPressed: () {}),
              VProfileMenu(
                  title: context.loc.username,
                  value: 'ahmed47v',
                  onPressed: () {}),
              const SizedBox(height: VSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems),

              // personal info
              VSectionHeading(
                  title: context.loc.personalInformation,
                  showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems),

              VProfileMenu(
                  title: context.loc.userId,
                  value: '44432',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              VProfileMenu(
                  title: context.loc.email, value: 'example', onPressed: () {}),
              VProfileMenu(
                  title: context.loc.phoneNumber,
                  value: '+964 7701234567',
                  onPressed: () {}),
              VProfileMenu(
                  title: context.loc.gender, value: 'Male', onPressed: () {}),
              VProfileMenu(
                  title: context.loc.dateOfBirth,
                  value: '01 Jan 1992',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    context.loc.deleteAccount,
                    style: const TextStyle(color: VColors.error),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
