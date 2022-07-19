import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

part 'chapter_page_event.dart';
part 'chapter_page_state.dart';

class ChapterPageBloc extends Bloc<ChapterPageEvent, StateInitChapterPage> {
  ChapterPageBloc(
      {required RegulationRepository this.regulationRepository,
      required this.totalChapters,
      required this.pageController,
      required this.appBarOrderNumController,
      required int chapterOrderNum})
      : super(StateInitChapterPage(
          chapterOrderNum: chapterOrderNum,
          appBarOrderNumController: appBarOrderNumController,
          pageController: pageController,
          paragraphs: regulationRepository
              .getParagraphsByChapterOrederNum(chapterOrderNum),
          chapterName:
              regulationRepository.getChapterNameByOrderNum(chapterOrderNum),
          totalChapters: totalChapters,
        )) {
    on<EventChapterPageChanged>(_onEventChapterPageChanged);
    on<EventGoToChapter>(_onEventGoToChapter);
  }

  final PageController pageController;
  final TextEditingController appBarOrderNumController;

  final RegulationRepository regulationRepository;
  final int totalChapters;

  void _onEventChapterPageChanged(
      EventChapterPageChanged event, Emitter<StateInitChapterPage> emit) {
    appBarOrderNumController.text = event.chapterOrderNum.toString();
    List<Paragraph> _paragraphs = regulationRepository
        .getParagraphsByChapterOrederNum(event.chapterOrderNum);
    String _chapterName =
        regulationRepository.getChapterNameByOrderNum(event.chapterOrderNum);

    emit(StateInitChapterPage(
      paragraphs: _paragraphs,
      chapterOrderNum: event.chapterOrderNum,
      appBarOrderNumController: appBarOrderNumController,
      pageController: pageController,
      chapterName: _chapterName,
      totalChapters: totalChapters,
    ));
  }

  void _onEventGoToChapter(
      EventGoToChapter event, Emitter<StateInitChapterPage> emit) {
    GoTo? gt = regulationRepository.getGoTo(event.id);
    if (gt == null) {
      return;
    }

    appBarOrderNumController.text = gt.chapterOrderNum.toString();
    List<Paragraph> _paragraphs = regulationRepository
        .getParagraphsByChapterOrederNum(gt.chapterOrderNum);
    String _chapterName =
        regulationRepository.getChapterNameByOrderNum(gt.chapterOrderNum);
    // List<Link> _links =
    //     regulationRepository.AllLinksForChapter(gt.chapterOrderNum, 1);
    emit(StateGoTo(
      paragraphOrderNum: gt.paragraphOrderNum,
      appBarOrderNumController: appBarOrderNumController,
      chapterName: _chapterName,
      chapterOrderNum: gt.chapterOrderNum,
      pageController: pageController,
      paragraphs: _paragraphs,
      totalChapters: totalChapters,
    ));
  }
}
