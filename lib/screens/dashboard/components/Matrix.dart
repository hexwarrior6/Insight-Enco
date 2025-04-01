import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../main.dart';
import '../components/recent_feedback.dart';

class Matrix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Consumer<FeedbackData>(
                    builder: (context, feedbackData, child) {
                      List<RecentFeedbackInfo> feedbackList =
                          feedbackData.feedbackData1;
                      return RecentFeedback(
                        imagePath: 'Important1.png',
                        title: '  Important & Urgent',
                        feedbackData: feedbackList,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Consumer<FeedbackData>(
                    builder: (context, feedbackData, child) {
                      List<RecentFeedbackInfo> feedbackList =
                          feedbackData.feedbackData2;
                      return RecentFeedback(
                        imagePath: 'Important2.png',
                        title: '  Important & NOT Urgent',
                        feedbackData: feedbackList,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Consumer<FeedbackData>(
                    builder: (context, feedbackData, child) {
                      List<RecentFeedbackInfo> feedbackList =
                          feedbackData.feedbackData3;
                      return RecentFeedback(
                        imagePath: 'Important3.png',
                        title: '  NOT Important & Urgent',
                        feedbackData: feedbackList,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Consumer<FeedbackData>(
                    builder: (context, feedbackData, child) {
                      List<RecentFeedbackInfo> feedbackList =
                          feedbackData.feedbackData4;
                      return RecentFeedback(
                        imagePath: 'Important4.png',
                        title: '  NOT Important & NOT Urgent',
                        feedbackData: feedbackList,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}