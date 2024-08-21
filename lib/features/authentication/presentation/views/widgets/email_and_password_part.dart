import 'package:flutter/material.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_text_form_field.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/word_of_textfield.dart';

import '../../../../../core/utils/app_colors.dart';

class EmailAndPasswordPart extends StatefulWidget {
  const EmailAndPasswordPart({super.key});

  @override
  State<EmailAndPasswordPart> createState() => _EmailAndPasswordPartState();
}

class _EmailAndPasswordPartState extends State<EmailAndPasswordPart> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WordOfTextfield(text: 'Email'),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          hint: 'example@gmail.com',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email';
            } else if (!value.contains('@')) {
              return 'Please enter a valid email';
            } else {
              return null;
            }
          },
        ),
        const SizedBox(
          height: 14,
        ),
        const WordOfTextfield(text: 'Password'),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (value.length < 6) {
              return 'Password must be at least 6 characters';
            } else {
              return null;
            }
          },
          hint: '**********',
          suffixIcon: IconButton(
            onPressed: () {
              flag = !flag;
              setState(() {});
            },
            icon: (!flag)
                ? Icon(
                    Icons.visibility_off,
                    color: Colors.grey.shade800,
                  )
                : const Icon(
                    Icons.visibility,
                    color: AppColors.primaryColor,
                  ),
          ),
          obscure: !flag,
        ),
      ],
    );
  }
}
