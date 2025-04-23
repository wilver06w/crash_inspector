import 'package:effective_error_handling/src/shared/utils/ui.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppLoading {
  static void show(
    BuildContext context, {
    bool isClient = false,
    bool useRootNavigator = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return PopScope(
          canPop: false,
          child: Lottie.asset(
            Ui.animationLoadingFetch,
            height: 10,
            width: 4,
          ),
        );
      },
    );
  }
}
