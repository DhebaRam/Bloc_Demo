part of 'color_bloc.dart';

@immutable
sealed class ColorEvent {}

class ColorChange extends ColorEvent{
  final int red, green, blue;

  ColorChange({required this.red, required this.green, required this.blue});
}