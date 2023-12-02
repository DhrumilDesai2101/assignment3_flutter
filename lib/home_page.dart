// home_page.dart

import 'package:flutter/material.dart';
import 'Astronomy.dart';
import 'weather_page.dart';
import 'recipes_page.dart';
import 'thank_you_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AstronomyPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Astronomy',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Weather',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RecipesPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Recipes',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThankYouPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.all(16.0),
                ),
                child: Text(
                  'Thank You',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
