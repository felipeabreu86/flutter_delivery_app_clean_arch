import 'package:flutter_bloc/flutter_bloc.dart';

enum BLockProcessState {
  busy,
  idle,
}

abstract class BlocWithState<E, S> extends Bloc<E, S> {
  BlocWithState(S initialState) : super(initialState);

  BLockProcessState _state = BLockProcessState.idle;

  BLockProcessState get blocProgressState => _state;

  Stream<S> runBlocProcess(Stream<S> Function() process) async* {
    if (_state == BLockProcessState.idle) {
      _state = BLockProcessState.busy;
      yield* process();
      _state = BLockProcessState.idle;
    }
  }
}
