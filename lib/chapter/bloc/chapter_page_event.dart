part of 'chapter_page_bloc.dart';

abstract class ChapterPageEvent extends Equatable {
  const ChapterPageEvent();

  @override
  List<Object> get props => [];
}

// TODO const for every bloc entity
class EventChapterPageChanged extends ChapterPageEvent {
  final int chapterOrderNum;
  
  const EventChapterPageChanged(this.chapterOrderNum);
}

class EventGoToChapter extends ChapterPageEvent {
  final int id;

  EventGoToChapter({required this.id});
}
