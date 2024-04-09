import 'package:flutter/material.dart';

class FormTx extends StatefulWidget {
  const FormTx({super.key});

  @override
  State<FormTx> createState() => _FormTxState();
}

class _FormTxState extends State<FormTx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 80),
          TextFormField(),
        ],
      ),
    );
  }
}
