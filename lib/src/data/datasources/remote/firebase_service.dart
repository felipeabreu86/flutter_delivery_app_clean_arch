import 'package:flutter_delivery_app_clean_arch/src/data/models/app_user_model.dart';

class FirebaseService {
  Future<AppUserModel> login({
    required String email,
    required String password,
  }) async {
    return const AppUserModel(
      userId: "1",
      fullName: "Nome Completo Usuário",
      email: "usuario@email.com",
      password: "password",
      imageUrl: "",
      role: "admin",
    );
  }
}
