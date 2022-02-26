import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/views/home/home_view.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/views/login/login_view.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/views/startup/components/authentication_error_widget.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/views/startup/components/unexpected_error_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class StartupScreen extends HookWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: BlocBuilder<RemoteAuthenticationBloc, RemoteAuthenticationState>(
          builder: (_, state) {
            if (state is AuthenticationInitial) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state is AuthenticationError) {
              return buildAuthenticationErrorWidget(state);
            } else if (state is LoggedIn) {
              return const HomeScreen();
            } else if (state is LoggedOut) {
              return const LoginScreen();
            } else {
              return buildUnexpectedErrorWidget();
            }
          },
        ),
      ),
    );
  }
}
