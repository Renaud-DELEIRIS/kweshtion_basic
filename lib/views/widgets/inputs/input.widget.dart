import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class InputWidget extends StatefulWidget {
  InputWidget({
    super.key,
    required this.name,
    required this.labelText,
    required this.errorText,
    this.secure = false,
    this.multiline = false,
  });
  final String name;
  final String labelText;
  final String errorText;
  final bool secure;
  final bool multiline;
  late bool _textVisible = secure;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: widget.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
      keyboardType:
          widget.multiline ? TextInputType.multiline : TextInputType.text,
      maxLines: widget.multiline ? 3 : 1,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        hintText: widget.labelText,
        suffixIcon: widget.secure
            ? IconButton(
                onPressed: () {
                  setState(() {
                    widget._textVisible = !widget._textVisible;
                  });
                },
                icon: Icon(widget._textVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
              )
            : null,
      ),
      obscureText: widget._textVisible,
    );
  }
}
