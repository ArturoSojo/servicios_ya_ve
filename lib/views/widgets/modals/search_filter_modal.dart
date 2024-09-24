import 'package:flutter/material.dart';
import 'package:servicios_ya_ve/views/utils/AppColor.dart';

class SearchFilterModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        // Section 1 - Header
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: AppColor.primaryExtraSoft,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 60,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Resetear',
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
              const Text(
                'Ordenar Por',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter'),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  height: 60,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Text('Cancelar',
                      style: TextStyle(color: Colors.grey)),
                ),
              ),
            ],
          ),
        ),
        // Sort By Option
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 73, 73, 73)))),
          child: ListTileTheme(
            selectedColor: AppColor.primary,
            textColor: Colors.grey,
            child: const ListTile(
              selected: true,
              title: Text('Más nuevos',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ),
        // Sort By Option
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom:
                      BorderSide(color: Color.fromARGB(255, 163, 163, 163)))),
          child: ListTileTheme(
            selectedColor: AppColor.primary,
            textColor: Colors.grey,
            child: const ListTile(
              selected: false,
              title: Text('Más viejos',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ),
        // Sort By Option
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 95, 95, 95)))),
          child: ListTileTheme(
            selectedColor: AppColor.primary,
            textColor: Colors.grey,
            child: const ListTile(
              selected: false,
              title: Text('Popular',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
          ),
        ),
      ],
    );
  }
}
