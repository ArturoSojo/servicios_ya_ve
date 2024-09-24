import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';

// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  int selectedIndex;
  final onItemTapped;
  CustomBottomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
      color: Colors.transparent,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            currentIndex: widget.selectedIndex,
            onTap: widget.onItemTapped,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            items: [
              (widget.selectedIndex == 0)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/home-filled.svg',
                          color: AppColor.primary),
                      label: 'Inicio',
                      tooltip: 'Inicio')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/home.svg',
                          color: Colors.grey[600]),
                      label: 'Inicio',
                      tooltip: 'Inicio'),
              (widget.selectedIndex == 1)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/analitica.svg',
                          color: AppColor.primary, height: 28, width: 26),
                      label: 'Analítica',
                      tooltip: 'Analítica')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/analitica.svg',
                          color: Colors.grey[600], height: 28, width: 26),
                      label: 'Analítica',
                      tooltip: 'Analítica'),
              (widget.selectedIndex == 2)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/etiqueta-de-precio_1.svg',
                          color: AppColor.primary,
                          height: 28,
                          width: 26),
                      label: 'Ventas',
                      tooltip: 'Ventas')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                          'assets/icons/etiqueta-de-precio_1.svg',
                          color: Colors.grey[600],
                          height: 28,
                          width: 26),
                      label: 'Ventas',
                      tooltip: 'Ventas'),
              (widget.selectedIndex == 3)
                  ? BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/carro-_1_.svg',
                          color: AppColor.primary, height: 28, width: 26),
                      label: 'Gastos',
                      tooltip: 'Gastos')
                  : BottomNavigationBarItem(
                      icon: SvgPicture.asset('assets/icons/carro.svg',
                          color: Colors.grey[600], height: 28, width: 26),
                      label: 'Gastos',
                      tooltip: 'Gastos'),
            ],
          ),
        ),
      ),
    );
  }
}
