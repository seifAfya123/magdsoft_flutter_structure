import 'package:flutter/material.dart';

import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

// ignore: must_be_immutable
class CustomeTextFeild extends StatelessWidget {
  final TextEditingController controller;
  // final RegExp? regExp;
  String hintText_;
  String errorMessage;
  CustomeTextFeild({
    Key? key,
    required this.controller,
    // this.regExp,
    required this.hintText_,
    required this.errorMessage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      textAlign: TextAlign.left,
      // validator: (val) {
      //   if (val!.isEmpty) {
      //     return errorMessage;
      //   }
      //   if (regExp != null) {
      //     if (!regExp!.hasMatch(val)) {
      //       return errorMessage;
      //     }
      //   } else {
      //     return null;
      //   }
      // },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText_,
        hintStyle: const TextStyle(
          color: AppColor.darkGrey,
        ),
        fillColor: AppColor.lightGrey,
        filled: true,
      ),
    );
  }
}
