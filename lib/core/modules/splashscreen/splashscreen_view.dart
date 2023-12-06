import 'package:flutter/material.dart';
import 'package:pixaland/constants/asset_path.dart';
import 'package:pixaland/core/animation/show_up_transition.dart';
import 'package:pixaland/widgets/text_widget.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: ShowUpTransition(
              child: Image.asset(
                AssetPath.logo,
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
        const TextWidget(
          'by Pixaland',
          bold: true,
          primary: true,
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
