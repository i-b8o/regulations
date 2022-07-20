import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/regulation_app_bar.dart';
import '../widgets/chapter_page_body/chapter_page_body.dart';
import 'package:regulation_repository/regulation_repository.dart';

import '../../app/app.dart';
import '../bloc/chapter_page_bloc.dart';
import '../widgets/chapter_app_bar.dart';

class ChapterPage extends StatelessWidget {
  const ChapterPage({Key? key, required this.chapterArguments})
      : super(key: key);
  final ChapterArguments chapterArguments;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (blocContext) => ChapterPageBloc(
        regulationRepository: context.read<RegulationRepository>(),
        chapterOrderNum: chapterArguments.chapterOrderNum,
        appBarOrderNumController: TextEditingController(
            text: chapterArguments.chapterOrderNum.toString()),
        pageController: PageController(
          initialPage: chapterArguments.chapterOrderNum - 1,
        ),
        totalChapters: chapterArguments.totalChapters,
      ),
      child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(Theme.of(context).appBarTheme.elevation!),
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                ),
                child: BlocBuilder<ChapterPageBloc, StateInitChapterPage>(
                  buildWhen: (previousState, state) {
                    return previousState.chapterOrderNum !=
                        state.chapterOrderNum;
                  },
                  builder: (context, state) {
                    return RegulationAppBar(
                      child: ParagraphAppBar(
                        controller: state.appBarOrderNumController,
                        totalChapters: state.totalChapters,
                        pageController: state.pageController,
                      ),
                    );
                  },
                ),
              )),
          body: BlocBuilder<ChapterPageBloc, StateInitChapterPage>(
            builder: (context, state) {
              return PageView.builder(
                  itemCount: state.totalChapters,
                  controller: state.pageController,
                  onPageChanged: (index) {
                    context
                        .read<ChapterPageBloc>()
                        .add(EventChapterPageChanged(index + 1));
                  },
                  itemBuilder: (context, index) {
                    if (state is StateGoTo) {
                      state.pageController
                          .jumpToPage(state.chapterOrderNum - 1);
                    }

                    return ChapterPageBody(
                      scrollTo: state.paragraphOrderNum,
                      chapterOrderNum: state.chapterOrderNum,
                      pageController: state.pageController,
                      header: state.chapterName,
                      paragraphs: state.paragraphs,
                      totalChapters: state.totalChapters,
                      first: (index + 1) == 1,
                      last: (index + 1) == state.totalChapters,
                    );
                  });
            },
          )),
    );
  }
}
