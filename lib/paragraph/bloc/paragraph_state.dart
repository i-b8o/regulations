part of 'paragraph_bloc.dart';

abstract class ParagraphState extends Equatable {
  const ParagraphState();

  @override
  List<Object> get props => [];
}

class ParagraphInitial extends ParagraphState {
  final List<Paragraph> paragraphs;

  ParagraphInitial({required this.paragraphs});
}
