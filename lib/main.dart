import 'package:admin/constants.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;

void main() async {
  // 初始化 dotenv
  await dotenv.dotenv.load(fileName: ".env");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'InsightEcho',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
          ChangeNotifierProvider(create: (_) => FeedbackData()),
        ],
        child: MainScreen(),
      ),
    );
  }
}

// 定义数据模型类
class RecentFeedbackInfo {
  final String? theme;
  final String? summarize;
  final String? suggestion;

  RecentFeedbackInfo({this.theme, this.summarize, this.suggestion});
}

// 定义数据管理器类
class FeedbackData extends ChangeNotifier {
  List<RecentFeedbackInfo> _feedbackData1 = [];
  List<RecentFeedbackInfo> _feedbackData2 = [];
  List<RecentFeedbackInfo> _feedbackData3 = [];
  List<RecentFeedbackInfo> _feedbackData4 = [];

  List<RecentFeedbackInfo> get feedbackData1 => _feedbackData1;
  List<RecentFeedbackInfo> get feedbackData2 => _feedbackData2;
  List<RecentFeedbackInfo> get feedbackData3 => _feedbackData3;
  List<RecentFeedbackInfo> get feedbackData4 => _feedbackData4;

  void addFeedbackData1(RecentFeedbackInfo info) {
    _feedbackData1.add(info);
    notifyListeners();
  }

  void addFeedbackData2(RecentFeedbackInfo info) {
    _feedbackData2.add(info);
    notifyListeners();
  }

  void addFeedbackData3(RecentFeedbackInfo info) {
    _feedbackData3.add(info);
    notifyListeners();
  }

  void addFeedbackData4(RecentFeedbackInfo info) {
    _feedbackData4.add(info);
    notifyListeners();
  }
}