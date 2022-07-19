part of 'chapter_page_body_bloc.dart';

abstract class ChapterPageBodyEvent extends Equatable {
  const ChapterPageBodyEvent();

  @override
  List<Object> get props => [];
}

class EventLinkPressed extends ChapterPageBodyEvent {
  final int id;

  EventLinkPressed(this.id);
}
