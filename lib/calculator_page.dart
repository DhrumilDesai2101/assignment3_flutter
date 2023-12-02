import 'package:flutter/material.dart';

class CalculatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simple Calculator',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            // Your calculator widgets go here
          ],
        ),
      ),
    );
  }
}
