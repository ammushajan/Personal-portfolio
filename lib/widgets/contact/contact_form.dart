import 'package:flutter/material.dart';

import 'package:ammu_portfolio/themes/colors.dart';
import 'package:ammu_portfolio/resources/contact.dart';
import 'package:ammu_portfolio/utils/url_launcher.dart';
import 'package:ammu_portfolio/widgets/common/text_field.dart';

///[ContactForm] is a widget that displays a form for users to fill out their contact information.
/// It includes fields for name, email, and message, along with a submit button.
class ContactForm extends StatelessWidget {
  const ContactForm({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController messageController = TextEditingController();

    //[emailValidator] is a function that validates the email input.
    emailValidator(value) {
      if (value == null || value.isEmpty) {
        return Contact.emailError;
      }
      // Simple email validation
      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
      if (!emailRegex.hasMatch(value)) {
        return Contact.validEmailError;
      }
      return null;
    }

    //[messageValidator] is a function that validates the message input.
    messageValidator(value) {
      if (value == null || value.isEmpty) {
        return Contact.messageError;
      }
      return null;
    }

    //[submitEmail] is a function that validates the form and sends an email if valid.
    submitEmail() {
      if (formKey.currentState?.validate() ?? false) {
        UrlLauncher()
            .sendEmail(
              recipient: emailController.value.text,
              subject: Contact.formSubject,
              body: messageController.value.text,
            )
            .then((value) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(Contact.formSuccessMessage)),
                );
              }
            })
            .catchError((error) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${Contact.formErrorMessage}: $error'),
                  ),
                );
              }
            });
      }
    }

    return Container(
      padding: const EdgeInsets.all(24.0),
      width: screenSize.width > 850 ? screenSize.width * 0.4 : screenSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: AppColors.blackRock.withValues(alpha: 0.2),
      ),
      child: Form(
        key: formKey,
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
              textValidator: emailValidator,
              textController: emailController,
            ),
            SizedBox(height: 20),
            CommonTextField(
              label: Contact.messageLabel,
              helperText: Contact.messageHelper,
              maxLines: 4,
              textValidator: messageValidator,
              textController: messageController,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: submitEmail,
              child: Text(Contact.submitButtonLabel),
            ),
          ],
        ),
      ),
    );
  }
}
