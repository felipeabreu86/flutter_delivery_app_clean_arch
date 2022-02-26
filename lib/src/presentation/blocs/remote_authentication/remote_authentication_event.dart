part of 'remote_authentication_bloc.dart';

abstract class RemoteAuthenticationEvent extends Equatable {
  const RemoteAuthenticationEvent({this.params});

  final UserRequestParams? params;

  @override
  List<Object?> get props => [params];
}

class CheckAuthentication extends RemoteAuthenticationEvent {
  const CheckAuthentication() : super();
}

class LoginWithEmailAndPassword extends RemoteAuthenticationEvent {
  const LoginWithEmailAndPassword(UserRequestParams params)
      : super(params: params);
}

class SignOut extends RemoteAuthenticationEvent {
  const SignOut() : super();
}

class CreateUserWithEmailAndPassword extends RemoteAuthenticationEvent {
  const CreateUserWithEmailAndPassword(UserRequestParams params)
      : super(params: params);
}

class SendPasswordResetEmail extends RemoteAuthenticationEvent {
  const SendPasswordResetEmail(UserRequestParams params)
      : super(params: params);
}
