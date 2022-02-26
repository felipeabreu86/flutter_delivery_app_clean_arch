part of 'remote_authentication_bloc.dart';

abstract class RemoteAuthenticationState extends Equatable {
  const RemoteAuthenticationState({this.user, this.errorMessage});

  final AppUser? user;
  final String? errorMessage;

  @override
  List<Object?> get props => [user, errorMessage];
}

class AuthenticationInitial extends RemoteAuthenticationState {
  const AuthenticationInitial();
}

class LoggedIn extends RemoteAuthenticationState {
  const LoggedIn(AppUser user) : super(user: user);
}

class LoggedOut extends RemoteAuthenticationState {
  const LoggedOut() : super();
}

class ResetPasswordSentByEmail extends RemoteAuthenticationState {
  const ResetPasswordSentByEmail() : super();
}

class AuthenticationError extends RemoteAuthenticationState {
  const AuthenticationError({String? errorMessage})
      : super(errorMessage: errorMessage);
}
