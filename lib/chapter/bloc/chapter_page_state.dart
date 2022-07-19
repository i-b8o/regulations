part of 'chapter_page_bloc.dart';

class ChapterPageState extends Equatable {
  final TextEditingController appBarOrderNumController;
  final PageController pageController;

  final int chapterOrderNum, totalChapters;

  final String chapterName;

  final int paragraphOrderNum;

  final List<Paragraph> paragraphs;

  ChapterPageState({
    this.paragraphOrderNum = 0,
    required this.appBarOrderNumController,
    required this.pageController,
    required this.chapterName,
    required this.paragraphs,
    required this.chapterOrderNum,
    required this.totalChapters,
  });

  @override
  List<Object> get props =>
      [pageController, chapterOrderNum, appBarOrderNumController];
}

class StateGoTo extends ChapterPageState {
  StateGoTo(
      {required super.paragraphOrderNum,
      required super.appBarOrderNumController,
      required super.pageController,
      required super.chapterName,
      required super.paragraphs,
      required super.chapterOrderNum,
      required super.totalChapters});
}
