import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_firebase/remote_firebase_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ionicons/ionicons.dart';

class StartupScreen extends HookWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<RemoteFirebaseBloc, RemoteFirebaseState>(
        builder: (_, state) {
          if (state is RemoteFirebaseInitial) {
            return const Center(child: CupertinoActivityIndicator());
          } else if (state is RemoteFirebaseError) {
            return const Center(child: Icon(Ionicons.refresh));
          } else if (state is RemoteFirebaseDone) {
            return Text(state.user?.fullName ?? '');
          } else {
            return const Center(child: Icon(Ionicons.bug_outline));
          }
        },
      ),
    );
  }
}
