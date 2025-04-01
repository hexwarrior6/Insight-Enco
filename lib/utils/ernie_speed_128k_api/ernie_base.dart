import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ErnieAPI {
  static Future<String> _getAccessToken() async {
    final String ERNIE_API_KEY = dotenv.get('ERNIE_API_KEY');
    final String ERNIE_SECRET_KEY = dotenv.get('ERNIE_SECRET_KEY');
    final authUrl = Uri.parse(
        'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=$ERNIE_API_KEY&client_secret=$ERNIE_SECRET_KEY');

    try {
      final response = await http.post(authUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['access_token'];
      }
      throw Exception('Failed to get access token: ${response.statusCode}');
    } catch (e) {
      throw Exception('Token request error: $e');
    }
  }

  static Future<String> callErnieAPI({
    required String systemPrompt,
    required String userMessage,
    String? assistantMessage,
    double temperature = 0.5,
    int maxTokens = 300,
  }) async {
    final accessToken = await _getAccessToken();
    final apiUrl = Uri.parse(
        'https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/ernie-speed-128k?access_token=$accessToken');

    final headers = {'Content-Type': 'application/json'};
    
    // 构建消息数组
    final messages = <Map<String, String>>[];
    
    // 添加用户消息
    messages.add({'role': 'user', 'content': userMessage});
    
    // 如果有助手回复，添加到消息中
    if (assistantMessage != null && assistantMessage.isNotEmpty) {
      messages.add({'role': 'assistant', 'content': assistantMessage});
    }
    
    final payload = {
      'messages': messages,
      'system': "Answer me in English no matter what because I only understand English, do not use Chinese!!!;" + systemPrompt,  // 系统提示作为单独的参数
      'temperature': temperature,
      'max_tokens': maxTokens,
    };

    try {
      final response = await http.post(
        apiUrl,
        headers: headers,
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['result'];
      }
      throw Exception('API request failed: ${response.statusCode}');
    } catch (e) {
      throw Exception('API call error: $e');
    }
  }
}