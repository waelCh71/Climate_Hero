part of 'gloabl_bloc.dart';

@immutable
sealed class GloablEvent {}



class SignInEvent extends GloablEvent{
  final String email;
  final String password;

  SignInEvent(
    this.email,
    this.password,
  );
}

class SignUpEvent extends GloablEvent {
  final String username;
  final String email;
  final String password;

  SignUpEvent(
    this.username,
    this.email,
    this.password,
  );
}
