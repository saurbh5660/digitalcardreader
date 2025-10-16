import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CommonButton extends StatefulWidget {
  final String title;
  final AsyncCallback onPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? style;
  final BorderRadius? borderRadius;
  const CommonButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height,
    this.width,
    this.style,
    this.backgroundColor,
    this.foregroundColor,
    this.borderRadius,
  });

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  bool isLoading = false;

  Future<void> eventHandler() async {
    setState(() => isLoading = true);
    await widget.onPressed();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 50,
      width: widget.width ?? double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: widget.foregroundColor ?? AppColors.white,
          backgroundColor: widget.backgroundColor ?? AppColors.swatch,
          shape: RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(50),
          ),
        ),
        onPressed: isLoading ? () {} : eventHandler,
        child:
            // ? CircularProgressIndicator(color: AppColors.white)
             Text(
                widget.title,
                style:
                    widget.style ??
                    TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.alatsi().fontFamily,
                      letterSpacing: 0.6,
                    ),
              ),
      ),
    );
  }
}
