import 'package:flutter/material.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/translation/generated/l10n.dart';
import 'package:pixaland/widgets/dialogs/message_dialog.dart';

class SuccessMessageDialog extends StatelessWidget {
  const SuccessMessageDialog({
    Key? key,
    this.title,
    required this.message,
    this.icon,
  }) : super(key: key);

  final String? title;
  final String message;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return MessageDialog(
      title: title ?? S.of(context).success,
      message: message,
      icon: icon ??
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 70,
          ),
      color: AppColor.success,
    );
  }
}
