import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_delivery_app_clean_arch/src/data/models/app_user_model.dart';

class FirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<AppUserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    AppUserModel userModel = AppUserModel.empty();
    _errorMessage = '';
    try {
      final UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (credential.user?.uid.isNotEmpty ?? false) {
        final User currentUser = credential.user!;
        userModel = AppUserModel(
          userId: currentUser.uid,
          fullName: currentUser.displayName ?? '',
          email: currentUser.email ?? '',
          imageUrl: currentUser.photoURL ?? '',
          role: '',
        );
      }
    } catch (error) {
      _errorMessage = error.toString();
    }
    return userModel;
  }

  Future<AppUserModel> checkAuthentication() async {
    AppUserModel userModel = AppUserModel.empty();
    _errorMessage = '';
    try {
      if (_firebaseAuth.currentUser != null) {
        final User currentUser = _firebaseAuth.currentUser!;
        userModel = AppUserModel(
          userId: currentUser.uid,
          fullName: currentUser.displayName ?? '',
          email: currentUser.email ?? '',
          imageUrl: currentUser.photoURL ?? '',
          role: '',
        );
      }
    } catch (error) {
      _errorMessage = error.toString();
    }
    return userModel;
  }

  Future<bool> signOut() async {
    _errorMessage = '';
    bool userLoggedOut = false;
    try {
      await _firebaseAuth.signOut();
      if (_firebaseAuth.currentUser == null) {
        userLoggedOut = true;
      }
    } catch (error) {
      _errorMessage = error.toString();
    }
    return userLoggedOut;
  }

  Future<AppUserModel> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String fullname,
  }) async {
    AppUserModel userModel = AppUserModel.empty();
    _errorMessage = '';
    try {
      final UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      if (credential.user?.uid.isNotEmpty ?? false) {
        final User currentUser = credential.user!;
        await currentUser.updateDisplayName(fullname);

        userModel = AppUserModel(
          userId: currentUser.uid,
          fullName: currentUser.displayName ?? '',
          email: currentUser.email ?? '',
          imageUrl: currentUser.photoURL ?? '',
          role: '',
        );
      }
    } catch (error) {
      _errorMessage = error.toString();
    }
    return userModel;
  }

  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
