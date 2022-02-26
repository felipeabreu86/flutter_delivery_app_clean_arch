import 'package:flutter/material.dart';
import 'package:flutter_delivery_app_clean_arch/src/core/utils/constants.dart';
import 'package:flutter_delivery_app_clean_arch/src/presentation/blocs/remote_authentication/remote_authentication_bloc.dart';
import 'package:ionicons/ionicons.dart';

Center buildAuthenticationErrorWidget(AuthenticationError state) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Ionicons.refresh),
        const SizedBox(height: 10),
        Text(state.errorMessage ?? kUnexpectedError),
      ],
    ),
  );
}
