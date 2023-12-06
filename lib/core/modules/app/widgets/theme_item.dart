import 'package:flutter/material.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/widgets/text_widget.dart';

class ThemeItem extends StatefulWidget {
  const ThemeItem({
    Key? key,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  final Color backgroundColor;
  final Color foregroundColor;
  final String value;
  final String groupValue;
  final void Function(String?) onChanged;
  final String title;

  @override
  ThemeItemState createState() => ThemeItemState();
}

class ThemeItemState extends State<ThemeItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 16.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => widget.onChanged(widget.value),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 165,
                  height: 120,
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey.withOpacity(.3)),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Container(
                            color: AppColor.danger,
                            width: 8,
                            height: 8,
                          ),
                        ),
                        const SizedBox(width: 4),
                        ClipOval(
                          child: Container(
                            color: AppColor.divider,
                            width: 8,
                            height: 8,
                          ),
                        ),
                        const SizedBox(width: 4),
                        ClipOval(
                          child: Container(
                            color: AppColor.active,
                            width: 8,
                            height: 8,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 24,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            color: widget.foregroundColor,
                            width: 140,
                            height: 6,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            color: widget.foregroundColor,
                            width: 100,
                            height: 6,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            color: widget.foregroundColor,
                            width: 50,
                            height: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2,
                  child: Radio(
                    value: widget.value,
                    groupValue: widget.groupValue,
                    onChanged: widget.onChanged,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          TextWidget(widget.title),
        ],
      ),
    );
  }
}
