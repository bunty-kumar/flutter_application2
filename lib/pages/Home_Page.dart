import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String name = "silent coder";
    return Scaffold(
      appBar: AppBar(title: Text("My App")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            "Welcome to $days days of flutter by $name",
            style: TextStyle(fontSize: 24),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
