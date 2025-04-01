import 'ernie_base.dart';

Future<String> ernieSummarize(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
  I am an ICT worker and need a brief summary of this issue (totally around 6 words).
  ''';

  try {
    return await ErnieAPI.callErnieAPI(
      systemPrompt: systemPrompt,
      userMessage: text,
      assistantMessage: assistantMessage,
      maxTokens: 20,
    );
  } catch (e) {
    print('summary failure: $e');
    return 'error';
  }
}

Future<void> main() async {
  print(await ernieSummarize('The login system is too slow.'));
}