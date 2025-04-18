import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:invobay/core/utils/constants/colors.dart';
import 'package:invobay/core/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../core/database/hive/shop_details/shop_details.dart';
import '../../../../core/providers/common_providers/default_providers.dart';
import '../../../../core/providers/db_providers/hive_providers/shop_detail_provider.dart';
import '../../../../core/utils/constants/sizes.dart';
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
  late final TextEditingController streetController;
  late final TextEditingController currencySignController;
  late final TextEditingController cityController;
  late final TextEditingController stateController;
  late final TextEditingController countryController;
  late final TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    final currencySign = ref.read(currencySignProvider);

    nameController = TextEditingController();
    phoneController = TextEditingController();
    streetController = TextEditingController();
    currencySignController = TextEditingController(text: currencySign);
    cityController = TextEditingController();
    stateController = TextEditingController();
    countryController = TextEditingController();
    descriptionController = TextEditingController();

    currencySignController.addListener(() {
      ref.read(currencySignProvider.notifier).state =
          currencySignController.text;
    });
    // Listen to shop details changes and update controllers accordingly
    ref.read(shopDetailProvider.notifier).loadShopDetails();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    streetController.dispose();
    currencySignController.dispose();
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
      appBar: const VAppBar(
        showBackArrow: true,
        title: Text('Shop Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(VSizes.defaultSpace),
        child: Form(
          key: _formKey,
          child: shopDetailAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
            data: (savedDetail) {
              if (nameController.text.isEmpty) {
                nameController.text = savedDetail?.name ?? '';
              }
              if (phoneController.text.isEmpty) {
                phoneController.text = savedDetail?.phone ?? '';
              }
              if (streetController.text.isEmpty) {
                streetController.text = savedDetail?.street ?? '';
              }

              if (currencySignController.text.isEmpty &&
                  savedDetail?.currencySign != null) {
                currencySignController.text = savedDetail!.currencySign;
                ref.read(currencySignProvider.notifier).state =
                    savedDetail.currencySign;
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
                currencySign: true,
                withDescription: true,
                nameController: nameController,
                phoneController: phoneController,
                streetController: streetController,
                postalCodeController: currencySignController,
                cityController: cityController,
                stateController: stateController,
                countryController: countryController,
                descriptionController: descriptionController,
                buttonText: 'Save',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final shopDetail = ShopDetail(
                      name: nameController.text,
                      phone: phoneController.text,
                      street: streetController.text,
                      currencySign: currencySignController.text,
                      city: cityController.text,
                      state: stateController.text,
                      country: countryController.text,
                      description: descriptionController.text,
                    );

                    await ref
                        .read(shopDetailProvider.notifier)
                        .updateShopDetails(shopDetail);

                    // Update the currencySignProvider with the new value
                    ref.read(currencySignProvider.notifier).state =
                        currencySignController.text;

                    VHelperFunctions.showToasty(
                      message: 'Shop details saved',
                      backgroundColor: VColors.info,
                    );

                    if (!context.mounted) return;
                    context.pop();
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
