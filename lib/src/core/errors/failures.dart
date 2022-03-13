import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;
}

class UnexpectedFailure extends Failure {
  @override
  String get message => "Ocorreu um erro inesperado.";

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => "Falha no servidor.";
}
