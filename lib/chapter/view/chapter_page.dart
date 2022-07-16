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
      create: (blocContext) => ChapterPageBloc(
        chapterOrderNum: paragraphArguments.chapterOrderNum,
        appBarOrderNumController: TextEditingController(
            text: paragraphArguments.chapterOrderNum.toString()),
        pageController: PageController(
          initialPage: paragraphArguments.chapterOrderNum - 1,
        ),
      ),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: Container(
                  child: BlocBuilder<ChapterPageBloc, ChapterPageState>(
                    buildWhen: (previousState, state) {
                      return previousState.chapterOrderNum !=
                          state.chapterOrderNum;
                    },
                    builder: (context, state) {
                      print("AAAAAAAAAAAAAAAAAA ${state.chapterOrderNum}");
                      return ParagraphAppBar(
                        controller: state.appBarOrderNumController,
                        totalChapters: paragraphArguments.totalChapters,
                        pageController: state.pageController,
                      );
                    },
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE2E4E7)),
                  ),
                ),
              )),
          body: BlocBuilder<ChapterPageBloc, ChapterPageState>(
            builder: (context, state) {
              return PageView.builder(
                  controller: state.pageController,
                  onPageChanged: (index) {
                    context
                        .read<ChapterPageBloc>()
                        .add(EventChapterPageChanged(index + 1));
                  },
                  itemBuilder: (context, index) =>
                      ChapterPageBody(chapterOrderNum: index + 1));
            },
          )),
    );

    // child: BlocBuilder<ChapterPageBloc, ChapterPageState>(
    //   builder: (context, state) {
    //     if (state is StateChapterPageInitial) {
    //       return Scaffold(
    //           backgroundColor: Color(0XFFFAFAFA),
    //           appBar: PreferredSize(
    //               preferredSize: Size.fromHeight(60.0),
    //               child: Padding(
    //                 padding: EdgeInsets.only(
    //                   top: MediaQuery.of(context).padding.top,
    //                 ),
    //                 child: Container(
    //                   child: ParagraphAppBar(
    //                     controller: state.pageController,
    //                       chapterOrderNum: paragraphArguments.chapterOrderNum,
    //                       totalChapters: paragraphArguments.totalChapters),
    //                   decoration: BoxDecoration(
    //                     border: Border.all(color: Color(0xFFE2E4E7)),
    //                   ),
    //                 ),
    //               )),
    //           body: PageView.builder(
    //             onPageChanged: (index){
    //               state.pageController.
    //             },
    //             controller: state.pageController,
    //               itemCount: paragraphArguments.totalChapters,
    //               scrollDirection: Axis.horizontal,
    //               itemBuilder: (context, index) {
    //                 return ChapterPageBody(chapterOrderNum: index + 1);
    //               }));
    //     }
    //     return Center(
    //       child: Text("no"),
    //     );
    //   },
    // ),
  }
}
