import 'package:flutter/material.dart';

class UtilGlobals {
  static String maskString(String input) {
    if (input.length <= 4) {
      return input;
    }
    return '${input.substring(0, 2)}...${input.substring(input.length - 2)}';
  }

  static IconData getErrorIcon(String level) {
    switch (level.toLowerCase()) {
      case 'error':
        return Icons.error;
      case 'warning':
        return Icons.warning;
      case 'info':
        return Icons.info;
      default:
        return Icons.bug_report;
    }
  }

  static Color getErrorColor(String level) {
    switch (level.toLowerCase()) {
      case 'error':
        return Colors.redAccent;
      case 'warning':
        return Colors.amber;
      case 'info':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
