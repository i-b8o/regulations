part of 'edit_paragraph_bloc.dart';

class EditParagraphState extends Equatable {
  final List<int> listcolorsInt;
  final int activeColorCircleIndex;
  final int activeCircleColor;

  const EditParagraphState(
      {required this.activeCircleColor,
      required this.listcolorsInt,
      required this.activeColorCircleIndex});

  @override
  List<Object> get props =>
      [activeColorCircleIndex, listcolorsInt, activeCircleColor];
}
