import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/utils/hive_utils.dart';
import 'package:hive/hive.dart';

class UserAdapter extends NNTypeAdapter<User> {
  UserAdapter(int typeId) : super(typeId);

  @override
  User readNotNull(BinaryReader reader) => User(
        id: reader.readString(),
        name: reader.readString(),
        photoUrl: reader.readString(),
        signInProvider: reader.read() as SignInProvider,
      );

  @override
  void writeNotNull(BinaryWriter writer, User obj) => writer
    ..writeString(obj.id)
    ..writeString(obj.name)
    ..writeString(obj.photoUrl)
    ..write(obj.signInProvider);
}

class SignInProviderAdapter extends NNTypeAdapter<SignInProvider> {
  SignInProviderAdapter(int typeId) : super(typeId);

  @override
  SignInProvider readNotNull(BinaryReader reader) => SignInProvider.values[reader.readInt()];

  @override
  void writeNotNull(BinaryWriter writer, SignInProvider obj) => writer.writeInt(obj.index);
}
