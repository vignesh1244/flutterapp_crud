import 'package:flutter/material.dart';
// import '../../resources/constants/font_weights.dart';

class ErrorAlertSimpleDialog {
  ErrorAlertSimpleDialog._();

  static Future<void> show(
      {required String message,
      required BuildContext context,
      String? title}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              title ?? "Error",
            ),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK', style: TextStyle(fontSize: 16)))
            ],
          ),
        );
      },
    );
  }
}
