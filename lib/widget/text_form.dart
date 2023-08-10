import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  // final String? Function(String?)? validator, onChanged;
  final String? Function(String?)? onChanged;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool? secure;
  final IconData? suffixIcon;
  final String? hintText, text, initialValue;
  final bool enable;
  final int? maxLength, maxLines;

  const AppTextFormField(
      {Key? key,
      required this.controller,
      required this.text,
      //required this.validator,
      this.enable = true,
      this.icon,
      this.maxLength,
      this.keyboardType,
      this.secure,
      this.hintText,
      this.suffixIcon,
      this.onChanged,
      this.textInputAction,
      this.textCapitalization,
      this.initialValue,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
          child: Text(
            '$text',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Color(0xff525252),
            ),
          ),
        ),
        TextFormField(
          maxLength: maxLength,
          enabled: enable,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
                RegExp("[a-zA-Z0-9 space _ / . @]")),
          ],
          initialValue: initialValue,
          onChanged: onChanged,
          obscureText: secure ?? false,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            suffixIcon: icon ?? Icon(suffixIcon, color: Colors.grey),
            contentPadding:
                const EdgeInsets.only(left: 10.0, right: 0.0, top: 12),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
            focusedBorder: const UnderlineInputBorder(),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
