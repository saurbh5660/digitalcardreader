import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CommonTextfield extends StatelessWidget {
  final String title;
  final String? hintText;
  final bool? showTitle;
  final bool? isDense;
  final bool? enabled;
  final bool? readOnly;
  final bool? obsecure;
  final Color? fillColor;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final double? bottomMargin;
  final int? maxLength;
  final int? maxLines;
  final TextStyle? style;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final TextAlign? textAlign;
  final BorderSide? borderSide;
  final InputBorder? inputBorder;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final void Function(String)? onChange;
  final VoidCallback? onTap;

  const CommonTextfield(
    this.title, {
    super.key,
    this.hintText,
    this.showTitle,
    this.isDense,
    this.enabled,
    this.readOnly,
    this.obsecure,
    this.focusNode,
    this.prefix,
    this.suffix,
    this.controller,
    this.bottomMargin,
    this.maxLength,
    this.maxLines,
    this.style,
    this.titleStyle,
    this.hintStyle,
    this.fillColor,
    this.borderSide,
    this.inputBorder,
    this.keyboardType,
    this.textAlign,
    this.textInputAction,
    this.textCapitalization,
    this.inputFormatters,
    this.validator,
    this.onChange,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomMargin ?? 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle ?? true)
            Text(
              " $title:",
              style:
                  titleStyle ??
                  TextStyle(
                    fontSize: 13,
                    fontFamily: GoogleFonts.crimsonText().fontFamily,
                  ),
            ),
          if (showTitle ?? true) const SizedBox(height: 5),
          TextFormField(
            cursorColor: AppColors.swatch,
            textAlign: textAlign ?? TextAlign.start,
            enabled: enabled,
            readOnly: readOnly ?? false,
            obscureText: obsecure ?? false,
            focusNode: focusNode,
            controller: controller,
            maxLength: maxLength,
            style:
                style ??
                TextStyle(
                  fontWeight: FontWeight.w900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
            keyboardType: keyboardType,
            textCapitalization:
                textCapitalization ?? TextCapitalization.sentences,
            textInputAction: textInputAction ?? TextInputAction.next,
            inputFormatters: inputFormatters,
            maxLines: maxLines ?? 1,
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: hintText ?? title,
              isDense: isDense ?? false,
              prefixIcon: prefix,
              suffixIcon: suffix,
              counterText: "",
              hintStyle:
                  hintStyle ??
                  TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: AppColors.textGrey,
                  ),
              filled: true,
              fillColor: fillColor ?? AppColors.card,
              focusedBorder:
                  inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
              enabledBorder:
                  inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
              errorBorder:
                  inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
              focusedErrorBorder:
                  inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
              border:
                  inputBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: borderSide ?? BorderSide.none,
                  ),
            ),
            validator: validator,
            onChanged: onChange,
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
