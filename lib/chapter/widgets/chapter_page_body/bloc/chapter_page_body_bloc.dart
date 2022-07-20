import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regulation_api/regulation_api.dart';

part 'chapter_page_body_event.dart';
part 'chapter_page_body_state.dart';

class ChapterPageBodyBloc
    extends Bloc<ChapterPageBodyEvent, ChapterPageBodyState> {
  ChapterPageBodyBloc() : super(ChapterPageBodyInitial()) {
    // print("New bloc ${paragraphs[0].chapterID}");
    on<EventLinkPressed>(_onEventLinkPressed);
  }

  void _onEventLinkPressed(
      EventLinkPressed event, Emitter<ChapterPageBodyState> emit) {
    emit(StateLinkInChapter(event.index));
  }
}
