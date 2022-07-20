import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

part 'chapter_page_event.dart';
part 'chapter_page_state.dart';

class ChapterPageBloc extends Bloc<ChapterPageEvent, StateInitChapterPage> {
  ChapterPageBloc(
      {required RegulationRepository regulationRepository,
      required int totalChapters,
      required PageController pageController,
      required TextEditingController appBarOrderNumController,
      required int chapterOrderNum})
      : _regulationRepository = regulationRepository,
        _pageController = pageController,
        _appBarOrderNumController = appBarOrderNumController,
        _totalChapters = totalChapters,
        super(StateInitChapterPage(
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

  final RegulationRepository _regulationRepository;
  final PageController _pageController;
  final TextEditingController _appBarOrderNumController;
  final int _totalChapters;

  List<Paragraph> paragraphs(int chapterOrderNum) =>
      _regulationRepository.getParagraphsByChapterOrederNum(chapterOrderNum);

  String chapterNameByOrderNum(int chapterOrderNum) =>
      _regulationRepository.getChapterNameByOrderNum(chapterOrderNum);

  GoTo? goTo(int paragraphID) => _regulationRepository.getGoTo(paragraphID);

  set setAppBarOrderNumText(int num) {
    try {
      _appBarOrderNumController.text = num.toString();
    } catch (e) {}
  }

  void _onEventChapterPageChanged(
      EventChapterPageChanged event, Emitter<StateInitChapterPage> emit) {
    setAppBarOrderNumText = event.chapterOrderNum;

    List<Paragraph> _paragraphs = paragraphs(event.chapterOrderNum);

    String _chapterName = chapterNameByOrderNum(event.chapterOrderNum);

    emit(StateInitChapterPage(
      paragraphs: _paragraphs,
      chapterOrderNum: event.chapterOrderNum,
      appBarOrderNumController: _appBarOrderNumController,
      pageController: _pageController,
      chapterName: _chapterName,
      totalChapters: _totalChapters,
    ));
  }

  void _onEventGoToChapter(
      EventGoToChapter event, Emitter<StateInitChapterPage> emit) {
    GoTo? gt = goTo(event.id);
    if (gt == null) {
      return;
    }
    setAppBarOrderNumText = gt.chapterOrderNum;

    List<Paragraph> _paragraphs = paragraphs(gt.chapterOrderNum);

    String _chapterName = chapterNameByOrderNum(gt.chapterOrderNum);

    emit(StateGoTo(
      paragraphOrderNum: gt.paragraphOrderNum,
      appBarOrderNumController: _appBarOrderNumController,
      chapterName: _chapterName,
      chapterOrderNum: gt.chapterOrderNum,
      pageController: _pageController,
      paragraphs: _paragraphs,
      totalChapters: _totalChapters,
    ));
  }
}
