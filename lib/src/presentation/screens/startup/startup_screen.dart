import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/home/home_screen.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/login/login_screen.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/startup/components/authentication_error_widget.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/screens/startup/components/unexpected_error_widget.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({Key? key}) : super(key: key);

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
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
