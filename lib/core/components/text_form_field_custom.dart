import 'package:flutter/material.dart';
import 'package:youtube_clone/core/utils/manager/app_color_manager.dart';

class TextFormFieldCustom extends StatelessWidget {
  const TextFormFieldCustom({
    Key? key,
    required this.hintText,
    bool? obscure,
    this.controller,
    this.suffix,
    bool? isSuffix,
    this.validator,
  })  : _obscure = obscure ?? false,
        _isSuffix = isSuffix ?? false,
        super(key: key);
  final String hintText;
  final Widget? suffix;
  final bool? _isSuffix;
  final TextEditingController? controller;
  final bool _obscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColorManager.greyColor.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: AppColorManager.blueColor,
        obscureText: _obscure,
        validator: validator,
        obscuringCharacter: "*",
        decoration: InputDecoration(
          hintText: hintText,
          fillColor: AppColorManager.accentColor,
          filled: true,
          suffixIcon: _isSuffix == true ? suffix : null,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
