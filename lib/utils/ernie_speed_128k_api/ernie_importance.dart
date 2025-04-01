import 'ernie_base.dart';

Future<String> ernieImportance(String text, {String? assistantMessage}) async {
  const systemPrompt = '''
  Classify the following feedback as:
  1 represents "important and urgent".
  2 represents "important but not urgent".
  3 represents "unimportant but urgent".
  4 represents "unimportant and not urgent".
  Only return a number, not anything else.
  For example:
  example 1:
  user: Logging into the system is too slow.
  assi: 1
  example 2:
  user: I forget my password.
  assi: 2
  ''';

  try {
    String result = await ErnieAPI.callErnieAPI(
      systemPrompt: systemPrompt,
      userMessage: text,
      assistantMessage: assistantMessage,
      maxTokens: 1,
    );
    
    // 提取结果中的数字
    RegExp regExp = RegExp(r'[1-4]');
    var match = regExp.firstMatch(result);
    if (match != null) {
      return match.group(0)!;
    } else {
      print('Unable to extract numbers from the result: $result');
      return result;
    }
  } catch (e) {
    print('Importance assessment failed: $e');
    return 'error';
  }
}

Future<void> main() async {
  print(await ernieImportance('Logging into the system is too slow.'));
}