import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/strings.dart';
import 'package:ammu_portfolio/resources/contact.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/widgets/common/base_layout.dart';
import 'package:ammu_portfolio/widgets/contact/contact_details.dart';

///[ContactPage] is a screen that displays contact information and a brief description.
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BaseLayout(
      currentIndex: 2,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          constraints: BoxConstraints(
            minWidth: double.infinity,
            minHeight: screenSize.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.contactLabel,
                style: Theme.of(context).textTheme.headlineMedium600?.copyWith(
                  color: AppColors.blackRock,
                ),
              ),
              SizedBox(height: 20),
              Text(
                Contact.contactHelper,
                style: Theme.of(
                  context,
                ).textTheme.labelLarge600?.copyWith(color: AppColors.blackRock),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:
                      screenSize.width > 850 ? screenSize.width * 0.1 : 20,
                ),
                child: ContactDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
