import 'package:flutter/material.dart';
import 'package:pixaland/config/routes/route_config.dart';
import 'package:pixaland/core/modules/app/bloc/app_bloc.dart';
import 'package:pixaland/core/modules/app/repositories/app_repository.dart';

class Application {
  static final appRepo = AppRepository();

  static final appBloc = AppBloc(appRepo: appRepo);

  static final router = RouteConfig.configureRouter();

  static BuildContext? get context {
    return router.routerDelegate.navigatorKey.currentContext;
  }
}
