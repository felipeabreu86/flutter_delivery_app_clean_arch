import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/enums/block_process_state_enum.dart';

abstract class BlocWithState<E, S> extends Bloc<E, S> {
  BlocWithState(S initialState) : super(initialState);

  BlockProcessState _state = BlockProcessState.idle;
  BlockProcessState get blocProgressState => _state;

  Future<void> runBlocProcess(Future<void> Function() process) async {
    if (_state == BlockProcessState.idle) {
      _state = BlockProcessState.busy;
      await process();
      _state = BlockProcessState.idle;
    }
  }
}
