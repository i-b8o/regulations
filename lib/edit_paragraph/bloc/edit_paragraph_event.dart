part of 'edit_paragraph_bloc.dart';

abstract class EditParagraphEvent extends Equatable {
  const EditParagraphEvent();

  @override
  List<Object> get props => [];
}

class EditParagraphInitialEvent extends EditParagraphEvent {
  const EditParagraphInitialEvent();

  @override
  List<Object> get props => [];
}

class UserColorsListChanged extends EditParagraphEvent {
  final int activeColorCircleIndex, color;

  UserColorsListChanged(
      {required this.activeColorCircleIndex, required this.color});
  @override
  List<Object> get props => [activeColorCircleIndex];
}

class EventColorCircleChoosen extends EditParagraphInitialEvent {
  final int index;
  EventColorCircleChoosen(this.index);
  @override
  List<Object> get props => [index];
}

class EventColorCircleChanged extends EditParagraphInitialEvent {
  final int color;
  EventColorCircleChanged(this.color);
  @override
  List<Object> get props => [color];
}
