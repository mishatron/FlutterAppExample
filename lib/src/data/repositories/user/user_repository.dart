import 'package:flutter_app_example/models/user_model.dart';
import 'package:flutter_app_example/src/core/data/base_repository.dart';

abstract class UserRepository extends BaseRepository {
  /// === cо стримом показ данных юзера
//  Stream<UserModel> streamUser();
  Stream<UserModel> streamUserData();

  /// === c фичей стримом показ данных юзера
  Future<UserModel> getUserData();

  /// === c фичей обновление данных юзера
  Future<void> updateUser(UserModel user);
//  Future<UserModel> setUserData(String userId);

}
