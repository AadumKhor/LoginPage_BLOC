import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SharedPrefs prefs;

  AuthenticationBloc({@required this.prefs}) : assert(prefs != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final bool hasPwd = await prefs.hasPassword() != null;
      if (hasPwd) {
        var guard = await prefs.hasPassword();
        yield AuthenticationAuthenticated(guardPass: guard);
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      print("Logged in & pwd = ${event.password}");
      await prefs.writePassword(event.password);
      yield AuthenticationAuthenticated(guardPass: event.password);
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      print("Logging out/...........");
      await prefs.deletePassword();
      print("Deleted token.........");
      yield AuthenticationUnauthenticated();
    }
  }
}
