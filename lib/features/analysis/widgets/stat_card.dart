import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.check_circle, color: Colors.green),
        title: Text(title),
        trailing: Text(value),
      ),
    );
  }
}


