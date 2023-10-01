import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/ui/constants/app_constants.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";
  String nickname = "";
  String password = "";
  String repeatPassword = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        AssetImage("assets/image/default_avatar.jpg"),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) => nickname = value,
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
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(
                    hintText: S.of(context).enterEmail,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).pleaseEnterEmail;
                    }
                    if (!RegExp(AppConstants.emailValidation).hasMatch(value)) {
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
                const SizedBox(height: 15),
                TextFormField(
                  onChanged: (value) => repeatPassword = value,
                  decoration: InputDecoration(
                    hintText: S.of(context).repeatPassword,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return S.of(context).pleaseEnterPassword;
                    }
                    if (password != repeatPassword) {
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text(S.of(context).register),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
