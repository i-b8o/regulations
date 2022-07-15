import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regulation_api/regulation_api.dart';
import 'package:regulation_repository/regulation_repository.dart';

part 'chapter_page_body_event.dart';
part 'chapter_page_body_state.dart';

class ChapterPageBodyBloc
    extends Bloc<ChapterPageBodyEvent, ChapterPageBodyState> {
  ChapterPageBodyBloc({
    required this.chapterOrderNum,
    
    required RegulationRepository regulationRepository,
  })  : _regulationRepository = regulationRepository,
        super(StateChapterPageBodyInitial(
            paragraphs: regulationRepository
                .getParagraphsByChapterOrederNum(chapterOrderNum),
            header: regulationRepository.getChapterNameByOrderNum(chapterOrderNum))) {
    on<ChapterPageBodyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final RegulationRepository _regulationRepository;
  final int chapterOrderNum;
  
}
