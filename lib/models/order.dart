import 'package:flutter/foundation.dart';

enum DrinkType {
  tea,
  coffee,
  espresso,
  cappuccino,
  latte,
  juice,
}

@immutable
class Order {
  final String id;
  final String customerName;
  final DrinkType drinkType;
  final String specialInstructions;
  final bool isServed;

  const Order({
    required this.id,
    required this.customerName,
    required this.drinkType,
    this.specialInstructions = '',
    this.isServed = false,
  });

  Order copyWith({
    String? id,
    String? customerName,
    DrinkType? drinkType,
    String? specialInstructions,
    bool? isServed,
  }) {
    return Order(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      drinkType: drinkType ?? this.drinkType,
      specialInstructions: specialInstructions ?? this.specialInstructions,
      isServed: isServed ?? this.isServed,
    );
  }
}

extension DrinkTypeDisplay on DrinkType {
  String get label {
    switch (this) {
      case DrinkType.tea:
        return 'Tea';
      case DrinkType.coffee:
        return 'Coffee';
      case DrinkType.espresso:
        return 'Espresso';
      case DrinkType.cappuccino:
        return 'Cappuccino';
      case DrinkType.latte:
        return 'Latte';
      case DrinkType.juice:
        return 'Juice';
    }
  }
}


