import 'package:dio/dio.dart';

abstract class DataState<T> {
  const DataState({this.data, this.dioError, this.errorMessage});

  final T? data;
  final DioError? dioError;
  final String? errorMessage;

  String get formatedErrorMessage {
    return dioError != null ? (dioError?.message ?? '') : (errorMessage ?? '');
  }
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({T? data, DioError? error, String? errorMessage})
      : super(data: data, dioError: error, errorMessage: errorMessage);
}
