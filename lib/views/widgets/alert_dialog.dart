import 'package:flutter/material.dart';

class Alerts {
  static AlertDialog error(String message, callback) {
    AlertDialog alert = AlertDialog(
      icon: const Icon(Icons.error_outline, size: 30),
      iconColor: Colors.red,
      actions: [
        TextButton(
          onPressed: callback,
          child: Text("Regresar"),
        )
      ],
      content: Text(message, textAlign: TextAlign.center),
    );
    return alert;
  }

  static AlertDialog warning(String message, callback) {
    AlertDialog alert = AlertDialog(
      icon: const Icon(Icons.warning_amber, size: 30),
      iconColor: const Color(0xFFffb300),
      actions: [
        TextButton(
          onPressed: callback,
          child: Text("Regresar"),
        )
      ],
      content: Text(message, textAlign: TextAlign.center),
    );
    return alert;
  }

  static AlertDialog success(String message, callback,
      {String buttonText = "Regresar"}) {
    AlertDialog alert = AlertDialog(
      icon: const Icon(Icons.check_circle_rounded, size: 45),
      iconColor: Colors.green,
      actions: [
        TextButton(
          onPressed: callback,
          child: Text(
            buttonText,
          ),
        )
      ],
      content: Text(message, textAlign: TextAlign.center),
    );
    return alert;
  }

  static AlertDialog dialogTwoButtonActions(
      {Widget child = const Text(""),
      List<String> actionButtonsNames = const ["REGRESAR", "ACEPTAR"],
      callback,
      callbackTwo}) {
    AlertDialog alert = AlertDialog(
      icon: const Icon(Icons.warning_amber, size: 30),
      iconColor: Colors.orange,
      actions: [
        TextButton(onPressed: callback, child: Text(actionButtonsNames[0])),
        TextButton(
          onPressed: callbackTwo,
          child: Text(actionButtonsNames[1]),
        )
      ],
      content: child,
    );

    return alert;
  }
}
