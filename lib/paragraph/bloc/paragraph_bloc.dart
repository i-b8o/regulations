import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regulation_api/regulation_api.dart';

import 'package:regulation_repository/regulation_repository.dart';

part 'paragraph_event.dart';
part 'paragraph_state.dart';

class ParagraphBloc extends Bloc<ParagraphEvent, ParagraphState> {
  ParagraphBloc({
    required this.chapterID,
    required RegulationRepository regulationRepository,
  })  : _regulationRepository = regulationRepository,
        super(ParagraphInitial(
            paragraphs:
                regulationRepository.getParagraphsByChapterID(chapterID))) {
    on<ParagraphEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  RegulationRepository _regulationRepository;
  final int chapterID;
}
