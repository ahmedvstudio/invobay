import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:invobay/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:invobay/core/utils/constants/sizes.dart';
import 'package:invobay/common/widgets/appbar/main_appbar.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';
import '../../common/widgets/item_cards/item_listview.dart';
import '../../common/widgets/text_field/search_bar.dart';
import '../../core/database/drift/app_database.dart';
import '../../core/providers/item_providers/item_related_providers.dart';
import '../../core/providers/theme_providers/theme_related_providers.dart';
import '../../core/router/router_constant.dart';
import '../../core/utils/constants/enums.dart';
import 'widgets/sorting_menu.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({
    super.key,
    this.openSearch = false,
  });

  final bool openSearch;
  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  SortCategory _selectedSortCategory = SortCategory.name;
  SortOrder _selectedSortOrder = SortOrder.ascending;

  @override
  void initState() {
    super.initState();
    if (widget.openSearch) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _searchFocusNode.requestFocus();
      });
    }
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {});
  }

  void _editItem(BuildContext context, int itemId) {
    context.pushNamed(
      VRouter.editItem,
      pathParameters: {'id': itemId.toString()},
    );
  }

  void _deleteItem(WidgetRef ref, int itemId) {
    ref.read(itemNotifierProvider.notifier).deleteItem(itemId);
  }

  void _toggleSortOrder(SortCategory category) {
    setState(() {
      if (_selectedSortCategory == category) {
        _selectedSortOrder = _selectedSortOrder == SortOrder.ascending
            ? SortOrder.descending
            : SortOrder.ascending;
      } else {
        _selectedSortCategory = category;
        _selectedSortOrder = SortOrder.ascending;
      }
    });
  }

  void _clearFilters() {
    setState(() {
      _selectedSortCategory = SortCategory.name;
      _selectedSortOrder = SortOrder.ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    final allItems = ref.watch(itemNotifierProvider);
    final primaryColor = ref.watch(primaryColorProvider);

    final query = _searchController.text.toLowerCase();
    List<Item> filteredItems = allItems
        .where((item) => item.name.toLowerCase().contains(query))
        .toList();

    filteredItems.sort((a, b) {
      int compare;
      switch (_selectedSortCategory) {
        case SortCategory.name:
          compare = a.name.toLowerCase().compareTo(b.name.toLowerCase());
          break;
        case SortCategory.stock:
          compare = a.quantity.compareTo(b.quantity);
          break;
        case SortCategory.price:
          compare = a.sellingPrice.compareTo(b.sellingPrice);
          break;
      }
      return _selectedSortOrder == SortOrder.ascending ? compare : -compare;
    });

    return Scaffold(
      body: Column(
        children: [
          VPrimaryHeaderContainer(
            child: Column(
              children: [
                VMainAppBar(title: context.loc.inventory),
                const SizedBox(height: VSizes.spaceBtwItems),
                VSearchBar(
                  searchController: _searchController,
                  focusNode: _searchFocusNode,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.filter_list_sharp),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SortFilterDialog(
                            selectedSortCategory: _selectedSortCategory,
                            selectedSortOrder: _selectedSortOrder,
                            onSortSelected: _toggleSortOrder,
                            onClearFilters: _clearFilters,
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(height: VSizes.spaceBtwSections * 1.5),
              ],
            ),
          ),
          ItemListView(
            items: filteredItems,
            onEdit: _editItem,
            onDelete: (context, itemId) => _deleteItem(ref, itemId),
            ref: ref,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => context.pushNamed(VRouter.addItem,
            pathParameters: {'itemName': 'itemName'}),
        child: const Icon(Iconsax.add),
      ),
    );
  }
}
