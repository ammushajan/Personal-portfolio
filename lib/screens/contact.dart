import 'package:flutter/material.dart';
import 'package:ammu_portfolio/resources/contact.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/strings.dart';
import 'package:ammu_portfolio/themes/typography.dart';
import 'package:ammu_portfolio/widgets/common/base_layout.dart';
import 'package:ammu_portfolio/widgets/common/icon_button_label.dart';

///[ContactPage] is a screen that displays contact information and a brief description.
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      currentIndex: 2,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        constraints: BoxConstraints(minWidth: double.infinity),
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
              Strings.contactHelper,
              style: Theme.of(
                context,
              ).textTheme.labelLarge600?.copyWith(color: AppColors.blackRock),
            ),
            SizedBox(height: 50),
            IconButtonLabel(icon: Icons.phone, label: Contact.phoneNumber),
            SizedBox(height: 20),
            IconButtonLabel(icon: Icons.email, label: Contact.emailId),
            SizedBox(height: 20),
            IconButtonLabel(icon: Icons.location_city, label: Contact.location),
          ],
        ),
      ),
    );
  }
}
