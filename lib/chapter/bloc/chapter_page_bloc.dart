import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

part 'chapter_page_event.dart';
part 'chapter_page_state.dart';

class ChapterPageBloc extends Bloc<ChapterPageEvent, ChapterPageState> {
  ChapterPageBloc(
      {required RegulationRepository this.regulationRepository,
      required this.totalChapters,
      required this.pageController,
      required this.appBarOrderNumController,
      required int chapterOrderNum})
      : super(ChapterPageState(
            chapterOrderNum: chapterOrderNum,
            appBarOrderNumController: appBarOrderNumController,
            pageController: pageController,
            paragraphs: regulationRepository
                .getParagraphsByChapterOrederNum(chapterOrderNum),
            chapterName:
                regulationRepository.getChapterNameByOrderNum(chapterOrderNum),
            totalChapters: totalChapters)) {
    on<EventChapterPageChanged>(_onEventChapterPageChanged);
  }

  final PageController pageController;
  final TextEditingController appBarOrderNumController;
  final RegulationRepository regulationRepository;
  final int totalChapters;

  void _onEventChapterPageChanged(
      EventChapterPageChanged event, Emitter<ChapterPageState> emit) {
    appBarOrderNumController.text = event.chapterOrderNum.toString();
    List<Paragraph> _paragraphs = regulationRepository
        .getParagraphsByChapterOrederNum(event.chapterOrderNum);
    String _chapterName =
        regulationRepository.getChapterNameByOrderNum(event.chapterOrderNum);

    emit(ChapterPageState(
      paragraphs: _paragraphs,
      chapterOrderNum: event.chapterOrderNum,
      appBarOrderNumController: appBarOrderNumController,
      pageController: pageController,
      chapterName: _chapterName,
      totalChapters: totalChapters,
    ));
  }
}
