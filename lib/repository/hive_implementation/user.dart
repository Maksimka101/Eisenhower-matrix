import 'package:eisenhower_matrix/models/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class HiveUser {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String photoUrl;
  @HiveField(3)
  final HiveSignInProvider signInProvider;
  @HiveField(4)
  final bool signOutSynced;

  HiveUser({
    @required this.id,
    @required this.name,
    this.photoUrl,
    @required this.signInProvider,
    @required this.signOutSynced,
  });

  factory HiveUser.fromUser(User user, bool signOutSynced) => HiveUser(
        id: user.id,
        signInProvider: HiveSignInProvider.values[user.signInProvider.index],
        name: user.name,
        photoUrl: user.photoUrl,
        signOutSynced: signOutSynced,
      );

  User toUser() => User(
        id: id,
        name: name,
        signInProvider: SignInProvider.values[signInProvider.index],
        photoUrl: photoUrl,
      );
}

/// Sign in provider for hive user. Must be equal with [SignInProvider].
@HiveType(typeId: 1)
enum HiveSignInProvider {
  @HiveField(0)
  Google,
  @HiveField(1)
  Github,
  @HiveField(2)
  Apple,
  @HiveField(3)
  Twitter,
  @HiveField(4)
  Anonymous,
}
