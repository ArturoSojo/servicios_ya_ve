import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicios_ya_ve/views/screens/page_switcher.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';
import 'package:servicios_ya_ve/views/widgets/modals/login_modal.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

String typeDniSelected = "V";
String typePhoneSelected = "412";

List<String> typesDocs = ["V", "E", "J", "P"];
List<String> typesPhones = ["412", "414", "416", "424", "426", "212"];

class RegisterModal extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String type_doc = typesDocs.first;
  String code_phone = typesPhones.first;
  TextEditingController _fechaNacimientoController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    // emailController.text = MyUtils.profile!.emailDeflt!;

    getDefaultData();
    selectedDate = DateTime.now();
    // Inicialmente, mostramos todas las preguntas
  }

  String? validateNumber(phone) {
    var t = r'[0-9]{3}\-[0-9]{4}';
    String pattern = t;
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(phone) && phone != null && phone != "") {
      return 'Ingrese un número de teléfono válido';
    } else {
      return null;
    }
  }

  bool _isChecked = false;
  String _fechaNacimiento = '';

  void _onChanged(String value) {
    if (_isChecked) {
      // Formatear la fecha en DD/MM/YYYY
      if (value.length == 8) {
        // Asegúrate de que el usuario ingrese 8 dígitos
        String dia = value.substring(0, 2);
        String mes = value.substring(2, 4);
        String anio = value.substring(4, 8);

        _fechaNacimiento = '$dia/$mes/$anio';
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  var maskFormatter = MaskTextInputFormatter(
      mask: '###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void setTypeDoc(String? type) {
    typeDniSelected = type ?? typesDocs[0];
  }

  getDefaultData() async {}

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
                  'Registro',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'inter'),
                ),
              ),
              // Form
              Form(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: 80.0,
                            height: 75.0,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2))),
                              icon: const Icon(Icons.arrow_downward),
                              value: typeDniSelected,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontFamily: "Kalinga"),
                              isExpanded: true,
                              onChanged: (type) => setTypeDoc(type),
                              items: typesDocs
                                  .map<DropdownMenuItem<String>>((String type) {
                                return DropdownMenuItem<String>(
                                    value: type,
                                    child: Center(
                                      child: Text(type,
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                    ));
                              }).toList(),
                            )),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            enableInteractiveSelection: false,
                            maxLength: 9,
                            readOnly: false,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                                /* errorStyle: TextStyle(fontSize: 14), */
                                prefixIcon: Icon(Icons.person),
                                labelText: "RIF/CI",
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.blue, width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1.0),
                                ),
                                hintText: ''),
                          ),
                        )
                      ],
                    ),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre ',
                        hintText: 'Tu nombre',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _fullNameController,
                      decoration: const InputDecoration(
                        labelText: 'Apellido ',
                        hintText: 'Tu apellido',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Correo',
                        hintText: 'tucorreo@email.com',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        SizedBox(
                            width: 80.0,
                            height: 75.0,
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.blue, width: 2))),
                              icon: const Icon(Icons.arrow_downward),
                              value: typePhoneSelected,
                              elevation: 16,
                              style: const TextStyle(
                                  color: Colors.deepPurple,
                                  fontFamily: "Kalinga"),
                              isExpanded: true,
                              onChanged: (type) => setTypeDoc(type),
                              items: typesPhones
                                  .map<DropdownMenuItem<String>>((String type) {
                                return DropdownMenuItem<String>(
                                    value: type,
                                    child: Center(
                                      child: Text(type,
                                          style: const TextStyle(
                                              color: Colors.grey)),
                                    ));
                              }).toList(),
                            )),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            maxLength: 8,
                            readOnly: false,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            inputFormatters: [maskFormatter],
                            validator: (value) => validateNumber(value),
                            decoration: const InputDecoration(
                                labelText: "Número de teléfono",
                                border: OutlineInputBorder(),
                                hintText: ''),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      keyboardType: TextInputType.number,
                      maxLength: 8, // Limitar a 8 caracteres
                      onChanged: _onChanged,
                      decoration: InputDecoration(
                        labelText: "Ingrese fecha (DDMMYYYY)",
                        hintText: "Ejemplo: 01012000",
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        hintText: '**********',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Repite la Contraseña',
                        hintText: '**********',
                      ),
                    ),
                  ],
                ),
              ), // Register Button
              Container(
                margin: const EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => PageSwitcher()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text('Registrar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                ),
              ),
              // Login textbutton
              TextButton(
                onPressed: () async {
                  // Form validation
                  if (_formKey.currentState!.validate()) {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();
                    String fullName = _fullNameController.text.trim();
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: '¿Ya tienes una cuenta? ',
                    style: const TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Entrar')
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
