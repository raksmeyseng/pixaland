import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  const ImageModel({
    required this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    required this.downloadUrl,
  });

  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "author")
  final String? author;
  @JsonKey(name: "width")
  final double? width;
  @JsonKey(name: "height")
  final double? height;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "download_url")
  final String downloadUrl;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
