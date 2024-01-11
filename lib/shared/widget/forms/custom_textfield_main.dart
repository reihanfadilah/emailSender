import 'package:flutter/material.dart';

class CustomTextFieldMain extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? errorText;
  final bool? isError;
  final TextInputType? keyboardType;

  const CustomTextFieldMain({
    super.key,
    required this.label,
    required this.controller,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.isError = false,
    this.keyboardType,
  });

  @override
  State<CustomTextFieldMain> createState() => _CustomTextFieldMainState();
}

class _CustomTextFieldMainState extends State<CustomTextFieldMain> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      margin: const EdgeInsets.only(top: 16),
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.obscureText ? _obscureText : false,
        onChanged: widget.onChanged,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          label: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.blueGrey,
            ),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.blueGrey,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          errorText: widget.isError ?? false ? null : widget.errorText,
        ),
      ),
    );
  }
}
