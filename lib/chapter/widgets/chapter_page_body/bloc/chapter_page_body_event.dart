part of 'chapter_page_body_bloc.dart';

abstract class ChapterPageBodyEvent extends Equatable {
  const ChapterPageBodyEvent();

  @override
  List<Object> get props => [];
}

class EventLinkPressed extends ChapterPageBodyEvent {
  final int index;

  EventLinkPressed(this.index);
   List<Object> get props => [index];
}
