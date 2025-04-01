// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // 定义数据模型类
// class RecentFeedbackInfo {
//   final String? theme;
//   final String? summarize;
//   final String? suggestion;
//
//   RecentFeedbackInfo({this.theme, this.summarize, this.suggestion});
// }
//
// // 定义数据管理器类
// class FeedbackData extends ChangeNotifier {
//   List<RecentFeedbackInfo> _feedbackData1 = [];
//   List<RecentFeedbackInfo> _feedbackData2 = [];
//   List<RecentFeedbackInfo> _feedbackData3 = [];
//   List<RecentFeedbackInfo> _feedbackData4 = [];
//
//   List<RecentFeedbackInfo> get feedbackData1 => _feedbackData1;
//   List<RecentFeedbackInfo> get feedbackData2 => _feedbackData2;
//   List<RecentFeedbackInfo> get feedbackData3 => _feedbackData3;
//   List<RecentFeedbackInfo> get feedbackData4 => _feedbackData4;
//
//   void addFeedbackData1(RecentFeedbackInfo info) {
//     _feedbackData1.add(info);
//     notifyListeners();
//   }
//
//   void addFeedbackData2(RecentFeedbackInfo info) {
//     _feedbackData2.add(info);
//     notifyListeners();
//   }
//
//   void addFeedbackData3(RecentFeedbackInfo info) {
//     _feedbackData3.add(info);
//     notifyListeners();
//   }
//
//   void addFeedbackData4(RecentFeedbackInfo info) {
//     _feedbackData4.add(info);
//     notifyListeners();
//   }
// }
//
// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => FeedbackData(),
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Provider Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Recent Feedback'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Expanded(
//                 child: Consumer<FeedbackData>(
//                   builder: (context, feedbackData, child) {
//                     return ListView.builder(
//                       itemCount: feedbackData.feedbackData1.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(feedbackData.feedbackData1[index].theme ?? ''),
//                           subtitle: Text(feedbackData.feedbackData1[index].summarize ?? ''),
//                           trailing: IconButton(
//                             icon: Icon(Icons.delete),
//                             onPressed: () {
//                               // feedbackData.removeFeedbackData1(index);
//                             },
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               // Add more Consumer widgets for other feedback lists (data 2, 3, 4)
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Example of adding data
//             final newFeedback = RecentFeedbackInfo(
//               theme: 'Theme',
//               summarize: 'Summarize',
//               suggestion: 'Suggestion',
//             );
//             Provider.of<FeedbackData>(context, listen: false).addFeedbackData1(newFeedback);
//           },
//           tooltip: 'Add Feedback',
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }
//
//
// List<RecentFeedbackInfo> FeedbackData11223 = [
//   RecentFeedbackInfo(
//     theme: "XD File",
//     summarize: "01-03-2021",
//     suggestion: "3.5mb",
//   ),
//   RecentFeedbackInfo(
//     theme: "Figma File",
//     summarize: "27-02-2021",
//     suggestion: "19.0mb",
//   ),
//   RecentFeedbackInfo(
//     theme: "Document",
//     summarize: "23-02-2021",
//     suggestion: "32.5mb",
//   ),
//   RecentFeedbackInfo(
//     theme: "Sound File",
//     summarize: "21-02-2021",
//     suggestion: "3.5mb",
//   ),
//   RecentFeedbackInfo(
//     theme: "Media File",
//     summarize: "23-02-2021",
//     suggestion: "2.5gb",
//   ),
//   RecentFeedbackInfo(
//     theme: "Sales PDF",
//     summarize: "25-02-2021",
//     suggestion: "3.5mb",
//   ),
//   RecentFeedbackInfo(
//     theme: "Excel File",
//     summarize: "25-02-2021",
//     suggestion: "34.5mb",
//   ),
// ];
