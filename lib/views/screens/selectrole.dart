import 'package:flutter/material.dart';

class RoleSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Select Your Role',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16), // Space between title and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => selectRole('buyer'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Colors.transparent, // Background color
                  side: BorderSide(color: Colors.grey), // Border color
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/cliente.jpg', width: 50, height: 50), // Adjust size as needed
                  ],
                ),
              ),
              SizedBox(width: 16), // Space between buttons
              ElevatedButton(
                onPressed: () => selectRole('seller'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  primary: Colors.transparent, // Background color
                  side: BorderSide(color: Colors.grey), // Border color
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/proveedor.jpg', width: 50, height: 50), // Adjust size as needed
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void selectRole(String role) {
    // Implement your role selection logic here
    print('Selected role: $role');
  }
}
