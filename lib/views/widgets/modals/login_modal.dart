import 'package:flutter/material.dart';
import 'package:servicios_ya_ve/views/screens/page_switcher.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';

class LoginModal extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            physics: const BouncingScrollPhysics(),
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: MediaQuery.of(context).size.width * 35 / 100,
                  margin: const EdgeInsets.only(bottom: 20),
                  height: 6,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: const Text(
                  'Iniciar',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'inter'),
                ),
              ),
              // Form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        hintText: 'tucorreo@email.com',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'El correo electrónico es obligatorio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintText: '**********',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'La contraseña es obligatoria';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ), // Log in Button
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PageSwitcher()));
                    // Form validation
                    /*
                    if (_formKey.currentState!.validate()) {
                      String email = _emailController.text.trim();
                      String password = _passwordController.text.trim();

                      try {
                        // Firebase user login
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // Optional check against Firestore (replace 'users' with your collection name)
                        final userDoc = FirebaseFirestore.instance
                            .collection('users')
                            .doc(userCredential.user!.uid);
                        final snapshot = await userDoc.get();
                        if (snapshot.exists) {
                          // User exists in Firestore (you can access additional user data here)
                          Navigator.of(context).pop(); // Close the modal
                        } else {
                          // Handle user not found in Firestore (optional)
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Usuario no encontrado')),
                          );
                        }
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('El usuario no existe')),
                          );
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Contraseña incorrecta')),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Error al iniciar sesión: ${e.message}')),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Error al iniciar sesión: $e')),
                        );
                      }
                    }*/
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: AppColor.primarySoft,
                  ),
                  child: Text('Entrar',
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: '¿Olvidaste tu Contraseña? ',
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Restaurar')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
