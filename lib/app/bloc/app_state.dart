part of 'app_bloc.dart';

abstract class AppState extends Equatable {
  const AppState();
  
  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppThemeState extends AppState {
  final bool isDark;

  AppThemeState(this.isDark);

  List<Object> get props => [isDark];
}
