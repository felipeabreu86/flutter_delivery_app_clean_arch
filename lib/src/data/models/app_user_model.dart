import 'dart:convert';
import 'package:flutter_firebase_login_clean_arch/src/domain/entities/app_user.dart';

class AppUserModel extends AppUser {
  const AppUserModel({
    required String userId,
    required String fullName,
    required String email,
    required String imageUrl,
    required String role,
  }) : super(
          userId: userId,
          fullName: fullName,
          email: email,
          imageUrl: imageUrl,
          role: role,
        );

  factory AppUserModel.empty() {
    return const AppUserModel(
      userId: '',
      fullName: '',
      email: '',
      imageUrl: '',
      role: '',
    );
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      userId: map['userId']?.toString() ?? '',
      fullName: map['fullName']?.toString() ?? '',
      email: map['email']?.toString() ?? '',
      imageUrl: map['imageUrl']?.toString() ?? '',
      role: map['role']?.toString() ?? '',
    );
  }

  factory AppUserModel.fromJson(String source) =>
      AppUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  AppUserModel copyWith({
    String? userId,
    String? fullName,
    String? email,
    String? imageUrl,
    String? role,
  }) {
    return AppUserModel(
      userId: userId ?? this.userId,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      imageUrl: imageUrl ?? this.imageUrl,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'imageUrl': imageUrl,
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AppUserModel(userId: $userId, fullName: $fullName, email: $email, imageUrl: $imageUrl, role: $role)';
  }
}
