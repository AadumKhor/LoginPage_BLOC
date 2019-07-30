import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  final String token;

  AppStarted({this.token});

  @override
  String toString() => 'AppStarted : $token';
}

class LoggedIn extends AuthenticationEvent {
  final String password;

  LoggedIn({@required this.password}) : super([password]);

  @override
  String toString() => 'LoggedIn { passsword :$password }';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}
