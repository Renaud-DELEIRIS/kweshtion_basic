import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TextinputWidget extends StatefulWidget {
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
  final double? radius;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsetsGeometry? padding;
  TextinputWidget({
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
    this.radius = 12,
    this.contentPadding,
    this.padding,
  }) : super(key: key);

  late bool _textVisible = obscureText ?? false;

  @override
  State<TextinputWidget> createState() => _TextinputWidgetState();
}

class _TextinputWidgetState extends State<TextinputWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding != null
          ? widget.padding!
          : const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.required)
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
            name: widget.name,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            validator: widget.validator,
            autovalidateMode: widget.autovalidateMode,
            autofocus: widget.autofocus ?? false,
            obscureText: widget._textVisible,
            // Change the color of the
            cursorColor: Theme.of(context).colorScheme.onPrimary,
            decoration: InputDecoration(
                contentPadding: widget.contentPadding,
                hintText: widget.hint,
                helperText: widget.helperText,
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.primary.withOpacity(0.3),
                errorStyle: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(widget.radius!)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(widget.radius!),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                suffixIcon: widget.obscureText ?? false
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
                    : null),
          ),
        ],
      ),
    );
  }
}
