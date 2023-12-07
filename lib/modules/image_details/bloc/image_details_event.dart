part of 'image_details_bloc.dart';

abstract class ImageDetailsEvent extends Equatable {
  const ImageDetailsEvent();

  @override
  List<Object> get props => [];
}

class ImageDetailsStarted extends ImageDetailsEvent {
  const ImageDetailsStarted();
}
