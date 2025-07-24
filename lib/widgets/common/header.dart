import 'package:flutter/material.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/resources/strings.dart';
import 'package:personal_portfolio/themes/typography.dart';

///[Header] is a custom app bar widget that displays the main navigation links
/// for the application. It includes links to Home, About Me, Projects, and Contact.
class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: AppColors.white,
      child: Row(
        children: [
          InkWell(
            child: Text(
              Strings.homeLabel,
              style: Theme.of(
                context,
              ).textTheme.labelLarge600!.apply(color: AppColors.black),
            ),
          ),
          Spacer(),
          InkWell(
            child: Text(
              Strings.aboutLabel,
              style: Theme.of(
                context,
              ).textTheme.labelLarge600!.apply(color: AppColors.black),
            ),
          ),
          Spacer(),
          InkWell(
            child: Text(
              Strings.projectsLabel,
              style: Theme.of(
                context,
              ).textTheme.labelLarge600!.apply(color: AppColors.black),
            ),
          ),
          Spacer(),
          InkWell(
            child: Text(
              Strings.contactLabel,
              style: Theme.of(
                context,
              ).textTheme.labelLarge600!.apply(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
