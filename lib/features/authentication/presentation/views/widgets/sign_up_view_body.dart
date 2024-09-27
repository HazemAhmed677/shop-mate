import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_mate/core/manager/switch_views_cubit/switch_views_cubit.dart';
import 'package:shop_mate/core/widgets/custom_loading_bar.dart';
import 'package:shop_mate/features/authentication/presentation/manager/sign_up_with_email_cubit/sign_up_with_email_cubit.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/custom_photo_stack.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/name_and_email_part.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_up_bottom_bar.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_up_top_section.dart';
import 'package:shop_mate/features/authentication/presentation/views/widgets/sign_word.dart';
import 'package:shop_mate/features/onboarding/presentation/views/widgets/already_have_an_account.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/custom_action_button.dart';
import '../../../../../core/widgets/show_snack_bar.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String email = '', password = '', name = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26.0,
          ),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Form(
                  autovalidateMode: autovalidateMode,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SignUpTopSection(),
                      CustomPhotoStack(email: email),
                      const SizedBox(
                        height: 22,
                      ),
                      NameAndEmailPart(
                        onChanged1: (value) {
                          name = value;
                        },
                        onChanged2: (value) {
                          email = value;
                        },
                        onChanged3: (value) {
                          password = value;
                        },
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      BlocConsumer<SignUpWithEmailCubit, SignUpWithEmailState>(
                        listener: (context, state) {
                          if (state is SignUpWithEmailSuccess) {
                            BlocProvider.of<SwitchViewsCubit>(context)
                                .setIndex(0);
                            context.go(AppRouters.home);
                            showSnackBar(
                                context: context,
                                e: 'Signed up successfully',
                                flag: true);
                          } else if (state is SignUpWithEmailFaliure) {
                            showSnackBar(
                              context: context,
                              e: state.errorMsg,
                            );
                          }
                        },
                        builder: (context, state) {
                          if (state is SignUpWithEmailLoading) {
                            return const CustomLoadingBar();
                          }
                          return CustomActionButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                autovalidateMode = AutovalidateMode.disabled;
                                BlocProvider.of<SwitchViewsCubit>(context)
                                    .setIndex(1);
                                BlocProvider.of<SignUpWithEmailCubit>(context)
                                    .userRegister(
                                        email: email,
                                        password: password,
                                        name: name);
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                              }
                              setState(() {});
                            },
                            text: 'Sign Up',
                          );
                        },
                      ),
                      const Expanded(
                        child: SignUpBottomSection(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
