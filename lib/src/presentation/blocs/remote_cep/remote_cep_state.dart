part of 'remote_cep_bloc.dart';

abstract class RemoteCepState extends Equatable {
  const RemoteCepState({this.address});

  final Address? address;

  @override
  List<Object?> get props => [address];
}

class RemoteCepInitial extends RemoteCepState {
  const RemoteCepInitial();
}

class RemoteCepDone extends RemoteCepState {
  const RemoteCepDone(Address address) : super(address: address);
}

class RemoteCepError extends RemoteCepState {
  const RemoteCepError() : super();
}
