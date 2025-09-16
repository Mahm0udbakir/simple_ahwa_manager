import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/order.dart';
import '../../../core/data/orders_store.dart';
import '../../../core/routes/routes.dart';
import '../widgets/order_list_item.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            tooltip: 'Sales Report',
            onPressed: () => context.go(Routes.salesReport),
          )
        ],
      ),
      body: ValueListenableBuilder<List<Order>>(
        valueListenable: OrdersStore.instance.orders,
        builder: (context, orders, _) {
          final pendingOrders = orders.where((o) => !o.isServed).toList();
          if (pendingOrders.isEmpty) {
            return const Center(child: Text('No pending orders'));
          }
          return ListView.separated(
            itemCount: pendingOrders.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final order = pendingOrders[index];
              return OrderListItem(
                order: order,
                onMarkServed: () => OrdersStore.instance.markServed(order.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go(Routes.addOrder),
        icon: const Icon(Icons.add),
        label: const Text('Add Order'),
      ),
    );
  }
}


