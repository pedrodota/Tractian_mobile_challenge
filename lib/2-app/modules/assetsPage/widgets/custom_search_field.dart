import 'package:flutter/material.dart';
import 'package:tractian_challenge/2-app/utils/app_measurements.dart';
import 'package:tractian_challenge/2-app/utils/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const TextFieldWidget({super.key, this.hintText, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: textFieldBackgroundColor,
          prefixIcon: const Icon(Icons.search, color: hintTextColor),
          hintText: hintText,
          hintStyle: const TextStyle(color: hintTextColor),
          border: defaultInputBorder,
          errorBorder: defaultInputBorder,
          enabledBorder: defaultInputBorder,
          focusedBorder: defaultInputBorder,
          disabledBorder: defaultInputBorder,
          focusedErrorBorder: defaultInputBorder,
        ),
      ),
    );
  }

  static OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(3.w),
    borderSide: BorderSide.none,
  );
}
