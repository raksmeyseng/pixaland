class ApiPath {
  // Core API

  static const String getAllImages = 'https://picsum.photos/v2/list';
  static const String getRelatedImageList =
      'https://picsum.photos/v2/list?limit=5';
  static String getImageDetails(int id) => 'https://picsum.photos/id/$id/info';
}
