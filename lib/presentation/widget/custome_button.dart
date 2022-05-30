import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class CustomeButton extends StatelessWidget {
  String txt;
  VoidCallback function;
  Color btnColor;
  CustomeButton({
    Key? key,
    required this.txt,
    required this.function,
    required this.btnColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaqueryWidth = MediaQuery.of(context).size.width;
    double mediaqueryHight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: mediaqueryWidth * 0.37,
        height: mediaqueryHight * 0.07,
        child: Text(
          txt,
          style: const TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: btnColor,
        ),
      ),
    );
  }
}
