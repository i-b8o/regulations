import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'package:regulation_api/regulation_api.dart';

import 'paragraph_card.dart';

class ChapterPageBody extends StatelessWidget {
  const ChapterPageBody({
    Key? key,
    required this.header,
    required this.totalChapters,
    required this.pageController,
    required this.paragraphs,
    required int chapterOrderNum, required this.first, required this.last,
  }) : super(key: key);
  final String header;
  final int totalChapters;
  final bool first, last;

  final PageController pageController;
  final List<Paragraph> paragraphs;

  ParagraphCard _buildParagraphCard(Paragraph paragraph) {
    return ParagraphCard(paragraph: paragraph);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: paragraphs.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            color:  Constants.bodyColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: paragraphs[index].paragraphClass == "align_right"
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
                ),
                _buildParagraphCard(paragraphs[index])
              ],
            ),
          );
        } else if (index == (paragraphs.length - 1)) {
          return Container(
            color:  Constants.bodyColor,
            child: Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildParagraphCard(paragraphs[index]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      !first ? IconButton(
                          onPressed: () {
                            pageController.previousPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          icon: Icon(Icons.arrow_back_ios)) : Container(),
                      !last ? IconButton(
                          onPressed: () {
                            pageController.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.ease);
                          },
                          icon: Icon(Icons.arrow_forward_ios)) : Container()
                    ],
                  ),
                ),
                SizedBox(height: 25)
              ],
            ),
          );
        }
        return _buildParagraphCard(paragraphs[index]);
      },
    );
  }
}
