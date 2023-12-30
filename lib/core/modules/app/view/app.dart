import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pixaland/config/routes/app_route.dart';
import 'package:pixaland/config/routes/application.dart';
import 'package:pixaland/constants/app_constant.dart';
import 'package:pixaland/core/enum/app_health_enum.dart';
import 'package:pixaland/core/enum/language_enum.dart';
import 'package:pixaland/core/modules/app/bloc/app_bloc.dart';
import 'package:pixaland/translation/generated/l10n.dart';
import 'package:pixaland/utils/common_utils.dart';

class PixaLandApp extends StatefulWidget {
  const PixaLandApp({Key? key}) : super(key: key);

  @override
  State<PixaLandApp> createState() => _PixaLandAppState();
}

class _PixaLandAppState extends State<PixaLandApp> {
  @override
  void initState() {
    super.initState();
    listenAndHandleSystemAppearanceChanged();
    // startUserInteractionListener();
    // NetworkHelper.subscribe();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => Application.appBloc..add(const AppStarted()),
        ),
      ],
      child: const SolarRoofTopView(),
    );
  }

  @override
  void dispose() {
    // NetworkHelper.unsubscribe();
    super.dispose();
  }
}

class SolarRoofTopView extends StatelessWidget {
  const SolarRoofTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AppBloc, AppState>(
          listenWhen: (previous, current) => previous.health != current.health,
          listener: (context, state) {
            if (state.health == AppHealthEnum.underMaintenance) {
              Application.router.goNamed(AppRoute.underMaintenance);
            }
          },
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) {
          return previous.language != current.language ||
              previous.theme.themeData != current.theme.themeData;
        },
        builder: (context, state) {
          return MaterialApp.router(
            title: AppConstant.appName,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              DefaultCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: state.theme.themeData,
            supportedLocales: S.delegate.supportedLocales,
            locale: state.language.getLocale(),
            routerConfig: Application.router,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1),),
                child: child!,
              );
            },
          );
        },
      ),
    );
  }
}
