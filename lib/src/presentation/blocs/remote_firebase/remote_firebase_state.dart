part of 'remote_firebase_bloc.dart';

abstract class RemoteFirebaseState extends Equatable {
  const RemoteFirebaseState({this.user});

  final AppUser? user;

  @override
  List<Object?> get props => [user];
}

class RemoteFirebaseInitial extends RemoteFirebaseState {
  const RemoteFirebaseInitial();
}

class RemoteFirebaseDone extends RemoteFirebaseState {
  const RemoteFirebaseDone(AppUser user) : super(user: user);
}

class RemoteFirebaseError extends RemoteFirebaseState {
  const RemoteFirebaseError() : super();
}
