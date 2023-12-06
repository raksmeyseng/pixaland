import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  const HeaderIcon({
    Key? key,
    required this.imagePath,
    this.color,
    this.size = 50,
  }) : super(key: key);

  final String imagePath;
  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        color: (color ?? Theme.of(context).primaryColor).withOpacity(.1),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SizedBox(
            height: size,
            width: size,
            child: Image.asset(
              imagePath,
              color: color ?? Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
