import 'package:equatable/equatable.dart';
/**package:equatable is used to enable value comparisons of the User object. */
class User extends Equatable {
  const User(this.id);

  final String id;

  @override
  List<Object> get props => [id];

  static const empty = User('-');
}
