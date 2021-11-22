import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_example/models/user_model.dart';
import 'package:flutter_app_example/src/data/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  /// ====== создание uid юзера при реестрации по номеру тлф ===
  @override
  Future<void> createUser(User user) async {
    firestoreUserData.doc(user.uid).set(UserModel(
            id: user.uid,
            firstName: 'firstName',
            lastName: 'lastName',
            phone: user.phoneNumber)
        .toJson());
  }
}
