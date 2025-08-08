import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/themes/typography.dart';

///[IconButtonLabel] is a widget that displays an icon button with a label.
class IconButtonLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  const IconButtonLabel({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.blackRock,
            // TODO : Add gradient if needed
            // gradient: LinearGradient(
            //   colors: [AppColors.blackRock, AppColors.cyan],
            // ),
          ),
          child: IconButton(
            onPressed: () {},
            constraints: BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: Icon(icon, color: AppColors.white),
          ),
        ),
        SizedBox(width: 8.0),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelLarge600?.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
