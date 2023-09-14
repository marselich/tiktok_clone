import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AddingVideoScreen extends StatelessWidget {
  const AddingVideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("hello", style: TextStyle(color: Colors.black))),
    );
  }
}
