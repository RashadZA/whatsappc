import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:whatsappc/utils/design_utils.dart';

class CoreTextField extends StatelessWidget {
  final bool readOnly;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final double? fontSize;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final Color? textColor;
  final String? helperText;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? suffixText;
  final void Function()? onTap;
  final Color? hintTextColor;
  final void Function(String)? onSubmit;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool isItSearchField;

  const CoreTextField({
    Key? key,
    this.readOnly = false,
    this.obscureText = false,
    this.isItSearchField = false,
    this.labelText,
    this.prefixIcon,
    this.helperText,
    this.fontSize,
    this.maxLines = 1,
    this.minLines = 1,
    this.focusNode,
    this.onTap,
    this.fillColor,
    this.onSubmit,
    this.textColor,
    this.onChanged,
    this.onEditingComplete,
    this.suffixText,
    this.suffixIcon,
    this.inputFormatters,
    this.controller,
    this.validator,
    this.keyboardType,
    this.hintTextColor,
    this.textInputAction = TextInputAction.next,
    this.hintText,
  }) : super(key: key);

  static String _search = "Search...";

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius:  BorderRadius.circular(16),
    borderSide:
    BorderSide(width: 1, color: primaryColor.withOpacity(.67)),
  );

  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(width: 1, color: primaryColor),
  );

  static OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(width: 1, color: redAccentColor),
  );
  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide:
    BorderSide(width: 1, color: redAccentColor.withOpacity(.5)),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      cursorHeight: 20,
      autocorrect: false,
      minLines: minLines,
      readOnly: readOnly,
      maxLines: maxLines,
      focusNode: focusNode,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      cursorColor: primaryColor,
      textInputAction: isItSearchField ? TextInputAction.done : textInputAction,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      style: AppTextTheme.text16.copyWith(
        fontSize: fontSize,
        color: textColor ?? textPrimaryColor,
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: labelText,
        hintText: isItSearchField ? _search : hintText,
        suffixIcon: suffixIcon,
        labelStyle: AppTextTheme.text16.copyWith(
          color: hintTextColor ?? primaryColor,
          fontSize: fontSize,
        ),
        filled: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
        fillColor: isItSearchField ? Colors.grey.shade300 : fillColor ?? whiteColor,
        prefixIcon: prefixIcon,
        suffixText: suffixText,
        helperText: helperText,
        errorBorder: isItSearchField ?  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(20),
          borderSide:
          const BorderSide(width: 0, color: transparent),
        ) : errorBorder,
        enabledBorder: isItSearchField ?  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(20),
          borderSide:
          const BorderSide(width: 0, color: transparent),
        ) : enabledBorder,
        focusedBorder: isItSearchField ?  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(20),
          borderSide:
          const BorderSide(width: 0, color: transparent),
        ) : focusedBorder,
        focusedErrorBorder: isItSearchField ?  OutlineInputBorder(
          borderRadius:  BorderRadius.circular(20),
          borderSide:
          const BorderSide(width: 0, color: transparent),
        ) : focusedErrorBorder,
        suffixStyle:
        AppTextTheme.text18.copyWith(fontWeight: FontWeight.w600),
        helperStyle: AppTextTheme.text14
            .copyWith(fontSize: 12, color: primaryColor),
      ),
    );
  }
}