part of 'remote_cep_bloc.dart';

abstract class RemoteCepEvent extends Equatable {
  const RemoteCepEvent({this.params});

  final CepRequestParams? params;

  @override
  List<Object> get props => [];
}

class CepSearch extends RemoteCepEvent {
  const CepSearch(CepRequestParams params) : super(params: params);
}
