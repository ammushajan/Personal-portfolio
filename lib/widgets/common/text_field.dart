import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/themes/typography.dart';

///[CommonTextField] is a reusable text field widget with a label and helper text.
class CommonTextField extends StatelessWidget {
  final String label;
  final String helperText;
  final int maxLines;
  const CommonTextField({
    required this.label,
    required this.helperText,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.white),
        ),
        border: OutlineInputBorder(),
        hintText: helperText,
        hintStyle: Theme.of(
          context,
        ).textTheme.labelLarge600?.copyWith(color: AppColors.white),
        labelStyle: Theme.of(
          context,
        ).textTheme.labelLarge600?.copyWith(color: AppColors.white),
        hoverColor: AppColors.purplePizzazz,
      ),
      maxLines: maxLines,
    );
  }
}
