part of 'remote_firebase_bloc.dart';

abstract class RemoteFirebaseEvent extends Equatable {
  const RemoteFirebaseEvent({this.params});

  final UserRequestParams? params;

  @override
  List<Object?> get props => [params];
}

class CheckAuthentication extends RemoteFirebaseEvent {
  const CheckAuthentication() : super();
}

class LoginWithEmailAndPassword extends RemoteFirebaseEvent {
  const LoginWithEmailAndPassword(UserRequestParams params)
      : super(params: params);
}

class SignOut extends RemoteFirebaseEvent {
  const SignOut() : super();
}

class CreateUserWithEmailAndPassword extends RemoteFirebaseEvent {
  const CreateUserWithEmailAndPassword(UserRequestParams params)
      : super(params: params);
}

class SendPasswordResetEmail extends RemoteFirebaseEvent {
  const SendPasswordResetEmail(UserRequestParams params)
      : super(params: params);
}
