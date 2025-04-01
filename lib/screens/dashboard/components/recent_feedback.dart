import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../main.dart';

class RecentFeedback extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<RecentFeedbackInfo> feedbackData;

  RecentFeedback({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.feedbackData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/' + imagePath, height: 50,),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              columnSpacing: defaultPadding,
              columns: [
                DataColumn(
                  label: Text("Theme"),
                ),
                DataColumn(
                  label: Text("Summarise"),
                ),
                DataColumn(
                  label: Text("Suggestion"),
                ),
              ],
              rows: feedbackData.map((feedbackInfo) {
                return recentFileDataRow(feedbackInfo);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFeedbackInfo fileInfo) {
  return DataRow(
    cells: [
      DataCell(Text(fileInfo.theme ?? '')),
      DataCell(Text(fileInfo.summarize ?? '')),
      DataCell(Text(fileInfo.suggestion ?? '')),
    ],
  );
}
