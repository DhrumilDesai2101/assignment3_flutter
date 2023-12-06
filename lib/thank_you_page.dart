import 'package:flutter/material.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thank You'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Thank You Image
            Image.asset(
              'assets/thankyou.jpeg', // Corrected path and file name
             width: 400,
             height: 400,
             fit: BoxFit.contain,  // Adjust the height as needed
            ),
            SizedBox(height: 20), // Add some spacing

            // Thank You Text
            Text(
              'Thank You',
              style: TextStyle(
                fontSize: 24, // Adjust the font size as needed
                fontWeight: FontWeight.bold,
              ),
            ),
            
            SizedBox(height: 10), // Add some spacing
            
            // Page Content
            Text(
              'We appreciate your visit!',
              style: TextStyle(
                fontSize: 18, // Adjust the font size as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
