import 'ernie_base.dart';

Future<String> ernieChat(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
  You need to assist ICT staff in obtaining customer feedback and resolving related issues.
  ''';

  try {
    return await ErnieAPI.callErnieAPI(
      systemPrompt: systemPrompt,
      userMessage: text,
      assistantMessage: assistantMessage,
      maxTokens: 300,
    );
  } catch (e) {
    print('Chat request failed: $e');
    return 'error';
  }
}

Future<void> main() async {
  print(await ernieChat('How to deal with the problem that the login system is too slow'));
}