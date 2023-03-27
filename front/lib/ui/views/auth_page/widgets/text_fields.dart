// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../common/app_constants.dart';

class CustomTextFields extends StatelessWidget {
  final String hint;
  TextEditingController? controller;

  CustomTextFields({
    this.controller,
    this.hint = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kdDesktopMaxContentWidth * 0.3,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF232323),
        borderRadius: BorderRadius.circular(8),
      ),
      child:         TextField(
    controller: controller,
    decoration: InputDecoration.collapsed(
      hintText: hint,
      hintStyle: TextStyle(
        color: Color(0xff989898),
      ),
      filled: true,
      fillColor: Color(0xFF232323),
    ),
    ),
    );
  }
}

