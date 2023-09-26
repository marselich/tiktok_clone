import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/generated/l10n.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).auth),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: S.of(context).enterEmail,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return S.of(context).pleaseEnterEmail;
                }
                String p =
                    "[a-zA-Z0-9+._%-+]{1,256}@[a-zA-Z0-9][a-zA-Z0-9-]{0,64}(.[a-zA-Z0-9][a-zA-Z0-9-]{0,25})+";
                RegExp regExp = RegExp(p);

                if (!regExp.hasMatch(value))
                  return S.of(context).uncorrectEmail;
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
