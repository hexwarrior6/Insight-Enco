import 'ernie_base.dart';

Future<String> ernieSummarize(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
    Generate 6-word technical summaries using: [Technology][Impact][Solution];
    for example: "Cloud authentication latency cryptographic resolution"
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