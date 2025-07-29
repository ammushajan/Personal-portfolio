import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/typography.dart';
import 'package:personal_portfolio/widgets/common/flow_constants.dart';

///[Header] is a custom app bar widget that displays the main navigation links
/// for the application. It includes links to Home, About Me, Projects, and Contact.
class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 30);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(headerList.length, (index) {
          final header = headerList[index];
          return Material(
            color: Colors.transparent,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              onTap: () {
                context.go(header.route);
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),

                child: Text(
                  header.title,
                  style: Theme.of(context).textTheme.headlineExtraSmall600
                      ?.apply(color: AppColors.white),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
