part of 'remote_viacep_bloc.dart';

abstract class RemoteViacepState extends Equatable {
  const RemoteViacepState({this.address});

  final Address? address;

  @override
  List<Object?> get props => [address];
}

class RemoteViacepInitial extends RemoteViacepState {
  const RemoteViacepInitial();
}

class RemoteViacepDone extends RemoteViacepState {
  const RemoteViacepDone(Address address) : super(address: address);
}

class RemoteViacepError extends RemoteViacepState {
  const RemoteViacepError() : super();
}
