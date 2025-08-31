import 'package:flutter/material.dart';

class PaletteColorWidget extends StatelessWidget {
  const PaletteColorWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });

  final Color color;
  final void Function()? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: isSelected
              ? Border.all(
                  color: Colors.white,
                  strokeAlign: BorderSide.strokeAlignInside,
                  width: 4,
                )
              : null,
        ),
        child: isSelected ? const Center(child: Icon(Icons.check)) : null,
      ),
    );
  }
}
