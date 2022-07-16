part of 'chapter_page_bloc.dart';

class ChapterPageState extends Equatable {
  final TextEditingController appBarOrderNumController;
  final PageController pageController;
  final int chapterOrderNum, totalChapters;
  
  final String chapterName;
  
  final List<Paragraph> paragraphs;

  ChapterPageState({
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

// class StateChapterPageInitial extends ChapterPageState {
//   final PageController pageController;
//   final int chapterOrderNum;
//   StateChapterPageInitial(
//       {required this.pageController, required this.chapterOrderNum})
//       : super(pageController: pageController, chapterOrderNum: chapterOrderNum);
// }

// class StateChapterPageChanged extends ChapterPageState {
//   final PageController pageController;
//   final int chapterOrderNum;

//   StateChapterPageChanged(
//       {required this.pageController, required this.chapterOrderNum})
//       : super(pageController: pageController, chapterOrderNum: chapterOrderNum);
// }
