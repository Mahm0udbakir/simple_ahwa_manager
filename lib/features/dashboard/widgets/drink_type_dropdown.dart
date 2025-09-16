import 'package:flutter/material.dart';
import '../../../core/models/order.dart';

class DrinkTypeDropdown extends StatelessWidget {
  final DrinkType value;
  final ValueChanged<DrinkType> onChanged;

  const DrinkTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        labelText: 'Drink Type',
        border: OutlineInputBorder(),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<DrinkType>(
          value: value,
          isExpanded: true,
          items: DrinkType.values
              .map((d) => DropdownMenuItem(
                    value: d,
                    child: Text(d.label),
                  ))
              .toList(),
          onChanged: (v) {
            if (v != null) onChanged(v);
          },
        ),
      ),
    );
  }
}


