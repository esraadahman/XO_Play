part of 'friend_cubit.dart';

@immutable
sealed class FriendState {}

final class FriendInitial extends FriendState {}
final class FriendHaveWinner extends FriendState {
  final String winner;

  FriendHaveWinner({required this.winner});
}