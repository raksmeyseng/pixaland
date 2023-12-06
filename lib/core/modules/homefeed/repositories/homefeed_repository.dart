import 'package:pixaland/constants/api_path.dart';
import 'package:pixaland/core/modules/homefeed/models/image_model.dart';
import 'package:pixaland/core/services/rest_api_service.dart';

class HomeFeedRepository extends RestApiService {
  Future<List<ImageModel>> getAllImageList() async {
    final res = await get(ApiPath.getAllImages);
    return res.map<ImageModel>((x) => ImageModel.fromJson(x)).toList();
  }
}
