abstract class UseCaseWithParams<T, P> {
  Future<T> call({required P params});
}
