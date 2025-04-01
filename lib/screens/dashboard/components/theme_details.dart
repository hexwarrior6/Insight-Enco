import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'chart.dart';
import 'theme_info_card.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
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
          Text(
            "Theme Details",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),
          ThemeInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Technical support",
            amountOfFiles: "12",
            numOfFiles: 4,
          ),
          ThemeInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "system stability",
            amountOfFiles: "4",
            numOfFiles: 1,
          ),
          ThemeInfoCard(
            svgSrc: "assets/icons/folder.svg",
            title: "user experience",
            amountOfFiles: "6",
            numOfFiles: 2,
          ),
          ThemeInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "security",
            amountOfFiles: "5",
            numOfFiles: 1,
          ),
        ],
      ),
    );
  }
}
