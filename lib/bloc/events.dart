import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  final String pwd;
  LoginButtonPressed({this.pwd}) : super([pwd]);

  @override
  String toString() => 'LoginButtonPressed { pwd : $pwd}';
}
