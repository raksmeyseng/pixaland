import 'package:flutter/material.dart';
import 'package:pixaland/config/routes/application.dart';
import 'package:pixaland/utils/helper/dialog_helper.dart';
import 'package:pixaland/widgets/flat_card.dart';

class LoadingHelper {
  // static bool _loadingDialogShowed = false;
  static int _loadingCount = 0;

  static void show() {
    final context = Application.context;
    if (context == null || _loadingCount > 0) {
      return;
    }
    _loadingCount += 1;
    DialogHelper.showAnimatedDialog(
      animationType: DialogAnimationType.none,
      barrierDismissible: false,
      pageBuilder: (context, a1, a2) {
        return const Center(
          child: FlatCard(
            borderRadius: 16.0,
            child: CircularProgressIndicator(),
          ),
        );
      },
    ).then((value) => _loadingCount -= 1);
  }

  static Future<void> close() async {
    if (_loadingCount == 0) {
      return;
    }
    if (Application.context == null) {
      return;
    }
    Navigator.of(Application.context!).pop();
    await Future.delayed(const Duration(milliseconds: 300));
    close();
  }
}
