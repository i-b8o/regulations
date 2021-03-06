import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../table_of_contents/widgets/body/chapter_page_body_header.dart';
import 'bloc/chapter_page_body_bloc.dart';
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
  final ItemScrollController _itemScrollController = ItemScrollController();

  // TODO scroll to table paragraph after table collapse
  ParagraphCard _buildParagraphCard(Paragraph paragraph, List<int> ids) {
    return ParagraphCard(
      ids: ids,
      paragraph: paragraph,
    );
  }

  void scrollToItem(int orderNum) {
    if (orderNum < 1) {
      return;
    }
    if (!_itemScrollController.isAttached) {
      return;
    }
    _itemScrollController.jumpTo(index: orderNum);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => scrollToItem(widget.scrollTo - 1));

    List<int> ids = widget.paragraphs.map((p) => p.id).toList();

    return BlocProvider(
      create: (context) => ChapterPageBodyBloc(),
      child: BlocBuilder<ChapterPageBodyBloc, ChapterPageBodyState>(
        builder: (context, state) {
          if (state is StateLinkInChapter) {
            scrollToItem(state.index - 1);
          }
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
                    _buildParagraphCard(widget.paragraphs[index], ids),
                  ],
                );
              } else if ((index == (widget.paragraphs.length - 1))) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildParagraphCard(widget.paragraphs[index], ids),
                    // ChapterPageBodyBtns(
                    //     first: first,
                    //     pageController: pageController,
                    //     last: last),
                    // SizedBox(height: 25)
                  ],
                );
              }
              return _buildParagraphCard(widget.paragraphs[index], ids);
            },
          );
        },
      ),
    );
  }
}
