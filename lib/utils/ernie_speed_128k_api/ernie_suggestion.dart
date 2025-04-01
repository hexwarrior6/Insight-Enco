import 'ernie_base.dart';

Future<String> ernieSuggestion(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
    ICT Architect: Generate 6-word solutions using [Tech]-[Method]>[Metric] | Hybrid-infra priority with ITIL/ISO specs | Ex: SD-WAN+zero-trust>latency30ms | Exclude marketing/theoretical terms;
    for example: 5G-edge encrypted computing>99.999% uptime
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