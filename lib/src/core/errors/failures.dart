import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String get message;
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];

  @override
  String get message => "Falha no servidor.";
}
