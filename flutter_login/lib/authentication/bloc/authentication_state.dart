part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  /** the default state which indicates that the bloc does not yet know 
   * whether the current user is authenticated or not */
  const AuthenticationState.unknown() : this._();

  /**the state which indicates that the user is currently authenticated */
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  /**the state which indicates that the user is currently not authenticated */
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;

  @override
  List<Object> get props => [status, user];
}
