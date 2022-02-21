part of 'remote_firebase_bloc.dart';

abstract class RemoteFirebaseState extends Equatable {
  const RemoteFirebaseState({this.email});

  final String? email;

  @override
  List<Object> get props => [];
}

class RemoteFirebaseInitial extends RemoteFirebaseState {
  const RemoteFirebaseInitial();
}

class RemoteFirebaseDone extends RemoteFirebaseState {
  const RemoteFirebaseDone(String email) : super(email: email);
}

class RemoteFirebaseError extends RemoteFirebaseState {
  const RemoteFirebaseError() : super();
}
