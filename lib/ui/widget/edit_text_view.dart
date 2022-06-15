import 'package:flutter/material.dart';

class EditTextView extends StatelessWidget {
  final String label;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;

  const EditTextView({
    Key? key,
    required this.label,
    this.onChanged,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      cursorColor: Colors.white,
      onChanged: (value) {
        if (onChanged != null) onChanged!(value);
      },
      keyboardType: keyboardType,
    );
  }
}
