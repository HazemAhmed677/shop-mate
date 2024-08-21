import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/email_and_password_part.dart';

import 'word_of_textfield.dart';

class NameAndEmailPart extends StatelessWidget {
  const NameAndEmailPart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WordOfTextfield(text: 'Name'),
        SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          hint: 'Hazem Ahmed',
        ),
        SizedBox(
          height: 22,
        ),
        EmailAndPasswordPart(),
      ],
    );
  }
}
