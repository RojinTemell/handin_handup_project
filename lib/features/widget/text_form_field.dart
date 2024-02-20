// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    Key? key,
    required this.hintText,
    required this.keyboardType,
    this.visiblePassword,
    required this.controller,
  }) : super(key: key);

  final String hintText;
  final TextInputType keyboardType;
  final bool? visiblePassword;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[600]?.withOpacity(0.5),
            borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          controller:controller ,
          keyboardType: keyboardType,
          obscureText: visiblePassword ?? false,
          textInputAction: TextInputAction.next,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Lütfen alanı doldurun';
            }
            return null;
          },
        ),
      ),
    );
  }
}
