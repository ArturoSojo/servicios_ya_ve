// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import '../../widgets/alert_dialog.dart';

class AuthDeviceScreen extends StatefulWidget {
  String userEmail;
  String userPassword;

  AuthDeviceScreen(
      {super.key, required this.userEmail, required this.userPassword});

  @override
  State<AuthDeviceScreen> createState() => _AuthDeviceScreenState();
}

class _AuthDeviceScreenState extends State<AuthDeviceScreen> {
  Timer _timer = Timer(const Duration(milliseconds: 1), () {});

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text("Verificación del código",
                    textAlign: TextAlign.start, style: TextStyle(fontSize: 30)),
                const SizedBox(height: 10),
                Center(
                    child: Text(
                        "Le enviamos un código por correo electrónico, por favor ingréselo a continuación",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16))),
                const SizedBox(height: 30),
                OtpTextField(
                  clearText: true,
                  numberOfFields: 6,
                  focusedBorderColor: Colors.blue,
                  borderColor: Colors.blue,
                  showFieldAsBox: true,
                  onSubmit: (value) => {},
                ),
                const SizedBox(height: 10),
                const Text(
                  "Ingrese el código recibido por correo electrónico",
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.all(20)),
                            onPressed: _sendCode,
                            child: _textOrProgress(false)))
                  ],
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () => {},
                  child: Text.rich(TextSpan(children: [
                    const TextSpan(
                        text: "¿Correo incorrecto? ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "Regresar",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ))
                  ])),
                  // child: Text.rich("¿Correo incorrecto? Regresar",
                  //     style: subtitleStyleText("", 16)
                  // )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textOrProgress(bool isLoading) {
    if (isLoading) {
      return const SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(
            color: Colors.white,
          ));
    }

    return Text("Reenviar código",
        style: TextStyle(fontSize: 16, color: Colors.white));
  }

  void _sendCode() {}

  void _showError(String errorMsg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Alerts.error(errorMsg, () => Navigator.pop(context));
      },
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
