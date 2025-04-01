import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ErnieAPI {
  static String? _cachedAccessToken;
  static DateTime? _tokenExpiryTime;

  static Future<String> _getAccessToken() async {
    // 如果token存在且未过期，直接返回缓存的token
    if (_cachedAccessToken != null && 
        _tokenExpiryTime != null && 
        _tokenExpiryTime!.isAfter(DateTime.now())) {
      return _cachedAccessToken!;
    }

    final String ERNIE_API_KEY = dotenv.get('ERNIE_API_KEY');
    final String ERNIE_SECRET_KEY = dotenv.get('ERNIE_SECRET_KEY');
    final authUrl = Uri.parse(
        'https://aip.baidubce.com/oauth/2.0/token?grant_type=client_credentials&client_id=$ERNIE_API_KEY&client_secret=$ERNIE_SECRET_KEY');

    try {
      final response = await http.post(authUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _cachedAccessToken = data['access_token'];
        // 假设token有效期为30天（百度API通常为30天）
        _tokenExpiryTime = DateTime.now().add(Duration(days: 30));
        return _cachedAccessToken!;
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
    double temperature = 0.9,
    int maxTokens = 300,
  }) async {
    final accessToken = await _getAccessToken();
    final apiUrl = Uri.parse(
        'https://aip.baidubce.com/rpc/2.0/ai_custom/v1/wenxinworkshop/chat/ernie-lite-8k?access_token=$accessToken');

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
      'system': "I am a engineer form NewZealand, you should only answer me in English no matter what because I only understand English, do not use Chinese, " + systemPrompt,  // 系统提示作为单独的参数
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