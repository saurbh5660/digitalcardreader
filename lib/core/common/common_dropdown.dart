import 'package:digital_card_grader/core/common/common_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class CommonDropdrown<T> extends StatefulWidget {
  final String hint;
  final List<T> options;
  final TextEditingController controller;
  final void Function(T option) onSelected;
  final String Function(T option) titleBuilder;
  final String? Function(String?)? validator;
  final bool readOnly;
  final bool showTitle;
  final TextStyle? style;
  final TextStyle? hintStyle;

  const CommonDropdrown({
    super.key,
    required this.hint,
    required this.options,
    required this.controller,
    required this.titleBuilder,
    required this.onSelected,
    this.validator,
    this.style,
    this.hintStyle,
    this.readOnly = false,
    this.showTitle = false,
  });

  @override
  State<CommonDropdrown<T>> createState() => _CommonDropdrownState<T>();
}

class _CommonDropdrownState<T> extends State<CommonDropdrown<T>> {
  // SELECTED OPTION
  T? selectedOption;
  // EXPAND OR COLLAPSE
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextfield(
          widget.hint,
          readOnly: true,
          showTitle: widget.showTitle,
          controller: widget.controller,
          validator: widget.validator,
          style: widget.style,
          hintStyle: widget.hintStyle,
          suffix: IconButton(
            onPressed: null,
            icon: Icon(
              isExpanded
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.keyboard_arrow_down_rounded,
            ),
          ),
          onTap: widget.readOnly
              ? null
              : () => setState(() => isExpanded = !isExpanded),
        ),
        if (isExpanded)
          AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                final option = widget.options[index];
                final title = widget.titleBuilder(option);
                return ListTile(
                  onTap: () {
                    setState(() {
                      isExpanded = false;
                      widget.onSelected(option);
                      widget.controller.text = title;
                    });
                  },
                  title: Text(
                    title,
                    style:
                        widget.style ??
                        TextStyle(fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: AppColors.textGrey.withAlpha(100),
                indent: 10,
                endIndent: 10,
              ),
            ),
          ),
      ],
    );
  }
}
