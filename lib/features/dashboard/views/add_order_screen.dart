import 'package:flutter/material.dart';
import '../../../core/models/order.dart';
import '../../../core/data/orders_store.dart';
import '../widgets/labeled_text_field.dart';
import '../widgets/drink_type_dropdown.dart';

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();
  DrinkType _selectedDrink = DrinkType.tea;

  @override
  void dispose() {
    _nameController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      customerName: _nameController.text.trim(),
      drinkType: _selectedDrink,
      specialInstructions: _instructionsController.text.trim(),
    );
    OrdersStore.instance.addOrder(order);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Order'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              LabeledTextField(
                controller: _nameController,
                label: 'Customer Name',
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DrinkTypeDropdown(
                value: _selectedDrink,
                onChanged: (d) => setState(() => _selectedDrink = d),
              ),
              const SizedBox(height: 16),
              LabeledTextField(
                controller: _instructionsController,
                label: 'Special Instructions',
                minLines: 2,
                maxLines: 4,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.check),
                label: const Text('Add Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


