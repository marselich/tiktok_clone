import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_clone/core/app_constants.dart';
import 'package:tiktok_clone/core/utils/dialog_utils.dart';
import 'package:tiktok_clone/core/utils/shared_preferences_utils.dart';
import 'package:tiktok_clone/core/utils/show_tiktok_snackbar.dart';
import 'package:tiktok_clone/features/auth/cubit/auth_cubit.dart';
import 'package:tiktok_clone/repository/auth/i_auth_repository.dart';

import 'package:tiktok_clone/generated/l10n.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _cubit = AuthCubit(GetIt.I.get<IAuthRepository>());

  File? _image;
  String _email = "";
  String _nickname = "";
  String _password = "";
  String _repeatPassword = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (BuildContext context, AuthState state) {
            state.maybeWhen(
              loaded: (userModel) async {
                AutoRouter.of(context).pop(userModel);
                await SharedPreferencesUtils.saveUserId(userModel.id);
              },
              imageLoaded: (image) =>
                  showTikTokSnackBar(context, text: "Image loaded"),
              loading: (isLoading) => isLoading
                  ? showLoaderDialog(context)
                  : AutoRouter.of(context).pop(),
              loadingFailure: (error) =>
                  showTikTokSnackBar(context, text: error.toString()),
              orElse: () {},
            );
          },
          bloc: _cubit,
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await _cubit.chooseImageFromGallery();
                      },
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: state.maybeWhen(
                          imageLoaded: (image) {
                            _image = image;
                            return FileImage(
                              File(image!.path),
                            );
                          },
                          orElse: () => const AssetImage(
                              "assets/image/default_avatar.jpg"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onChanged: (value) => _nickname = value,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterNickname,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).pleaseEnterNickname;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onChanged: (value) => _email = value,
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
                      onChanged: (value) => _password = value,
                      decoration: InputDecoration(
                        hintText: S.of(context).enterPassword,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).pleaseEnterPassword;
                        }
                        if (value.length < 6) {
                          return S
                              .of(context)
                              .passwordMustContain6OrMoreCharacters;
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      onChanged: (value) => _repeatPassword = value,
                      decoration: InputDecoration(
                        hintText: S.of(context).repeatPassword,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).pleaseEnterPassword;
                        }
                        if (_password != _repeatPassword) {
                          return S.of(context).passwordMismatch;
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
                            // _image ??= await getImageFileFromAssets(
                            //     "image/default_avatar.jpg");
                            if (_formKey.currentState!.validate()) {
                              _cubit.createAccount(
                                  _nickname, _email, _password, _image);
                            }
                          },
                          child: Text(S.of(context).register),
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
