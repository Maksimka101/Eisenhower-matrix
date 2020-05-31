import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User implements _$User {
  User._();

  factory User(
      {@required String id,
      @required String name,
      String photoUrl,
      @required SignInProvider signInProvider}) = _User;
}

enum SignInProvider {
  Google,
  Github,
  Apple,
  Twitter,
  Anonymous,
}
