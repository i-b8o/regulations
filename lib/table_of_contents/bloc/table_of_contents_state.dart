part of 'table_of_contents_bloc.dart';

abstract class TableOfContentsState extends Equatable {
  const TableOfContentsState();

  @override
  List<Object> get props => [];
}

class StateTableOfContentsInitial extends TableOfContentsState {
  final String title;
  final String name;

  StateTableOfContentsInitial({required this.title, required this.name});
}

class StateTableOfContentsSearchTextFieldActivated
    extends TableOfContentsState {}
