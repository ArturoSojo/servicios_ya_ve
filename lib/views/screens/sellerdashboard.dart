import 'package:flutter/material.dart';

class SellerDashboard extends StatefulWidget {
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  String? modalType;
  String? notificationMessage;
  final serviceData = ServiceData();
  final bankTransferData = BankTransferData();
  final binanceData = BinanceData();
  final mobileData = MobileData();
  
  final List<String> paymentMethods = ['bankTransfer', 'binance', 'mobile'];
  final Map<String, bool> paymentSelections = {
    'bankTransfer': false,
    'binance': false,
    'mobile': false,
  };

  void openModal(String type) {
    setState(() {
      modalType = type;
    });
  }

  void closeModal() {
    setState(() {
      modalType = null;
    });
  }

  void submitService() {
    // Handle service registration logic
    print('Service registered: ${serviceData.nombre}');
  }

  void submitBankTransfer() {
    // Handle bank transfer submission logic
    print('Bank Transfer submitted: ${bankTransferData.cuentaBancaria}');
  }

  void submitBinance() {
    // Handle Binance submission logic
    print('Binance submitted: ${binanceData.binanceEmail}');
  }

  void submitMobile() {
    // Handle mobile submission logic
    print('Mobile submitted: ${mobileData.cedula}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome, Seller!')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Payment Options
            ...paymentMethods.map((method) {
              return CheckboxListTile(
                title: Text(method.capitalize()),
                value: paymentSelections[method],
                onChanged: (bool? value) {
                  setState(() {
                    paymentSelections[method] = value!;
                    if (value) {
                      openModal(method);
                    } else {
                      closeModal();
                    }
                  });
                },
              );
            }).toList(),

            // Notification Message
            if (notificationMessage != null)
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.yellow,
                child: Text(notificationMessage!),
              ),

            // Service Registration Form
            if (modalType == null) ...[
              Text('Register Service', style: TextStyle(fontSize: 20)),
              TextField(
                decoration: InputDecoration(labelText: 'Nombre'),
                onChanged: (value) => serviceData.nombre = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Descripción'),
                onChanged: (value) => serviceData.descripcion = value,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                onChanged: (value) => serviceData.precio = double.tryParse(value),
              ),
              CheckboxListTile(
                title: Text('Destacado'),
                value: serviceData.destacado,
                onChanged: (value) {
                  setState(() {
                    serviceData.destacado = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: submitService,
                child: Text('Register Service'),
              ),
            ],

            // Modal Forms
            if (modalType != null) ...[
              if (modalType == 'bankTransfer') _buildBankTransferForm(),
              if (modalType == 'binance') _buildBinanceForm(),
              if (modalType == 'mobile') _buildMobileForm(),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildBankTransferForm() {
    return Column(
      children: [
        Text('Bank Transfer Form', style: TextStyle(fontSize: 20)),
        TextField(
          decoration: InputDecoration(labelText: 'Account Number'),
          onChanged: (value) => bankTransferData.cuentaBancaria = value,
        ),
        TextField(
          decoration: InputDecoration(labelText: "Account Holder's Name"),
          onChanged: (value) => bankTransferData.nombreTitular = value,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'ID Number / RIF'),
          onChanged: (value) => bankTransferData.rif = value,
        ),
        ElevatedButton(
          onPressed: submitBankTransfer,
          child: Text('Submit'),
        ),
        TextButton(
          onPressed: closeModal,
          child: Text('Close'),
        ),
      ],
    );
  }

  Widget _buildBinanceForm() {
    return Column(
      children: [
        Text('Binance Form', style: TextStyle(fontSize: 20)),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
          onChanged: (value) => binanceData.binanceEmail = value,
        ),
        ElevatedButton(
          onPressed: submitBinance,
          child: Text('Submit'),
        ),
        TextButton(
          onPressed: closeModal,
          child: Text('Close'),
        ),
      ],
    );
  }

  Widget _buildMobileForm() {
    return Column(
      children: [
        Text('Mobile Form', style: TextStyle(fontSize: 20)),
        TextField(
          decoration: InputDecoration(labelText: 'ID Number'),
          onChanged: (value) => mobileData.cedula = value,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Phone Number'),
          onChanged: (value) => mobileData.numeroTelefono = value,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Bank'),
          onChanged: (value) => mobileData.banco = value,
        ),
        ElevatedButton(
          onPressed: submitMobile,
          child: Text('Submit'),
        ),
        TextButton(
          onPressed: closeModal,
          child: Text('Close'),
        ),
      ],
    );
  }
}

// Data classes for service and payment forms
class ServiceData {
  String nombre = '';
  String descripcion = '';
  double? precio;
  bool destacado = false;
}

class BankTransferData {
  String cuentaBancaria = '';
  String nombreTitular = '';
  String rif = '';
}

class BinanceData {
  String binanceEmail = '';
}

class MobileData {
  String cedula = '';
  String numeroTelefono = '';
  String banco = '';
}

// Extension to capitalize the first letter of a string
extension StringExtension on String {
  String capitalize() {
    return this[0].toUpperCase() + this.substring(1);
  }
}
