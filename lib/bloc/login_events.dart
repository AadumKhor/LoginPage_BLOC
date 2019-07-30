import 'package:equatable/equatable.dart';

class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String pwd;

  LoginButtonPressed({this.email, this.pwd}) : super([email, pwd]);
  
  @override
  String toString() => 'Login button pressed with creds : $email & $pwd';
}
