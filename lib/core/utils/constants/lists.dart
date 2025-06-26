import 'package:flutter/cupertino.dart';
import 'package:invobay/core/utils/extensions/localization_extension.dart';

class VLists {
  VLists._();

  // --> Item Unit List
  static List<String> unitList = [
        'Piece',
        'KG',
        'Bag',
        'Meter',
        'Litre',
      ];

  // --> Colors
  static const List<Color> themeColors = [
    Color(0xFF247d8d),
    Color(0xFF388e3c),
    Color(0xff35b19a),
    Color(0xFF4b68ff),
    Color(0xFFd32f2f),
    Color(0xFFf57c00),
    Color(0xff6a35b1),
    Color(0xffb135ab),
    Color(0xffb1356d),
    Color(0xff545454),
  ];

  //
  static final languages = [
    {'code': 'en', 'label': 'English'},
    {'code': 'ar', 'label': 'العربية'},
  ];

  //
  static Map<String, String> notificationLabels(BuildContext context) => {
        'all': context.loc.allNotifications,
        'low_stock': context.loc.lowStock,
        'out_of_stock': context.loc.outOfStock,
        'sell_checkout': context.loc.sellCheckout,
        'buy_checkout': context.loc.buyCheckout,
        'return_checkout': context.loc.returnCheckout,
      };
}
