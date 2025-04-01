import 'package:flutter/material.dart';

class QueryBox extends StatefulWidget {
  @override
  _QueryBoxState createState() => _QueryBoxState();
}

class _QueryBoxState extends State<QueryBox> {
  String inputText = '';
  String outputText = '';

  void processQuery(String input) {
    // Implement your query processing logic here
    // For demonstration, let's just echo back the input
    setState(() {
      outputText = 'You entered: $input';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query Box Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  inputText = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter your query here',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              processQuery(inputText);
            },
            child: Text('Query'),
          ),
          SizedBox(height: 20),
          Text(
            outputText,
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}