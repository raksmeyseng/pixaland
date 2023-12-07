import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pixaland/config/routes/application.dart';
import 'package:pixaland/config/themes/app_color.dart';
import 'package:pixaland/core/enum/internet_status_enum.dart';
import 'package:pixaland/core/enum/language_enum.dart';
import 'package:pixaland/translation/generated/l10n.dart';
import 'package:pixaland/utils/common_utils.dart';
import 'package:pixaland/utils/helper/dialog_helper.dart';
import 'package:pixaland/utils/helper/loading_helper.dart';
import 'package:pixaland/utils/helper/network_helper.dart';
import 'package:pixaland/widgets/dialogs/error_message_dialog.dart';

class RestApiService {
  static bool _errorDialogShowed = false;
  final Dio _dio = Dio();

  RestApiService() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final online = await NetworkHelper.isNetworkConnected();
          if (online) {
            ScaffoldMessenger.of(Application.context!).hideCurrentSnackBar();
          }
          if (!online && options.extra['showOfflineDialog'] != false) {
            final error = DioError(
              requestOptions: options,
              type: DioErrorType.other,
              error: InternetStatusEnum.offline,
            );
            return handler.reject(error, true);
          }
          final appBloc = Application.appBloc;
          options.baseUrl = _normalizeBaseUrl(_baseUrl);
          options.path = _normalizePath(options.path);
          options.headers['Lang'] =
              appBloc.state.language.getLocale().languageCode;
          return handler.next(options);
        },
        onError: (DioError e, handler) async {
          // Clear loading
          await LoadingHelper.close();
          // Handle error message
          if (e.response?.statusCode == HttpStatus.unauthorized) {
            _unauthorizedHandler();
          } else if (e.response?.statusCode == HttpStatus.badRequest) {
            _badrequestHandler(e.response!.data);
          } else if (e.response?.statusCode == HttpStatus.noContent) {
            return handler.resolve(
              Response(
                requestOptions: e.requestOptions,
                data: '',
              ),
            );
          } else if (e.error == InternetStatusEnum.offline) {
            if (!_errorDialogShowed) {
              showSnackBar(
                Application.context!,
                S.of(Application.context!).msg_check_your_internet_connection,
                color: AppColor.success,
                permanant: true,
                icon: Icons.wifi_off_outlined,
              );
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  String _normalizeBaseUrl(String url) => url.endsWith('/') ? url : '$url/';
  String _normalizePath(String path) =>
      path.startsWith('/') ? path.substring(1) : path;

  String get _baseUrl => '';

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    bool fullResponse = false,
  }) async {
    final response = await _dio.get(
      path,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return fullResponse ? response : response.data;
  }

  Future<dynamic> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    bool fullResponse = false,
  }) async {
    final response = await _dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return fullResponse ? response : response.data;
  }

  Future<dynamic> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    bool fullResponse = false,
  }) async {
    final response = await _dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return fullResponse ? response : response.data;
  }

  Future<dynamic> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    bool fullResponse = false,
  }) async {
    final response = await _dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return fullResponse ? response : response.data;
  }

  Future<dynamic> download(String path, {required String savePath}) async {
    final response = await _dio.download(path, savePath);
    return response.data;
  }

  Future<void> _unauthorizedHandler() async {
    if (_errorDialogShowed) return;
    _errorDialogShowed = true;
    await DialogHelper.showAnimatedDialog(
      pageBuilder: (context, _, __) {
        return ErrorMessageDialog(
          title: S.of(context).session_expired,
          message: S.of(context).error_unauthorized,
        );
      },
    );
    _errorDialogShowed = false;
  }

  void _badrequestHandler(dynamic data) {
    if (data is Map<String, dynamic> && data['Error']?.isNotEmpty == true) {
      if (data['Error']?.toLowerCase().contains('invalid_grant')) {
        _unauthorizedHandler();
      } else if (data['Code']?.isNotEmpty == true) {
        if (!_errorDialogShowed) {
          _errorDialogShowed = true;
          DialogHelper.showAnimatedDialog(
            pageBuilder: (context, _, __) {
              return ErrorMessageDialog(
                message: data['Error'],
              );
            },
          ).then((value) => _errorDialogShowed = false);
        }
      }
    }
  }
}
