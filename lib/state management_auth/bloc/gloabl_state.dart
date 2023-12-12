part of 'gloabl_bloc.dart';

@immutable
sealed class GloablState {}

final class GloablInitial extends GloablState {}

class LoadingEvent extends GloablState {}

class AUthenticated extends GloablState {}

class AUthenticatedError extends GloablState {
  final String error;

  AUthenticatedError(this.error);
}

