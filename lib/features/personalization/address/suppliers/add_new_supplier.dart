import 'package:flutter/cupertino.dart';

import '../add_new_person_form.dart';

class AddNewSupplierScreen extends StatelessWidget {
  const AddNewSupplierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddNewPersonForm(title: 'Add new Supplier');
  }
}
