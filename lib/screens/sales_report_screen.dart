import 'package:flutter/material.dart';
import '../models/order.dart';

class SalesReportScreen extends StatelessWidget {
  final List<Order> allOrders;

  const SalesReportScreen({super.key, required this.allOrders});

  int get totalServed => allOrders.where((o) => o.isServed).length;

  Map<DrinkType, int> get drinkCounts {
    final Map<DrinkType, int> counts = { for (final d in DrinkType.values) d: 0 };
    for (final order in allOrders.where((o) => o.isServed)) {
      counts[order.drinkType] = (counts[order.drinkType] ?? 0) + 1;
    }
    return counts;
  }

  @override
  Widget build(BuildContext context) {
    final counts = drinkCounts;
    final sorted = counts.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
        ),
      ),
    );
  }
}


