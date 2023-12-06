import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/constants/app_constant.dart';
import 'package:pixaland/core/modules/app/view/app.dart';
import 'package:pixaland/core/services/local_storage_service.dart';
import 'package:pixaland/simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  final wiped =
      await LocalStorageService.instance.getString(AppConstant.dataWipeKey);
  if (wiped != AppConstant.wipeKey) {
    await LocalStorageService.instance.clearAll();
    await LocalStorageService.instance
        .saveString(AppConstant.dataWipeKey, AppConstant.wipeKey);
  }

  Bloc.observer = SimpleBlocObserver();
  runApp(const PixaLandApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
