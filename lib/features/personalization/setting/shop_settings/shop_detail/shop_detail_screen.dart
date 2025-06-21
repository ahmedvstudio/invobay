import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/common/styles/spacing_style.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import 'package:invobay/core/utils/messages/toast.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../core/database/hive/shop_details/shop_details.dart';
import '../../../../../core/providers/db_providers/hive_providers/shop_detail_provider.dart';
import '../address/widgets/address_form.dart';

class ShopDetailScreen extends ConsumerStatefulWidget {
  const ShopDetailScreen({super.key});

  @override
  ConsumerState<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends ConsumerState<ShopDetailScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController;
  late final TextEditingController phoneController;
  late final TextEditingController extraPhoneController;
  late final TextEditingController streetController;
  late final TextEditingController cityController;
  late final TextEditingController stateController;
  late final TextEditingController countryController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    phoneController = TextEditingController();
    extraPhoneController = TextEditingController();
    streetController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    descriptionController = TextEditingController();

    // Listen to shop details changes and update controllers accordingly
    ref.read(shopDetailProvider.notifier).loadShopDetails();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    extraPhoneController.dispose();
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    countryController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shopDetailAsync = ref.watch(shopDetailProvider);

    return Scaffold(
      appBar: VAppBar(
        showBackArrow: true,
        title: Text(context.loc.shopDetails),
      ),
      body: SingleChildScrollView(
        padding: VSpacingStyle.all,
        child: Form(
          key: _formKey,
          child: shopDetailAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) =>
                Center(child: Text('${context.loc.error}: $err')),
            data: (savedDetail) {
              if (nameController.text.isEmpty) {
                nameController.text = savedDetail?.name ?? '';
              }
              if (phoneController.text.isEmpty) {
                phoneController.text = savedDetail?.phone ?? '';
              }
              if (extraPhoneController.text.isEmpty) {
                extraPhoneController.text = savedDetail?.extraPhone ?? '';
              }
              if (streetController.text.isEmpty) {
                streetController.text = savedDetail?.street ?? '';
              }

              if (cityController.text.isEmpty) {
                cityController.text = savedDetail?.city ?? '';
              }
              if (stateController.text.isEmpty) {
                stateController.text = savedDetail?.state ?? '';
              }
              if (countryController.text.isEmpty) {
                countryController.text = savedDetail?.country ?? '';
              }
              if (descriptionController.text.isEmpty) {
                descriptionController.text = savedDetail?.description ?? '';
              }

              return AddressForm(
                withDescription: true,
                nameController: nameController,
                phoneController: phoneController,
                streetController: streetController,
                cityController: cityController,
                stateController: stateController,
                countryController: countryController,
                descriptionController: descriptionController,
                extraPhoneNumberController: extraPhoneController,
                buttonText: context.loc.save,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final shopDetail = ShopDetail(
                      name: nameController.text,
                      phone: phoneController.text,
                      street: streetController.text,
                      city: cityController.text,
                      state: stateController.text,
                      country: countryController.text,
                      description: descriptionController.text,
                      extraPhone: extraPhoneController.text,
                    );

                    await ref
                        .read(shopDetailProvider.notifier)
                        .updateShopDetails(shopDetail);
                    if (context.mounted) {
                      VToast.info(message: context.loc.shopDetailsSaved);

                      context.pop();
                    }
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
