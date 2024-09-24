import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final bool showProfilePhoto;
  final ImageProvider profilePhoto;
  final profilePhotoOnPressed;

  const CustomAppBar(
      {required this.title,
      required this.showProfilePhoto,
      required this.profilePhoto,
      required this.profilePhotoOnPressed});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primary,
      title: title,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        Visibility(
          visible: showProfilePhoto,
          child: Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: IconButton(
              onPressed: profilePhotoOnPressed,
              icon: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  image:
                      DecorationImage(image: profilePhoto, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
      ],
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}
