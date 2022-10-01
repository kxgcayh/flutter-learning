import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm({
    Key? key,
    this.hintText,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.inputDecoration,
    this.validator,
    this.isEnabled = true,
    this.maxLines,
    this.maxLength,
    this.suffixIcon,
  }) : super(key: key);

  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged<String?>? onChanged;
  final InputDecoration? inputDecoration;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final int? maxLines;
  final int? maxLength;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: hintText ?? 'form-$Random()',
      maxLength: maxLength,
      // inputFormatters: inputFormatters ?? [],
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      onChanged: onChanged,
      textAlign: TextAlign.center,
      maxLines: maxLines,
      validator: validator,
      decoration: inputDecoration ??
          InputDecoration(
            suffixIcon: suffixIcon,
            enabled: isEnabled,
            hintText: hintText ?? 'Hint Text',
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(8),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
      style: const TextStyle(color: Colors.black),
    );
  }
}
