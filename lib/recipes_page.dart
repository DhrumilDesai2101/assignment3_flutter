import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipesPage extends StatefulWidget {
  @override
  _RecipesPageState createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  String userInput = '';
  Map<String, dynamic>? recipeData;

  Future<void> fetchRecipeData() async {
    final apiKey = '23c21496a1mshefa237cddcaa2dap183941jsnefa4745e95b7';
    final url = Uri.parse('https://worldwide-recipes1.p.rapidapi.com/api/suggestions?q=$userInput');

    try {
      final response = await http.get(
        url,
        headers: {
          'X-RapidAPI-Host': 'worldwide-recipes1.p.rapidapi.com',
          'X-RapidAPI-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final decodedBody = json.decode(response.body);

        if (decodedBody is Map<String, dynamic>) {
          setState(() {
            recipeData = decodedBody;
          });
        } else {
          print('Failed to decode recipe data. Unexpected format.');
        }
      } else {
        print('Failed to fetch recipe data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching recipe data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recipes Page',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              TextField(
                onChanged: (value) {
                  setState(() {
                    userInput = value;
                  });
                },
                decoration: InputDecoration(labelText: 'Enter Recipe'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (userInput.isNotEmpty) {
                    fetchRecipeData();
                  }
                },
                child: Text('Get Recipe'),
              ),
              if (recipeData != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ingredients :'),
                    Text(recipeData!['results']['ingredients'].join(', ')),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
