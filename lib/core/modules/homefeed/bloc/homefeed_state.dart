part of 'homefeed_bloc.dart';

class HomeFeedState extends Equatable {
  const HomeFeedState({
    this.status = BaseStatusEnum.initial,
    this.images = const [],
  });

  final BaseStatusEnum status;
  final List<ImageModel> images;

  HomeFeedState copyWith({
    BaseStatusEnum? status,
    List<ImageModel>? images,
  }) {
    return HomeFeedState(
      status: status ?? this.status,
      images: images ?? this.images,
    );
  }

  @override
  List<Object> get props => [status, images];
}
