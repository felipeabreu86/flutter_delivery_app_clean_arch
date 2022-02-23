import 'package:dio/dio.dart';

abstract class DataState<T> {
  const DataState({this.data, this.dioError});

  final T? data;
  final DioError? dioError;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed({T? data, DioError? error})
      : super(data: data, dioError: error);
}
