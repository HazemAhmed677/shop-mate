import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/dont_have_account.dart';

import '../../../../../core/utils/app_routers.dart';

class SignInBottomSection extends StatelessWidget {
  const SignInBottomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          flex: 1,
          child: SizedBox(
            height: 32,
          ),
        ),
        DontHaveAccount(
          onTap: () {
            GoRouter.of(context).go(
              AppRouters.signUp,
            );
          },
        ),
        const Expanded(
          flex: 3,
          child: SizedBox(),
        ),
      ],
    );
  }
}
