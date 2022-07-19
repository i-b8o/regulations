import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regulation_api/regulation_api.dart';

part 'chapter_page_body_event.dart';
part 'chapter_page_body_state.dart';

class ChapterPageBodyBloc extends Bloc<ChapterPageBodyEvent, ChapterPageBodyState> {
  ChapterPageBodyBloc({required this.paragraphs}) : super(ChapterPageBodyInitial()) {
    print("New bloc ${paragraphs[0].chapterID}");
    on<EventLinkPressed>(_onEventLinkPressed);
  }

  final List<Paragraph> paragraphs;

  int? getIndex(int id) {
    List<Paragraph> l = paragraphs.where((paragraph) => paragraph.id == id).toList();
    if (l.isEmpty){
      return null;
    }
    return l.first.num;
  } 

   void _onEventLinkPressed(
      EventLinkPressed event, Emitter<ChapterPageBodyState> emit) {
        print("SSSSSSSSSSSS ${event.id}");

        for (var i = 0; i < paragraphs.length; i++){

          print("${paragraphs[i].id} ${event.id}");
          print('${paragraphs[i].id == event.id}');
        }
        int? i = getIndex(event.id);
      if (i != null){
        print("QQQQQQQQQQ");
        emit(StateLinkInChapter(i));
      }
  }
}
