import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/config/themes/app_theme.dart';
import 'package:pixaland/core/modules/app/bloc/app_bloc.dart';
import 'package:pixaland/core/modules/app/widgets/auto_theme_item.dart';
import 'package:pixaland/core/modules/app/widgets/theme_item.dart';
import 'package:pixaland/translation/generated/l10n.dart';
import 'package:pixaland/widgets/app_bar_title.dart';
import 'package:pixaland/widgets/wrapper.dart';

class AppearancePage extends StatelessWidget {
  const AppearancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: S.of(context).appearance),
      ),
      body: const _Content(),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12.0),
          _ThemeMode(),
        ],
      ),
    );
  }
}

class _ThemeMode extends StatelessWidget {
  const _ThemeMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.theme != current.theme,
      builder: (context, state) {
        return Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(),
          child: SafeArea(
            bottom: false,
            child: Wrapper(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AutoThemeItem(
                          title: S.of(context).system,
                          foregroundColor: AppColor.textLight,
                          backgroundColor: AppColor.cardDark,
                          value: AutoTheme.key,
                          groupValue: state.theme.getKey(),
                          onChanged: (v) => _onThemeChanged(context, v),
                        ),
                        ThemeItem(
                          title: S.of(context).light,
                          foregroundColor: AppColor.textLight,
                          backgroundColor: AppColor.card,
                          value: LightTheme.key,
                          groupValue: state.theme.getKey(),
                          onChanged: (v) => _onThemeChanged(context, v),
                        ),
                        ThemeItem(
                          title: S.of(context).dark,
                          foregroundColor: AppColor.white,
                          backgroundColor: AppColor.cardDark,
                          value: DarkTheme.key,
                          groupValue: state.theme.getKey(),
                          onChanged: (v) => _onThemeChanged(context, v),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _onThemeChanged(BuildContext context, String? key) {
    final options = context.read<AppBloc>().state.themeOptions;
    final theme = AppThemeFactory.buildTheme(key, themeOptions: options);
    context.read<AppBloc>().add(ThemeChanged(theme: theme));
  }
}
