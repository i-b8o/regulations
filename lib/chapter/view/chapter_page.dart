import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regulation/chapter/widgets/chapter_page_body/chapter_page_body.dart';

import '../../app/app.dart';
import '../bloc/chapter_page_bloc.dart';
import '../widgets/chapter_app_bar.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({Key? key, required this.paragraphArguments})
      : super(key: key);
  final ParagraphArguments paragraphArguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChapterPageBloc(
          pageController:
              PageController(initialPage: paragraphArguments.chapterOrderNum)),
      child: BlocBuilder<ChapterPageBloc, ChapterPageState>(
        builder: (context, state) {
          if (state is StateChapterPageInitial) {
            return Scaffold(
                backgroundColor: Color(0XFFFAFAFA),
                appBar: PreferredSize(
                    preferredSize: Size.fromHeight(60.0),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                      ),
                      child: Container(
                        child: ParagraphAppBar(
                            chapterOrderNum: paragraphArguments.chapterOrderNum,
                            totalChapters: paragraphArguments.totalChapters),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFE2E4E7)),
                        ),
                      ),
                    )),
                body: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ChapterPageBody(chapterOrderNum: index + 1);
                    }));
          }
          return Center(
            child: Text("no"),
          );
        },
      ),
    );
  }
}
