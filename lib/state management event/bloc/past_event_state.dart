part of 'past_event_bloc.dart';

@immutable
sealed class PastEventState {}

final class PastEventInitial extends PastEventState {}

class EventLoading extends PastEventState {}

class EventLoaded extends PastEventState {
  final List events;

  EventLoaded(this.events);
}

class EventLoadedEmpty extends PastEventState {
  final List events=[];

  EventLoadedEmpty();
}

class EventError extends PastEventState {
  final String  error;

  EventError(this.error);
}