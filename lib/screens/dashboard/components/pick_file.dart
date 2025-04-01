import 'dart:io';

import 'package:admin/utils/ernie_speed_128k_api/ernie_classify.dart';
import 'package:admin/utils/ernie_speed_128k_api/ernie_importance.dart';
import 'package:admin/utils/ernie_speed_128k_api/ernie_suggestion.dart';
import 'package:admin/utils/ernie_speed_128k_api/ernie_summarize.dart';
import 'package:docx_to_text/docx_to_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../../../main.dart';
import '../../../constants.dart';

class DocxFileReader extends StatefulWidget {
  @override
  _DocxFileReaderState createState() => _DocxFileReaderState();
}

class _DocxFileReaderState extends State<DocxFileReader> {
  File? _selectedFile;
  Uint8List? _webFileBytes;

  Future<void> _openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['docx'],
      // 确保在 Web 平台上也能正常工作
      withData: kIsWeb,
    );

    if (result != null) {
      setState(() {
        if (kIsWeb) {
          _webFileBytes = result.files.single.bytes;
        } else {
          _selectedFile = File(result.files.single.path!);
        }
      });
      _readDocxFile();
    }
  }

  Future<void> _readDocxFile() async {
    Uint8List? bytes;

    if (kIsWeb) {
      if (_webFileBytes != null) {
        bytes = _webFileBytes;
      }
    } else {
      if (_selectedFile != null) {
        bytes = await _selectedFile?.readAsBytes();
      }
    }

    if (bytes != null) {
      final text = docxToText(bytes, handleNumbering: true);
      // 使用splitLines方法分割字符串
      List<String> FeedbackText = text.split('\n');
      for (String line in FeedbackText) {
        var theme = await ernieClassify(line);
        var importance = await ernieImportance(line);
        var summarize = await ernieSummarize(line);
        var suggestion = await ernieSuggestion(line);

        final newFeedback = RecentFeedbackInfo(
          theme: theme,
          summarize: summarize,
          suggestion: suggestion,
        );

        switch (importance) {
          case '1':
            Provider.of<FeedbackData>(context, listen: false)
                .addFeedbackData1(newFeedback);
            break;
          case '2':
            Provider.of<FeedbackData>(context, listen: false)
                .addFeedbackData2(newFeedback);
            break;
          case '3':
            Provider.of<FeedbackData>(context, listen: false)
                .addFeedbackData3(newFeedback);
            break;
          case '4':
            Provider.of<FeedbackData>(context, listen: false)
                .addFeedbackData4(newFeedback);
            break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ElevatedButton.icon(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding * 1.2,
            ),
          ),
          minimumSize: MaterialStateProperty.all(Size(120, 50)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        onPressed: _openFileExplorer,
        icon: Icon(Icons.add, color: Colors.white),
        label: Text(
          "Upload File",
          style: TextStyle(color: Colors.white),
        ),
      ),
      SizedBox(width: defaultPadding), // 添加间距
    ]);
  }
}

void main() => runApp(MaterialApp(
      home: DocxFileReader(),
    ));