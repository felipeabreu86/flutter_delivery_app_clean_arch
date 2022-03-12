import 'package:flutter_firebase_login_clean_arch/src/data/models/app_user_model.dart';

abstract class IAuthenticationDatasource {
  Future<AppUserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<AppUserModel> checkAuthentication();

  Future<bool> signOut();

  Future<AppUserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullname,
  });

  Future<void> sendPasswordResetEmail({required String email});
}
