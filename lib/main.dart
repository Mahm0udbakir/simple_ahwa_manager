import 'package:flutter/material.dart';
import 'core/models/order.dart';
import 'features/dashboard/views/dashboard_screen.dart';
import 'features/dashboard/views/add_order_screen.dart';
import 'features/analysis/views/sales_report_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Ahwa Manager',

      home: const RootHome(),
    );
  }
}

class RootHome extends StatefulWidget {
  const RootHome({super.key});

  @override
  State<RootHome> createState() => _RootHomeState();
}

class _RootHomeState extends State<RootHome> {
  final List<Order> _orders = <Order>[];

  List<Order> get _pendingOrders => _orders.where((o) => !o.isServed).toList();

  void _addOrder(Order order) {
    setState(() {
      _orders.add(order);
    });
  }

  void _markServed(String orderId) {
    final index = _orders.indexWhere((o) => o.id == orderId);
    if (index == -1) return;
    setState(() {
      _orders[index] = _orders[index].copyWith(isServed: true);
    });
  }

  void _openAddOrder(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => AddOrderScreen(onSubmit: _addOrder),
      ),
    );
  }

  void _openSalesReport(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SalesReportScreen(allOrders: _orders),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      pendingOrders: _pendingOrders,
      onAddOrder: () => _openAddOrder(context),
      onOpenSalesReport: () => _openSalesReport(context),
      onMarkServed: _markServed,
    );
  }
}
