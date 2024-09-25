import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/email_and_password_part.dart';

import 'word_of_textfield.dart';

class NameAndEmailPart extends StatelessWidget {
  const NameAndEmailPart(
      {super.key,
      required this.onChanged1,
      required this.onChanged2,
      required this.onChanged3});
  final void Function(String) onChanged1;
  final void Function(String) onChanged2;
  final void Function(String) onChanged3;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WordOfTextfield(text: 'Name'),
        const SizedBox(
          height: 6,
        ),
        CustomTextFormField(
          hint: 'Hazem Ahmed',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your name';
            } else {
              return null;
            }
          },
          onChanged: onChanged1,
        ),
        const SizedBox(
          height: 14,
        ),
        EmailAndPasswordPart(
          onChanged1: onChanged2,
          onChanged2: onChanged3,
        ),
      ],
    );
  }
}
