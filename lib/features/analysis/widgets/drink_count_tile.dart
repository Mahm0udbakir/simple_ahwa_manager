import 'package:flutter/material.dart';

class DrinkCountTile extends StatelessWidget {
  final String label;
  final int count;

  const DrinkCountTile({
    super.key,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Text('$count'),
    );
  }
}


