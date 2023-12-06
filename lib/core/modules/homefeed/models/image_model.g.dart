// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as String,
      author: json['author'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      url: json['url'] as String?,
      downloadUrl: json['download_url'] as String,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'download_url': instance.downloadUrl,
    };
