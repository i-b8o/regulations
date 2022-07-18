import 'package:flutter/material.dart';
import 'package:regulation_api/regulation_api.dart';
import '../../../constants.dart';
import '../../../table_of_contents/widgets/chapter_page_body_btns.dart';
import '../../../table_of_contents/widgets/chapter_page_body_header.dart';
import 'paragraph_card.dart';

class ChapterPageBody extends StatelessWidget {
  ChapterPageBody({
    Key? key,
    required this.header,
    required this.totalChapters,
    required this.pageController,
    required this.paragraphs,
    required int chapterOrderNum,
    required this.first,
    required this.last,
  }) : super(key: key);
  final String header;
  final int totalChapters;
  final bool first, last;

  final PageController pageController;
  final List<Paragraph> paragraphs;

// TODO scroll to table paragraph after table collapse
  ParagraphCard _buildParagraphCard(Paragraph paragraph) {
    return ParagraphCard(paragraph: paragraph);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: paragraphs.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChapterPageBodyHeader(
                paragraphs: paragraphs,
                header: header,
                pClass: paragraphs[index].paragraphClass,
              ),
              _buildParagraphCard(paragraphs[index]),
              paragraphs.length == 1 ? ChapterPageBodyBtns(first: first, pageController: pageController, last: last): Container()
            ],
          );
        } else if ((index == (paragraphs.length - 1))) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildParagraphCard(paragraphs[index]),
              ChapterPageBodyBtns(
                  first: first,
                  pageController: pageController,
                  last: last),
              SizedBox(height: 25)
            ],
          );
        }
        return _buildParagraphCard(paragraphs[index]);
      },
    );
  }
}

