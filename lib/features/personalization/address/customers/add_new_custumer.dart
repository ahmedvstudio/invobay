import 'package:flutter/cupertino.dart';

import '../add_new_person_form.dart';

class AddNewCustomerScreen extends StatelessWidget {
  const AddNewCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddNewPersonForm(title: 'Add new Customer');
  }
}
