import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/features/personalization/profile/widgets/profile_menu.dart';

import '../../../../common/widgets/images/circular_image.dart';
import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/text/section_heading.dart';
import '../../../core/utils/constants/image_strings.dart';
import '../../../core/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const VAppBar(
        title: Text('Profile'),
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
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // details
              const SizedBox(height: VSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems),
              const VSectionHeading(
                  title: 'Profile Information', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems),

              VProfileMenu(
                  title: 'Name', value: 'Ahmed Adnan', onPressed: () {}),
              VProfileMenu(
                  title: 'Username', value: 'ahmed47v', onPressed: () {}),
              const SizedBox(height: VSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems),

              // personal info
              const VSectionHeading(
                  title: 'Personal Information', showActionButton: false),
              const SizedBox(height: VSizes.spaceBtwItems),

              VProfileMenu(
                  title: 'User ID',
                  value: '44432',
                  icon: Iconsax.copy,
                  onPressed: () {}),
              VProfileMenu(title: 'E-mail', value: 'example', onPressed: () {}),
              VProfileMenu(
                  title: 'Phone Number',
                  value: '+964 7701234567',
                  onPressed: () {}),
              VProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              VProfileMenu(
                  title: 'Date of Birth',
                  value: '01 Jan 1992',
                  onPressed: () {}),
              const Divider(),
              const SizedBox(height: VSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
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
