import 'package:flutter/material.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('image'),
      ),
      body: Image.asset(
        'assets/images/plan.jpg',
        width: 600,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
