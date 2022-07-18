import 'package:flutter/material.dart';
import 'package:regulation_api/regulation_api.dart';

class ChapterPageBodyHeader extends StatelessWidget {
  const ChapterPageBodyHeader({
    Key? key,
    required this.paragraphs,
    required this.header,
    required this.pClass,
  }) : super(key: key);

  final List<Paragraph> paragraphs;
  final String header, pClass;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: pClass == "align_right"
          ? EdgeInsets.all(25.0)
          : EdgeInsets.only(top: 50.0, left: 8.0, right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Text(
            header,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 17.0),
          )),
        ],
      ),
    );
  }
}
