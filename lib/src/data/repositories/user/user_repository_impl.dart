import 'package:flutter_app_example/models/user_model.dart';
import 'package:flutter_app_example/src/data/repositories/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  /// === c фичей стримом показ данных юзера
  @override
  Future<UserModel> getUserData() async => await firestoreUserData
      .doc(uid)
      .get()
      .then((data) => UserModel.fromJson(data.data()));

  // @override
  // Future<UserModel> setUserData(String userId) {
  //   // TODO: implement setUserData
  //   throw UnimplementedError();
  // }

  // @override
  // Stream<UserModel> streamUser() => firestoreUserData
  //     .doc(uid)
  //     .snapshots()
  //     .map((data) => UserModel.fromJson(data.data()));

  /// === cо стримом показ данных юзера
  @override
  Stream<UserModel> streamUserData() => firestoreUserData
      .doc(uid)
      .snapshots()
      .map((data) => UserModel.fromJson(data));

  /// === c фичей обновление данных юзера
  @override
  Future<void> updateUser(UserModel user) async {
    firestoreUserData.doc(uid).set(user.toJson());
  }
}
