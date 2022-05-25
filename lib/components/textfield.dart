import 'package:flutter/material.dart';
import 'package:get/get.dart';

class testfieldController extends GetxController {
  testfieldController();
}

class MyTextField extends StatelessWidget {
  MyTextField(
      {Key? key,
      required this.controller,
      required this.data,
      this.decoration,
      this.labelText,
      this.hintText,
      this.prefixIcon})
      : super(key: key);

  final controller;
  var data;
  final decoration;
  final labelText;
  final hintText;
  final prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (_) {
        data = _;
      },
      decoration: decoration.copyWith(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: IconButton(
          icon: const Icon(Icons.cancel),
          onPressed: () {
            data = '';
            controller.clear();
          },
        ),
      ),
    );
  }
}
