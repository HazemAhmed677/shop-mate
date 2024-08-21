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
        const CustomTextFormField(
          hint: 'example@gmail.com',
        ),
        const SizedBox(
          height: 22,
        ),
        const WordOfTextfield(text: 'Password'),
        const SizedBox(
          height: 8,
        ),
        CustomTextFormField(
          hint: '**********',
          suffixIcon: IconButton(
            onPressed: () {
              flag = !flag;
              setState(() {});
            },
            icon: (!flag)
                ? const Icon(Icons.visibility_off)
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
