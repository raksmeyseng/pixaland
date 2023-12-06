class ApiPath {
  // Security Api
  static const String register = '/v1/Security/Register';
  static const String refreshToken = '/v1/Security/RefreshToken';

  // Media Api
  static const String uploadFile = '/api/Media/File';
  static const String uploadMulitpleFiles = '/api/Media/Files';
  static String getFile(String id) => '/api/Media/$id';
  static const String getMultiFiles = '/api/Media/GetMultipleMedias';

  // Core API

  static const String getAllImages = 'https://picsum.photos/v2/list';
}
