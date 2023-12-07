import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/config/themes/app_theme.dart';
import 'package:pixaland/constants/app_constant.dart';
import 'package:pixaland/core/enum/app_health_enum.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';
import 'package:pixaland/core/enum/internet_status_enum.dart';
import 'package:pixaland/core/enum/language_enum.dart';
import 'package:pixaland/core/modules/app/models/app_theme_options.dart';
import 'package:pixaland/core/modules/app/repositories/app_repository.dart';
import 'package:pixaland/translation/generated/l10n.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.appRepo}) : super(const AppState.initial()) {
    on<AppEvent>(_onAppEvent, transformer: sequential());
  }

  final AppRepository appRepo;

  Future<void> _onAppEvent(AppEvent event, Emitter<AppState> emit) async {
    if (event is AppStarted) return _onAppStarted(event, emit);
    if (event is ThemeChanged) return _onThemeChanged(event, emit);
    if (event is LanguageChanged) return _onLocaleChanged(event, emit);
    if (event is FontFamilyChanged) return _onFontFamilyChanged(event, emit);
    if (event is PrimaryColorChanged) {
      return _onPrimaryColorChanged(event, emit);
    }
    if (event is InternetStatusChanged) {
      return _onInternetStatusChanged(event, emit);
    }
    if (event is AppHealthChanged) {
      return _onHealthChanged(event, emit);
    }
    if (event is ShowInternetStatusChanged) {
      return _onShowInternetStatusChanged(event, emit);
    }
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      emit(const AppState.initial());

      // ==================
      // Load Theme & Language first
      // ==================
      final theme = await appRepo.getThemeAsync();
      final lang = await appRepo.loadLangAsync();
      final themeOptions = await appRepo.getThemeOptions();
      emit(state.copyWith(
        theme: theme,
        language: lang,
        themeOptions: themeOptions,
      ));
      // Add some delay to wait for auth state finishing updated
      await Future.delayed(const Duration(milliseconds: 500));
      emit(state.copyWith(status: BaseStatusEnum.success));
    } catch (e) {
      // ==================
      // App load failed, update app state accordingly
      // ==================
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }

  Future<void> _onThemeChanged(
    ThemeChanged event,
    Emitter<AppState> emit,
  ) async {
    await appRepo.saveTheme(event.theme.getKey());
    emit(state.copyWith(theme: event.theme));
  }

  Future<void> _onLocaleChanged(
    LanguageChanged event,
    Emitter<AppState> emit,
  ) async {
    final locale = event.language.getLocale();
    await S.load(locale);
    await appRepo.saveLanguageCode(locale.languageCode);
    emit(state.copyWith(language: event.language));
  }

  Future<void> _onFontFamilyChanged(
    FontFamilyChanged event,
    Emitter<AppState> emit,
  ) async {
    final options = state.themeOptions.copyWith(fontFamily: event.fontFamily);
    await _themeOptionsChanged(options, emit);
  }

  Future<void> _onPrimaryColorChanged(
    PrimaryColorChanged event,
    Emitter<AppState> emit,
  ) async {
    final options = state.themeOptions.copyWith(
      primaryColorHex: event.color.value.toRadixString(16),
    );
    await _themeOptionsChanged(options, emit);
  }

  Future<void> _themeOptionsChanged(
    AppThemeOptions options,
    Emitter<AppState> emit,
  ) async {
    final theme = AppThemeFactory.buildTheme(
      state.theme.getKey(),
      themeOptions: options,
    );
    emit(state.copyWith(theme: theme, themeOptions: options));
    await appRepo.saveThemeOptions(options);
  }

  void _onInternetStatusChanged(
    InternetStatusChanged event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(internetStatus: event.status));
    add(ShowInternetStatusChanged(event.status == InternetStatusEnum.offline));
  }

  void _onHealthChanged(AppHealthChanged event, Emitter<AppState> emit) {
    emit(state.copyWith(health: event.health));
  }

  Future<void> _onShowInternetStatusChanged(
    ShowInternetStatusChanged event,
    Emitter<AppState> emit,
  ) async {
    if (event.show) {
      emit(state.copyWith(showInternetStatus: true));
    } else {
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(showInternetStatus: false));
    }
  }
}
