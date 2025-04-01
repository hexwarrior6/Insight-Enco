import 'ernie_base.dart';

Future<String> ernieClassify(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
  Classify the following feedback into 1 of the following categories: 
  Technical support, system stability, user experience, feature requests and enhancement,
  security, training and documentation, cost-effectiveness, overall satisfaction,
  return me just one word, do not explain.
  ''';

  try {
    return await ErnieAPI.callErnieAPI(
      systemPrompt: systemPrompt,
      userMessage: text,
      assistantMessage: assistantMessage,
      maxTokens: 30,
    );
  } catch (e) {
    print('Classification failed: $e');
    return 'error';
  }
}

Future<void> main() async {
  print(await ernieClassify('The login system is too slow.'));
}