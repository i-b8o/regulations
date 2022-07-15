import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:regulation/app/app.dart';
import 'package:regulation_api/regulation_api.dart';

import 'package:regulation_repository/regulation_repository.dart';

part 'paragraph_event.dart';
part 'paragraph_state.dart';

class ParagraphBloc extends Bloc<ParagraphEvent, ParagraphState> {
  ParagraphBloc({
    required this.arguments,
    required RegulationRepository regulationRepository,
  })  : _regulationRepository = regulationRepository,
        super(ParagraphInitial(
          totalChapters: regulationRepository.countChapters(),
          chapterOrderNum: arguments.chapterOrderNum,
            paragraphs: regulationRepository
                .getParagraphsByChapterID(arguments.chapterID),
            header: arguments.num.length > 0
                ? '${arguments.num}. ${arguments.name}'
                : '${arguments.name}')) {
    on<ParagraphEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
  RegulationRepository _regulationRepository;
  final ParagraphArguments arguments;
}
