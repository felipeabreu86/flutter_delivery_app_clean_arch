import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  const AppUser({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.role,
  });

  factory AppUser.empty() {
    return const AppUser(
      userId: '',
      fullName: '',
      email: '',
      password: '',
      imageUrl: '',
      role: '',
    );
  }

  final String userId;
  final String fullName;
  final String email;
  final String password;
  final String imageUrl;
  final String role;

  @override
  List<Object> get props {
    return [
      userId,
      fullName,
      email,
      password,
      imageUrl,
      role,
    ];
  }

  @override
  bool get stringify => true;
}
