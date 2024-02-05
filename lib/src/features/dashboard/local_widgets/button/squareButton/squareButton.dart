import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSquareButton extends StatelessWidget {
  final String label;
  final String svgIconPath; // Caminho para o ícone SVG
  final VoidCallback onPressed;
  final Color backgroundColor;
  final TextStyle textStyle;

  CustomSquareButton({
    Key? key,
    required this.label,
    required this.svgIconPath,
    required this.onPressed,
    this.backgroundColor = Colors.green,
    this.textStyle = const TextStyle(fontSize: 16, color: Colors.white),
  }) : super(key: key);

  @override
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: (MediaQuery.of(context).size.width - 112) / 2,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFF008743), // Cor ajustada para #008743
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(  // Alterado de Row para Column
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgIconPath,
              color: Colors.white,
              height: 24,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,  // Alinhado o texto no centro
            ),
          ],
        ),
      ),
    );
  }
}
