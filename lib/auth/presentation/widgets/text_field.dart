import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Custom_Field extends StatelessWidget{
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool is_obscure;
  final Function(String?) onchange;
  final Function()? on_tap_suffix;
  final MaskTextInputFormatter? formatter;

  const Custom_Field({required this.label, required this.hint, required this.controller, required this.onchange, this.is_obscure = false, this.on_tap_suffix, this.formatter});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: Theme.of(context).textTheme.titleMedium,),
        const SizedBox(height: 8,),
        TextField(
          onChanged: onchange,
          inputFormatters: (formatter != null) ? [formatter!] : [],
          obscureText: is_obscure,
          obscuringCharacter: "*",
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: BorderSide(
                  width: 4,
                  style: BorderStyle.none,
                  color: Color.fromARGB(255, 167, 167, 167)
              ),
            ),
            hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: 'Roboto'),
            suffixIcon: (on_tap_suffix != null)
                ? GestureDetector(
              onTap: on_tap_suffix,
              child: Image.asset("assets/eye-slash.png"),
            )
                : null,
          ),
        )
      ],
    );
  }
}