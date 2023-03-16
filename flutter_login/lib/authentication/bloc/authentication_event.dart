part of 'authentication_bloc.dart';

/**AuthenticationEvent instances will be the input to the AuthenticationBloc and will be processed
 *  and used to emit new AuthenticationState instances. */
abstract class AuthenticationEvent {
  const AuthenticationEvent();
}
/**notifies the bloc of a change to the user's AuthenticationStatus */
class _AuthenticationStatusChanged extends AuthenticationEvent {
  const _AuthenticationStatusChanged(this.status);

  final AuthenticationStatus status;
}
/**notifies the bloc of a logout request */
class AuthenticationLogoutRequested extends AuthenticationEvent {}
