part of 'remote_firebase_bloc.dart';

abstract class RemoteFirebaseEvent extends Equatable {
  const RemoteFirebaseEvent({required this.params});

  final UserRequestParams params;

  @override
  List<Object> get props => [params];
}

class Login extends RemoteFirebaseEvent {
  const Login(UserRequestParams params) : super(params: params);
}
