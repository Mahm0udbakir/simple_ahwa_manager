import 'package:flutter/material.dart';
import '../models/order.dart';

class DashboardScreen extends StatelessWidget {
  final List<Order> pendingOrders;
  final VoidCallback onAddOrder;
  final VoidCallback onOpenSalesReport;
  final void Function(String orderId) onMarkServed;

  const DashboardScreen({
    super.key,
    required this.pendingOrders,
    required this.onAddOrder,
    required this.onOpenSalesReport,
    required this.onMarkServed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Sales Report',
            onPressed: onOpenSalesReport,
          )
        ],
      ),
      body: pendingOrders.isEmpty
          ? const Center(child: Text('No pending orders'))
          : ListView.separated(
              itemCount: pendingOrders.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final order = pendingOrders[index];
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
                    onPressed: () => onMarkServed(order.id),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onAddOrder,
        icon: const Icon(Icons.add),
        label: const Text('Add Order'),
      ),
    );
  }
}


