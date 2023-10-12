import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_clone/features/auth/cubit/auth_cubit.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/ui/constants/app_constants.dart';
import 'package:tiktok_clone/ui/utils/dialog_utils.dart';
import 'package:tiktok_clone/ui/utils/show_tiktok_snackbar.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthCubit cubit = BlocProvider.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              loaded: (userModel) {
                AutoRouter.of(context).pop(userModel);
              },
              loading: (isLoading) async => isLoading
                  ? await showLoaderDialog(context)
                  : AutoRouter.of(context).pop(),
              loadingFailure: (error) =>
                  showTikTokSnackBar(context, text: error.toString()),
              orElse: () => showLoaderDialog(context),
            );
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) => email = value,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterEmail,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).pleaseEnterEmail;
                        }
                        if (!RegExp(AppConstants.emailValidation)
                            .hasMatch(value)) {
                          return S.of(context).uncorrectEmail;
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterPassword,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).pleaseEnterPassword;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await cubit.loginToAccount(email, password);
                            }
                          },
                          child: Text(S.of(context).login),
                        )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
