part of 'chapter_page_body_bloc.dart';

abstract class ChapterPageBodyState extends Equatable {
  const ChapterPageBodyState();
  
  @override
  List<Object> get props => [];
}

class StateChapterPageBodyInitial extends ChapterPageBodyState {
    final List<Paragraph> paragraphs;
    final String header;

  StateChapterPageBodyInitial({required this.header, required this.paragraphs});

}
