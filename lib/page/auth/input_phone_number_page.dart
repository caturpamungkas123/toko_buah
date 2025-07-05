import 'package:flutter/material.dart';

class InputPhoneNumberPage extends StatefulWidget {
  const InputPhoneNumberPage({super.key});

  @override
  State<InputPhoneNumberPage> createState() => _InputPhoneNumberPageState();
}

class _InputPhoneNumberPageState extends State<InputPhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [Text("Enter your phone number")]),
    );
  }
}
