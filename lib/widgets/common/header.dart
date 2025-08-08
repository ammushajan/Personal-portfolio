import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:personal_portfolio/themes/colors.dart';
import 'package:personal_portfolio/themes/typography.dart';
import 'package:personal_portfolio/widgets/common/flow_constants.dart';

///[Header] is a custom app bar widget that displays the main navigation links
/// for the application. It includes links to Home, About Me, Projects, and Contact.
class Header extends StatefulWidget {
  final int currentIndex;
  const Header({this.currentIndex = 0, super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.purplePizzazz, AppColors.cyan],
        ),
        border: Border(
          bottom: BorderSide(
            color: AppColors.white.withValues(alpha: 0.2),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(headerList.length, (index) {
          final header = headerList[index];
          return Material(
            color:
                widget.currentIndex == index
                    ? AppColors.white.withValues(alpha: 0.2)
                    : Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
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
