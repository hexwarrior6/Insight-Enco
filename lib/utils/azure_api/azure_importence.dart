import 'dart:convert';

import 'package:http/http.dart' as http;

import 'azure_key.dart';

Future<String> azure_importance(String text) async {
  final String GPT4V_ENDPOINT =
      "https://uksouth.api.cognitive.microsoft.com/openai/deployments/111/chat/completions?api-version=2024-02-15-preview";

  // Prepare headers and payload
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "api-key": GPT4V_KEY,
  };

  Map<String, dynamic> payload = {
    "messages": [
      {
        "role": "system",
        "content": [
          {
            "type": "text",
            "text":
                "Classify the following feedback into 1 of the following categories: 1 is for \"Important & Urgent\", 2 is for \"Important & NOT Urgent\", 3 is for \"NOT Important & Urgent\", 4 is for \"NOT Important & NOT Urgent\", return me just one NUMBER."
          }
        ]
      },
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text": text,
          }
        ]
      },
    ],
    "temperature": 0.46,
    "top_p": 0.95,
    "max_tokens": 1
  };

  // Send request
  try {
    http.Response response = await http.post(Uri.parse(GPT4V_ENDPOINT),
        headers: headers, body: jsonEncode(payload));
    if (response.statusCode == 200) {
      // Parse JSON response
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Extract content from messages
      List<dynamic> choices = jsonResponse['choices'];
      for (var choice in choices) {
        Map<String, dynamic> message = choice['message'];
        String content = message['content'];
        print("ClassifySuccess!: $content");
        return content;
            }
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  } catch (e) {
    print('Failed to make the request. Error: $e');
  }
  return 'error';
}

Future<void> main() async {
  print(await azure_importance('The login system was too slow'));
}