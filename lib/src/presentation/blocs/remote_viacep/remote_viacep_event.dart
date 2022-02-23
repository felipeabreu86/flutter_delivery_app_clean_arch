part of 'remote_viacep_bloc.dart';

abstract class RemoteViacepEvent extends Equatable {
  const RemoteViacepEvent({this.params});

  final CepRequestParams? params;

  @override
  List<Object> get props => [];
}

class CepSearch extends RemoteViacepEvent {
  const CepSearch(CepRequestParams params) : super(params: params);
}
