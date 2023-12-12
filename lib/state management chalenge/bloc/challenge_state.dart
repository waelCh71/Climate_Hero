part of 'challenge_bloc.dart';

@immutable
sealed class ChallengeState {}

final class ChallengeInitial extends ChallengeState {}

class ChallengeLoading extends ChallengeState {}


class ChallengeLoaded extends ChallengeState {
  final List articles;

  ChallengeLoaded(this.articles);
}

class ChallengeLoadedEmpty extends ChallengeState {
  final List articles=[];

  ChallengeLoadedEmpty();
}

class ChallengeError extends ChallengeState {
  final String  error;

  ChallengeError(this.error);
}
