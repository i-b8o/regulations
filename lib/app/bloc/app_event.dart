part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppThemeInitialEvent extends AppEvent {}

class AppThemeSetEvent extends AppEvent {
  final bool isDark;
  AppThemeSetEvent(this.isDark);
  List<Object> get props => [isDark];
}
