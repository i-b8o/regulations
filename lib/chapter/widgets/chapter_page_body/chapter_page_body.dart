import 'package:flutter/material.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../table_of_contents/widgets/chapter_page_body_header.dart';
import 'paragraph_card.dart';

class ChapterPageBody extends StatefulWidget {
  ChapterPageBody({
    Key? key,
    required this.header,
    required this.totalChapters,
    required this.pageController,
    required this.paragraphs,
    required int chapterOrderNum,
    required this.first,
    required this.last,
    required this.scrollTo,
  }) : super(key: key);
  final String header;
  final int totalChapters;
  final bool first, last;
  final int scrollTo;

  final PageController pageController;
  final List<Paragraph> paragraphs;

  @override
  State<ChapterPageBody> createState() => _ChapterPageBodyState();
}

class _ChapterPageBodyState extends State<ChapterPageBody> {
  final _itemScrollController = ItemScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.scrollTo != 0) {
      scrollToItem(widget.scrollTo);
    }
  }

  // TODO scroll to table paragraph after table collapse
  ParagraphCard _buildParagraphCard(Paragraph paragraph) {
    return ParagraphCard(paragraph: paragraph);
  }

  void scrollToItem(int orderNum) =>
      _itemScrollController.jumpTo(index: orderNum);

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: _itemScrollController,
      itemCount: widget.paragraphs.length,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ChapterPageBodyHeader(
                paragraphs: widget.paragraphs,
                header: widget.header,
                pClass: widget.paragraphs[index].paragraphClass,
              ),
              _buildParagraphCard(widget.paragraphs[index]),
            ],
          );
        } else if ((index == (widget.paragraphs.length - 1))) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildParagraphCard(widget.paragraphs[index]),
              // ChapterPageBodyBtns(
              //     first: first,
              //     pageController: pageController,
              //     last: last),
              // SizedBox(height: 25)
            ],
          );
        }
        return _buildParagraphCard(widget.paragraphs[index]);
      },
    );
  }
}
