import 'package:flutter/material.dart';

class AstronomyPage extends StatefulWidget {
  @override
  _AstronomyPageState createState() => _AstronomyPageState();
}

class _AstronomyPageState extends State<AstronomyPage> {
  String city = '';
  Map<String, dynamic>? astronomyData;

  void fetchAstronomyData() {
    // Placeholder for data, replace with actual data fetching logic
    // Note: Ensure to handle errors appropriately in a production app
    setState(() {
      astronomyData = {
        'location': {'name': 'City Name', 'region': 'Region', 'country': 'Country'},
        'astronomy': {
          'astro': {
            'sunrise': 'Sunrise Time',
            'sunset': 'Sunset Time',
            'moonrise': 'Moonrise Time',
            'moonset': 'Moonset Time',
            'moon_phase': 'Moon Phase',
          },
        },
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Astronomy Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Astronomy Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (city.isNotEmpty) {
                  fetchAstronomyData();
                }
              },
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 20),
            if (astronomyData != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name: ${astronomyData!['location']['name']}'),
                      Text('Region: ${astronomyData!['location']['region']}'),
                      Text('Country: ${astronomyData!['location']['country']}'),
                      Text('Sunrise: ${astronomyData!['astronomy']['astro']['sunrise']}'),
                      Text('Sunset: ${astronomyData!['astronomy']['astro']['sunset']}'),
                      Text('Moonrise: ${astronomyData!['astronomy']['astro']['moonrise']}'),
                      Text('Moonset: ${astronomyData!['astronomy']['astro']['moonset']}'),
                      Text('Moon Phase: ${astronomyData!['astronomy']['astro']['moon_phase']}'),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
