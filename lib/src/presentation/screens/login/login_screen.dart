import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/params/user_request_params.dart';
import 'package:flutter_firebase_login_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';
import 'package:ionicons/ionicons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Tela de Login"),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildFloatingActionButton() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatingActionButtonPressed(context),
        child: const Icon(Ionicons.log_in, color: Colors.white),
      ),
    );
  }

  void _onFloatingActionButtonPressed(BuildContext context) {
    BlocProvider.of<RemoteAuthenticationBloc>(context).add(
      LoginWithEmailAndPassword(
        UserRequestParams(
          email: "felipeabreu.rj@gmail.com",
          password: "123456",
        ),
      ),
    );
  }
}
