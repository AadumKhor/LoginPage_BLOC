import 'dart:async';

import 'package:loginpage_bloc/bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final SharedPrefs sharedPrefs;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.sharedPrefs,
    @required this.authenticationBloc,
  })  : assert(sharedPrefs != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      await sharedPrefs.writePassword(event.pwd);
      print("Wrote ${event.pwd}");
      yield LoginLoading();
      try {
        final token = await sharedPrefs.authenticate(guard: event.pwd);
        token
            ? authenticationBloc.dispatch(LoggedIn(password: token.toString()))
            : authenticationBloc.dispatch(LoggedOut());
        yield LoginInitial();
      } catch (error) {
        await sharedPrefs.deletePassword();
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
