part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState._({
    this.theme = const AutoTheme(AppThemeOptions()),
    this.language = AppConstant.defaultLang,
    this.status = BaseStatusEnum.initial,
    this.themeOptions = const AppThemeOptions(
      primaryColorHex: AppColor.primaryHex,
      fontFamily: AppConstant.defaultFont,
    ),
    this.isLoading = false,
    this.health = AppHealthEnum.healthy,
    this.internetStatus = InternetStatusEnum.online,
    this.showInternetStatus = false,
  });

  final AppTheme theme;
  final LanguageEnum language;
  final BaseStatusEnum status;
  final AppThemeOptions themeOptions;
  final bool isLoading;
  final AppHealthEnum health;
  final InternetStatusEnum internetStatus;
  final bool showInternetStatus;

  const AppState.initial() : this._();
  const AppState.appearanceLoaded() : this._();

  AppState copyWith({
    AppTheme? theme,
    LanguageEnum? language,
    BaseStatusEnum? status,
    AppThemeOptions? themeOptions,
    bool? isLoading,
    AppHealthEnum? health,
    InternetStatusEnum? internetStatus,
    bool? showInternetStatus,
  }) {
    return AppState._(
      theme: theme ?? this.theme,
      language: language ?? this.language,
      status: status ?? this.status,
      themeOptions: themeOptions ?? this.themeOptions,
      isLoading: isLoading ?? this.isLoading,
      health: health ?? this.health,
      internetStatus: internetStatus ?? this.internetStatus,
      showInternetStatus: showInternetStatus ?? this.showInternetStatus,
    );
  }

  // we use this to help state identify whether the themeData has changed
  ThemeData get _themeData {
    return theme.themeData;
  }

  @override
  List<Object?> get props => [
        theme,
        _themeData,
        language,
        status,
        themeOptions,
        isLoading,
        health,
        internetStatus,
        showInternetStatus,
      ];
}
