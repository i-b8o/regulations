import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'chapter_page_event.dart';
part 'chapter_page_state.dart';

class ChapterPageBloc extends Bloc<ChapterPageEvent, ChapterPageState> {
  ChapterPageBloc({required this.pageController}) : super(StateChapterPageInitial(pageController)) {
    on<ChapterPageEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  final PageController pageController;
}
