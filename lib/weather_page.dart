import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String location = '';
  Map<String, dynamic>? weatherData;

  Future<void> fetchWeatherData() async {
    final apiKey = '23c21496a1mshefa237cddcaa2dap183941jsnefa4745e95b7';
    final url = Uri.parse('https://weatherapi-com.p.rapidapi.com/current.json?q=$location');

    try {
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
          'X-RapidAPI-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final decodedBody = json.decode(response.body);

        if (decodedBody is Map<String, dynamic>) {
          setState(() {
            weatherData = decodedBody;
          });
        } else {
          print('Failed to decode weather data. Unexpected format.');
        }
      } else {
        print('Failed to fetch weather data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching weather data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Weather Page',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    location = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Enter Location'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (location.isNotEmpty) {
                    fetchWeatherData();
                  }
                },
                child: Text('Fetch Weather'),
              ),
              if (weatherData != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Location: ${weatherData!['location']['name']}'),
                    Text('Temperature: ${weatherData!['current']['temp_c'].toStringAsFixed(1)}°C'),
                    Text('Weather: ${weatherData!['current']['condition']['text']}'),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
