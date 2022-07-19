part of 'chapter_page_body_bloc.dart';

abstract class ChapterPageBodyState extends Equatable {
  
  const ChapterPageBodyState();
  
  @override
  List<Object> get props => [];
}

class ChapterPageBodyInitial extends ChapterPageBodyState{
  @override
  List<Object> get props => [];
}


class StateLinkInChapter extends ChapterPageBodyState{
  final int index;

  StateLinkInChapter(this.index);
  @override
  List<Object> get props => [index];
}