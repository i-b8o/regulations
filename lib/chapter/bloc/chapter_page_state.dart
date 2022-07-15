part of 'chapter_page_bloc.dart';

abstract class ChapterPageState extends Equatable {
  const ChapterPageState();
  
  @override
  List<Object> get props => [];
}

class StateChapterPageInitial extends ChapterPageState {
  final PageController pageController;

  StateChapterPageInitial(this.pageController);
}
