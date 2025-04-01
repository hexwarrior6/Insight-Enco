import 'ernie_base.dart';

Future<String> ernieSuggestion(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
  I am a ICT staff, I am looking forward some feasible suggestions to solving this problem(using totally around 6 words would be enough)
  ''';

  try {
    return await ErnieAPI.callErnieAPI(
      systemPrompt: systemPrompt,
      userMessage: text,
      assistantMessage: assistantMessage,
      maxTokens: 30,
    );
  } catch (e) {
    print('Suggestion acquisition failed: $e');
    return 'error';
  }
}

Future<void> main() async {
  print(await ernieSuggestion('The login system is too slow.'));
}