import 'package:flutter/material.dart';

class AppNavigator {
  static void push(
      BuildContext context, Widget Function(BuildContext) builder) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: builder),
    );
  }

  static void pushReplacement(
      BuildContext context, Widget Function(BuildContext) builder) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: builder),
    );
  }

  static void closePageAndOpenDialog(
      BuildContext context, Widget dialog, bool dismissible) {
    Navigator.of(context).pop();
    openDialog(context, dialog, dismissible);
  }

  static void openDialog(
      BuildContext context, Widget dialog, bool dismissible) {
    showDialog(
      context: context,
      builder: (context) => dialog,
      barrierDismissible: dismissible,
    );
  }

  static void close(BuildContext context) {
    Navigator.of(context).pop();
  }
}
