import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/strings.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/resources/contact.dart';
import 'package:ammu_portfolio/utils/url_launcher.dart';
import 'package:ammu_portfolio/widgets/common/base_layout.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///[HomePage] is a widget that represents the home screen of the application.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      child: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              minWidth: double.infinity,
              minHeight: screenSize.height - 89,
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hi! Im ${Strings.firstName} ✨',
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.displayLarge600?.copyWith(color: AppColors.white),
                ),
                SizedBox(height: 20),
                ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      colors: [AppColors.blackRock, AppColors.purplePizzazz],
                    ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                    );
                  },
                  child: Text(
                    Strings.role,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium600?.copyWith(
                      color: AppColors.white,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width:
                      screenSize.width > 850
                          ? screenSize.width * 0.5
                          : screenSize.width,
                  child: Text(
                    Strings.description,
                    textAlign: TextAlign.center,
                    style: Theme.of(
                      context,
                    ).textTheme.headlineSmall?.copyWith(color: AppColors.white),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 20,
                  children: [
                    IconButton(
                      onPressed: () {
                        UrlLauncher().launchInBrowser(Contact.githubUrl);
                      },
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: FaIcon(
                        FontAwesomeIcons.github,
                        color: AppColors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        UrlLauncher().launchInBrowser(Contact.linkedInUrl);
                      },
                      constraints: BoxConstraints(),
                      padding: EdgeInsets.zero,
                      icon: FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
