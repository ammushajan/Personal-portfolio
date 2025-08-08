import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/contact.dart';
import 'package:ammu_portfolio/widgets/common/text_field.dart';

///[ContactForm] is a widget that displays a form for users to fill out their contact information.
/// It includes fields for name, email, and message, along with a submit button.
class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: screenSize.width > 850 ? screenSize.width * 0.4 : screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.blackRock.withValues(alpha: 0.2),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonTextField(
              label: Contact.nameLabel,
              helperText: Contact.nameHelper,
            ),
            SizedBox(height: 20),
            CommonTextField(
              label: Contact.emailLabel,
              helperText: Contact.emailHelper,
            ),
            SizedBox(height: 20),
            CommonTextField(
              label: Contact.messageLabel,
              helperText: Contact.messageHelper,
              maxLines: 4,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              child: Text(Contact.submitButtonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
