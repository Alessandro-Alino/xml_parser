import 'package:flutter/material.dart';

extension BuildContextHelper on BuildContext {
  ScaffoldMessengerState appSnackBar(
      {required Widget child, required IconData icon, bool? isError}) {
    return ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          width: 450.0,
          duration: const Duration(seconds: 2),
          behavior: SnackBarBehavior.floating,
          backgroundColor: isError == null || isError == false
              ? Colors.green.shade700
              : Colors.red.shade700,
          content: Row(
            spacing: 10.0,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icon
              Icon(
                icon,
                color: Colors.white,
              ),
              // Content
              Flexible(
                child: child,
              ),
            ],
          ),
        ),
      );
  }
}
