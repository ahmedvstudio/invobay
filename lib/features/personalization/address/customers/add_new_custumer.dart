import 'package:flutter/cupertino.dart';

import '../add_new_form.dart';

class AddNewCustomerScreen extends StatelessWidget {
  const AddNewCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddNewForm(title: 'Add new Customer');
  }
}
