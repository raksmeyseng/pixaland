import 'package:flutter/material.dart';
import 'package:pixaland/widgets/text_widget.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    required this.title,
    this.primary = true,
  }) : super(key: key);

  final String title;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      title,
      bold: true,
      primary: primary,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.left,
    );
  }
}
