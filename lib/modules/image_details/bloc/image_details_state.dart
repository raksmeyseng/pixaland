part of 'image_details_bloc.dart';

class ImageDetailsState extends Equatable {
  const ImageDetailsState._({
    this.status = BaseStatusEnum.initial,
    this.imageId = 0,
    this.data = ImageModel.empty,
    this.listData = const [],
  });

  final BaseStatusEnum status;
  final int imageId;
  final ImageModel data;
  final List<ImageModel> listData;

  const ImageDetailsState.initial({
    required int imageId,
  }) : this._(imageId: imageId);

  ImageDetailsState copyWith({
    BaseStatusEnum? status,
    int? imageId,
    ImageModel? data,
    String? heroTag,
    BaseStatusEnum? fetchMore,
    List<ImageModel>? listData,
  }) {
    return ImageDetailsState._(
      status: status ?? this.status,
      imageId: imageId ?? this.imageId,
      data: data ?? this.data,
      listData: listData ?? this.listData,
    );
  }

  @override
  List<Object?> get props => [status, imageId, data, listData];
}
