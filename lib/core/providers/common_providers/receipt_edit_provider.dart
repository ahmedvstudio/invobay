import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/receipt_edit_controller.dart';
import '../../models/state_models/receipt_edit_model.dart';

final receiptEditProvider =
    StateNotifierProvider.autoDispose<ReceiptEditController, ReceiptEditState>(
  (ref) => ReceiptEditController(),
);
