part of 'computer_cubit.dart';

@immutable
sealed class ComputerState {}

final class ComputerInitial extends ComputerState {}


final class ComputerHaveWinner extends ComputerState {
  final String winner;

  ComputerHaveWinner({required this.winner});
}