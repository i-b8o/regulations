import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'chapter_page_event.dart';
part 'chapter_page_state.dart';

class ChapterPageBloc extends Bloc<ChapterPageEvent, ChapterPageState> {
  ChapterPageBloc(
      {required this.pageController,
      required this.appBarOrderNumController,
      required int chapterOrderNum})
      : super(ChapterPageState(
            chapterOrderNum: chapterOrderNum,
            appBarOrderNumController: appBarOrderNumController,
            pageController: pageController)) {
    on<EventChapterPageChanged>(_onEventChapterPageChanged);
  }

  final PageController pageController;
  final TextEditingController appBarOrderNumController;

  void _onEventChapterPageChanged(
      EventChapterPageChanged event, Emitter<ChapterPageState> emit) {
    appBarOrderNumController.text = event.chapterOrderNum.toString();
    emit(ChapterPageState(
        chapterOrderNum: event.chapterOrderNum,
        appBarOrderNumController: appBarOrderNumController,
        pageController: pageController));
  }
}
