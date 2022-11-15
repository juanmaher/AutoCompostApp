import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputFiled extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final TextInputType? inputType;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomInputFiled({
    Key? key,
    this.onChanged,
    required this.label,
    this.inputType,
    this.isPassword = false,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomInputFiled> createState() => _CustomInputFiledState();
}

class _CustomInputFiledState extends State<CustomInputFiled> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.always,
        builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: _obscureText,
              keyboardType: widget.inputType,
              onChanged: (text) {
                if(widget.validator != null) {
                  state.validate();
                  state.setValue(text);
                }
                if(widget.onChanged != null) {
                  widget.onChanged!(text);
                }
              },
              decoration: InputDecoration(
                labelText: widget.label,
                border: const OutlineInputBorder(),
                suffixIcon: widget.isPassword? CupertinoButton(
                  child: Icon(
                      _obscureText ? Icons.visibility: Icons.visibility_off
                  ),
                  onPressed: () {
                    _obscureText = !_obscureText;
                    setState(() {});
                  },
                ): Container(
                  width: 0,
                ),
              ),
            ),
            if(state.hasError)
              Text(
                state.errorText!,
                style: const TextStyle(color: Colors.redAccent),
              )
          ],
        );
      },
    );
  }
}
