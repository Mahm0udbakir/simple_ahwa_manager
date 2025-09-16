import 'package:flutter/material.dart';
import '../../../core/models/order.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  final VoidCallback onMarkServed;

  const OrderListItem({
    super.key,
    required this.order,
    required this.onMarkServed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(order.customerName.isNotEmpty
            ? order.customerName[0].toUpperCase()
            : '?'),
      ),
      title: Text('${order.customerName} • ${order.drinkType.label}'),
      subtitle: order.specialInstructions.isEmpty
          ? null
          : Text(order.specialInstructions),
      trailing: IconButton(
        icon: const Icon(Icons.check_circle, color: Colors.green),
        tooltip: 'Mark served',
        onPressed: onMarkServed,
      ),
    );
  }
}


