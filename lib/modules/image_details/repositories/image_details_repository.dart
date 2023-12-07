import 'package:pixaland/constants/api_path.dart';
import 'package:pixaland/core/modules/homefeed/models/image_model.dart';
import 'package:pixaland/core/services/rest_api_service.dart';

class ImageDetailsRepository extends RestApiService {
  Future<ImageModel> getImageDetails(int id) async {
    final res = await get(ApiPath.getImageDetails(id));
    return ImageModel.fromJson(res);
  }

  Future<List<ImageModel>> getRelatedList() async {
    final res = await get(ApiPath.getRelatedImageList);
    return res.map<ImageModel>((x) => ImageModel.fromJson(x)).toList();
  }
}
