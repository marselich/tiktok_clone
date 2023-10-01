import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/ui/constants/app_constants.dart';

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
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                const SizedBox(height: 20),
                SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {}
                      },
                      child: Text(S.of(context).login),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
