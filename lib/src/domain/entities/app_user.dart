import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  const AppUser({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.imageUrl,
    required this.role,
  });

  final String userId;
  final String fullName;
  final String email;
  final String imageUrl;
  final String role;

  bool get isValid => userId.isNotEmpty && email.isNotEmpty;

  @override
  List<Object> get props {
    return [
      userId,
      fullName,
      email,
      imageUrl,
      role,
    ];
  }

  @override
  bool get stringify => true;
}
