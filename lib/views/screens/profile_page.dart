import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';
import 'package:servicios_ya_ve/views/widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: const Text('Mi Perfil',
            style: TextStyle(
                fontFamily: 'inter',
                fontWeight: FontWeight.w400,
                fontSize: 16)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Editar',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: AppColor.primary,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Código para abrir el gestor de archivos');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: const DecorationImage(
                          image: AssetImage('assets/images/pp.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Cambiar foto de perfil',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/camera.svg',
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: const EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Correo',
                  value: 'arturosojovivas@gmail.com',
                  padding: EdgeInsets.all(16),
                  valueBackground: Colors.white,
                ),
                const UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Nombre Completo',
                  value: 'Arturo Sojo',
                  padding: EdgeInsets.all(16),
                  valueBackground: Colors.white,
                ),
                UserInfoTile(
                  margin: const EdgeInsets.only(bottom: 16),
                  label: 'Tipo de Suscripción',
                  value: 'Suscripción Premium',
                  valueBackground: AppColor.secondary,
                  padding: const EdgeInsets.all(16),
                ),
                const UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Tiempo de Suscripción',
                  value: 'Hasta el 22 Oct 2024',
                  padding: EdgeInsets.all(16),
                  valueBackground: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
