import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
/** 
 * The AuthenticationRepository exposes a Stream of AuthenticationStatus updates which will be used 
 * to notify the application when a user signs in or out
*/
class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

/**Utilizar async en una función te permite await (esperar) al realizar un trabajo,
 *  el cual finalizara en algún momento en el futuro. Al contrario que una sync que ejecutaria el future  
 * antes de los Yield o cualquier otra función que fuera después 
 * Yield es similar al return y el asterisco hace que se ejecute esos yield además, devuelven un
 * flujo de datos (stream of values)*/
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async {
    /**Preguntar por que necesitio otra funcion future asíncrona para cambiar el status */
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  void logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
