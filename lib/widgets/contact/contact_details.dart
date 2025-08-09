import 'package:ammu_portfolio/themes/typography.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/contact.dart';
import 'package:ammu_portfolio/utils/url_launcher.dart';
import 'package:ammu_portfolio/widgets/contact/contact_form.dart';
import 'package:ammu_portfolio/widgets/common/icon_button_label.dart';

///[ContactDetails] is a widget that displays contact information and a form for users to fill out.
/// It includes fields for name, email, and message, along with social media links.
class ContactDetails extends StatelessWidget {
  const ContactDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.white.withValues(alpha: 0.2),
        border: Border.all(
          color: AppColors.blackRock.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: Flex(
        direction: screenSize.width > 850 ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    colors: [AppColors.blackRock, AppColors.purplePizzazz],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  );
                },
                child: Text(
                  Contact.dropMessageHelper,
                  style: Theme.of(context).textTheme.headlineMedium600
                      ?.copyWith(color: AppColors.white),
                ),
              ),
              SizedBox(height: 20),
              IconButtonLabel(icon: Icons.phone, label: Contact.phoneNumber),
              SizedBox(height: 20),
              IconButtonLabel(
                icon: Icons.email,
                label: Contact.emailId,
                onPressed: () {
                  UrlLauncher().sendEmail(recipient: Contact.emailId);
                },
              ),
              SizedBox(height: 20),
              IconButtonLabel(
                icon: Icons.location_city,
                label: Contact.location,
              ),
              SizedBox(height: 40),
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
              SizedBox(height: 40),
            ],
          ),
          ContactForm(),
        ],
      ),
    );
  }
}
