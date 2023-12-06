import 'package:flutter/material.dart';
import 'package:pixaland/translation/generated/l10n.dart';
import 'package:pixaland/widgets/text_widget.dart';
import 'package:pixaland/widgets/wrapper.dart';

class AppStartedFailedView extends StatelessWidget {
  const AppStartedFailedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: SafeArea(
              top: false,
              bottom: false,
              child: Wrapper(
                maxWidth: 450,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 16.0),
                      TextWidget(
                        S.of(context).title_error,
                        bold: true,
                        size: 18,
                      ),
                      const SizedBox(height: 30.0),
                      SizedBox(
                        width: double.infinity,
                        child: TextWidget(
                          S.of(context).app_load_config_failed,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
