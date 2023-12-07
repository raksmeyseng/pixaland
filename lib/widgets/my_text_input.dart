import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pixaland/config/themes/app_color.dart';

class MyTextInput extends StatefulWidget {
  const MyTextInput({
    Key? key,
    this.label,
    this.onChanged,
    this.errorText,
    this.onSubmitted,
    this.inputFormatters,
    this.keyboardType,
    this.prefixIcon,
    this.prefixText,
    this.suffixIcon,
    this.suffixText,
    this.isRequired = false,
    this.obscureText = false,
    this.autofocus = false,
    this.readOnly = false,
    this.enabled = true,
    this.focusNode,
    this.initialValue,
    this.onTap,
    this.controller,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.hintText,
    this.fillColor,
    this.textAlign = TextAlign.start,
    this.textSize,
    this.maxLines = 1,
    this.maxLength,
    this.xLabel,
    this.validator,
    this.onUpload,
    this.isLoading = false,
    this.filled = false,
  }) : super(key: key);

  final String? label;
  final void Function(String value)? onChanged;
  final String? errorText;
  final void Function(String value)? onSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final String? prefixText;
  final Widget? suffixIcon;
  final String? suffixText;
  final bool isRequired;
  final bool obscureText;
  final bool autofocus;
  final bool readOnly;
  final bool enabled;
  final FocusNode? focusNode;
  final String? initialValue;
  final void Function()? onTap;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final String? hintText;
  final Color? fillColor;
  final TextAlign textAlign;
  final double? textSize;
  final int? maxLines;
  final int? maxLength;
  final String? xLabel;
  final String? Function(String text)? validator;
  final void Function()? onUpload;
  final bool isLoading;
  final bool filled;

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40.0),
      borderSide: BorderSide(
        width: 1,
        color: Theme.of(context).dividerColor.withOpacity(0.3),
      ),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.xLabel != null)
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: widget.xLabel,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              if (widget.isRequired)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(color: AppColor.danger),
                ),
            ]),
          ),
        const SizedBox(height: 4),
        TextFormField(
          validator: (value) {
            if (widget.isRequired && value!.isEmpty) {
              return (widget.label ?? widget.xLabel ?? '');
            }
            if (widget.validator != null) {
              return widget.validator!(value!);
            }
            return null;
          },
          controller: widget.controller,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          autofocus: widget.autofocus,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          focusNode: widget.focusNode,
          style: widget.enabled
              ? _enabledTextStyle(context)
              : _disabledTextStyle(context),
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          textAlign: widget.textAlign,
          decoration: InputDecoration(
            counterText: '',
            hintText: widget.hintText,
            hintStyle: _disabledTextStyle(context),
            labelText: widget.label != null
                ? widget.label! + (widget.isRequired ? ' *' : '')
                : null,
            prefixStyle: widget.enabled
                ? _enabledTextStyle(context)
                : _disabledTextStyle(context),
            fillColor: widget.filled
                ? Theme.of(context).dividerColor.withOpacity(.1)
                : null,
            filled: widget.filled,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 16.0,
            ),
            prefixIcon: widget.prefixIcon,
            prefixText: widget.prefixText,
            suffixIcon: _suffixIcon(),
            suffixText: widget.suffixText,
            errorText: widget.errorText,
          ),
          onFieldSubmitted: widget.onSubmitted,
          inputFormatters: widget.inputFormatters,
        ),
      ],
    );
  }

  Widget? _suffixIcon() {
    if (widget.isLoading) {
      return const SizedBox(
        width: 8,
        height: 8,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: CircularProgressIndicator(
              strokeCap: StrokeCap.round,
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    if (widget.onUpload != null) {
      if (widget.controller != null &&
          widget.controller?.text.isNotEmpty == true) {
        return IconButton(
          onPressed: () {
            widget.controller!.clear();
            setState(() {});
          },
          icon: const Icon(Icons.delete_rounded, color: AppColor.danger),
        );
      }

      return IconButton(
        onPressed: widget.onUpload,
        icon: const Icon(Icons.file_open_rounded),
      );
    }

    if (widget.suffixIcon != null) {
      return ClipOval(
        child: Material(
          color: Colors.transparent,
          child: widget.suffixIcon,
        ),
      );
    }
    return null;
  }

  TextStyle _enabledTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: widget.textSize,
        );
  }

  TextStyle _disabledTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.normal,
          color: Theme.of(context).disabledColor,
          fontSize: widget.textSize,
        );
  }
}
