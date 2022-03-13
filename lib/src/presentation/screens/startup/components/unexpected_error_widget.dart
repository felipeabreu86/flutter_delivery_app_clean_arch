import 'package:flutter/material.dart';
import 'package:flutter_firebase_login_clean_arch/src/core/utils/constants.dart';
import 'package:ionicons/ionicons.dart';

Center buildUnexpectedErrorWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Ionicons.bug_outline),
        SizedBox(height: 10),
        Text(kUnexpectedError),
      ],
    ),
  );
}
