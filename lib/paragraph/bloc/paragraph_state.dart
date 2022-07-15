part of 'paragraph_bloc.dart';

abstract class ParagraphState extends Equatable {
  const ParagraphState();

  @override
  List<Object> get props => [];
}

class ParagraphInitial extends ParagraphState {
  final List<Paragraph> paragraphs;
  final String header;
  final int chapterOrderNum, totalChapters;

  ParagraphInitial({required this.paragraphs, required this.header, required this.chapterOrderNum, required this.totalChapters});
}
