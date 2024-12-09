import 'package:flutter/material.dart';
import 'package:mobile_tokoku/src/utils/TColors.dart';

class CommonTextfield extends StatefulWidget {
  const CommonTextfield({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.helperText,
    this.labelText,
    this.hasError = false,
    this.prefixIconData,
    this.passwordHideIcon,
    this.passwordShowIcon,
    this.textInputAction,
    this.textColor,
    this.maxLines = 1,
    this.accentColor,
  });

  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final String? helperText;
  final String? labelText;
  final int? maxLines;
  final bool hasError;
  final IconData? prefixIconData;
  final IconData? passwordHideIcon;
  final IconData? passwordShowIcon;
  final TextInputAction? textInputAction;
  final Color? textColor;
  final Color? accentColor;

  @override
  State<CommonTextfield> createState() => _CommonTextfieldState();
}

class _CommonTextfieldState extends State<CommonTextfield> {
  bool _isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isObscure,
      onChanged: widget.onChanged,
      maxLines: !_isObscure ? widget.maxLines : 1,
      style: const TextStyle(color: Colors.black45, fontSize: 13), // Set text color
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.black45, fontSize: 13),
        labelStyle: const TextStyle(color: Colors.black45), // Set accent color
        helperText: widget.helperText,
        prefixIcon: Icon(widget.prefixIconData, color: Colors.black45),
        suffixIcon: widget.obscureText
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(_isObscure
                    ? widget.passwordShowIcon ?? Icons.visibility
                    : widget.passwordHideIcon ?? Icons.visibility_off),
                color: widget.accentColor,
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.white, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.white, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: TColors.white, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        // You can add more customization to the decoration as needed
        // For example, adding icons, labels, etc.
      ),
    );
  }
}
