import 'package:flutter/material.dart';
import '../../../core/models/order.dart';
import '../../../core/data/orders_store.dart';

class SalesReportScreen extends StatelessWidget {
  const SalesReportScreen({super.key});

  int _totalServed(List<Order> orders) => orders.where((o) => o.isServed).length;

  Map<DrinkType, int> _drinkCounts(List<Order> orders) {
    final Map<DrinkType, int> counts = { for (final d in DrinkType.values) d: 0 };
    for (final order in orders.where((o) => o.isServed)) {
      counts[order.drinkType] = (counts[order.drinkType] ?? 0) + 1;
    }
    return counts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<List<Order>>(
          valueListenable: OrdersStore.instance.orders,
          builder: (context, orders, _) {
            final counts = _drinkCounts(orders);
            final sorted = counts.entries.toList()
              ..sort((a, b) => b.value.compareTo(a.value));
            final totalServed = _totalServed(orders);
            return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                leading: const Icon(Icons.check_circle, color: Colors.green),
                title: const Text('Total Orders Served'),
                trailing: Text('$totalServed'),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Top Selling Drinks',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: sorted.every((e) => e.value == 0)
                  ? const Center(child: Text('No sales yet'))
                  : ListView.separated(
                      itemCount: sorted.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final entry = sorted[index];
                        return ListTile(
                          title: Text(entry.key.label),
                          trailing: Text('${entry.value}'),
                        );
                      },
                    ),
            ),
          ],
        );
          },
        ),
      ),
    );
  }
}


