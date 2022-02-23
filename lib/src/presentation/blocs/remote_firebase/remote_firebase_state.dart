part of 'remote_firebase_bloc.dart';

abstract class RemoteFirebaseState extends Equatable {
  const RemoteFirebaseState({this.user, this.errorMessage});

  final AppUser? user;
  final String? errorMessage;

  @override
  List<Object?> get props => [user, errorMessage];
}

class RemoteFirebaseInitial extends RemoteFirebaseState {
  const RemoteFirebaseInitial();
}

class RemoteFirebaseLoggedIn extends RemoteFirebaseState {
  const RemoteFirebaseLoggedIn(AppUser user) : super(user: user);
}

class RemoteFirebaseLoggedOut extends RemoteFirebaseState {
  const RemoteFirebaseLoggedOut() : super();
}

class RemoteFirebaseError extends RemoteFirebaseState {
  const RemoteFirebaseError({String? errorMessage})
      : super(errorMessage: errorMessage);
}
