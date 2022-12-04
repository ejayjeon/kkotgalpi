import 'package:app/common/themes/color_schemes.g.dart';
import 'package:app/common/themes/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String? hintText;
  final String? errorText;
  final bool isPassword;
  final bool autoFocus;
  final ValueChanged<String>? onChanged;
  final IconData? prefixIcon;

  const CustomInput({
    super.key,
    this.hintText,
    this.errorText,
    this.isPassword = false,
    this.autoFocus = false,
    required this.onChanged,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final baseBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: lightColorScheme.primary,
        width: 1.0,
      ),
    );
    return TextFormField(
        cursorColor: lightColorScheme.primary,
        obscureText: isPassword,
        autofocus: autoFocus,
        onChanged: onChanged,
        decoration: lightInput.copyWith(
          icon: Icon(prefixIcon),
          hintText: hintText,
          errorText: errorText,
          filled: true,
        ));
  }
}
