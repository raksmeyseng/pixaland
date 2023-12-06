import 'package:flutter/material.dart';
import 'package:pixaland/constants/asset_path.dart';
import 'package:pixaland/translation/generated/l10n.dart';
import 'package:pixaland/widgets/header_icon.dart';
import 'package:pixaland/widgets/text_widget.dart';

class LoadDataFailed extends StatelessWidget {
  const LoadDataFailed({Key? key, this.onRetry}) : super(key: key);

  final void Function(BuildContext context)? onRetry;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderIcon(
                imagePath: AssetPath.iconError,
                color: Theme.of(context).dividerColor,
              ),
              const SizedBox(height: 24.0),
              TextWidget(
                S.of(context).load_data_failed,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24.0),
              if (onRetry != null)
                IconButton(
                  onPressed: () => onRetry!(context),
                  color: Theme.of(context).primaryColor,
                  iconSize: 35,
                  icon: const Icon(Icons.refresh_outlined),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
