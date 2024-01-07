import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextinputWidget extends StatelessWidget {
  final bool required;
  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? maxLength;
  final bool? autofocus;
  final String? helperText;
  final TextInputAction? textInputAction;
  final String name;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final bool? obscureText;
  const TextinputWidget({
    Key? key,
    required this.required,
    required this.label,
    this.autofocus,
    this.hint,
    this.helperText,
    this.keyboardType,
    this.maxLines,
    this.maxLength,
    required this.name,
    this.textInputAction,
    this.validator,
    this.autovalidateMode,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (required)
                Text(
                  ' *',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          FormBuilderTextField(
            name: name,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            maxLines: maxLines,
            maxLength: maxLength,
            validator: validator,
            autovalidateMode: autovalidateMode,
            autofocus: autofocus ?? false,
            obscureText: obscureText ?? false,
            // Change the color of the
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
              hintText: hint,
              helperText: helperText,
              filled: true,
              fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.3),
              errorStyle: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
        ],
      ),
    );
  }
}
