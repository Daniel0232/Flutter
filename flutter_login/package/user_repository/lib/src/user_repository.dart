import 'dart:async';

import 'package:user_repository/src/models/models.dart';
import 'package:uuid/uuid.dart';

/**the UserRepository exposes a single method getUser which will retrieve the current user */
class UserRepository {
  User? _user;

  Future<User?> getUser() async {
    if (_user != null) return _user;
    /**¿Este método te construlle un usuario si no existe uno? */
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(const Uuid().v4()),
    );
  }
}
