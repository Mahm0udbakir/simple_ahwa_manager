import 'package:flutter/foundation.dart';
import '../models/order.dart';

class OrdersStore {
  OrdersStore._internal();
  static final OrdersStore instance = OrdersStore._internal();

  final ValueNotifier<List<Order>> orders = ValueNotifier<List<Order>>(<Order>[]);

  List<Order> get current => List<Order>.unmodifiable(orders.value);

  void addOrder(Order order) {
    orders.value = List<Order>.from(orders.value)..add(order);
  }

  void markServed(String orderId) {
    final List<Order> updated = List<Order>.from(orders.value);
    final int index = updated.indexWhere((o) => o.id == orderId);
    if (index == -1) return;
    updated[index] = updated[index].copyWith(isServed: true);
    orders.value = updated;
  }
}


