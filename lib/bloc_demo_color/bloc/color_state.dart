part of 'color_bloc.dart';

@immutable
class ColorState {}

class ColorInitial extends ColorState {}

class ButtonClick extends ColorState{
  final Color color;
  ButtonClick({required this.color});
}

class AuthLoading extends ColorState{}

class SuccessFullChange extends ColorState{
  final Color newColor;

  SuccessFullChange({required this.newColor});
}