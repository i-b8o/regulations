part of 'home_cubit.dart';

enum HomeTab { chapters, buy }

class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.buy,
  });

  final HomeTab tab;

  @override
  List<Object> get props => [tab];
}
