import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';
import 'package:pixaland/core/modules/homefeed/models/image_model.dart';
import 'package:pixaland/core/modules/image_details/repositories/image_details_repository.dart';

part 'image_details_event.dart';
part 'image_details_state.dart';

class ImageDetailsBloc extends Bloc<ImageDetailsEvent, ImageDetailsState> {
  ImageDetailsBloc({
    required this.repository,
    required int imageId,
  }) : super(ImageDetailsState.initial(imageId: imageId)) {
    on<ImageDetailsEvent>(_onImageDetailsEvent);
  }

  final ImageDetailsRepository repository;

  Future<void> _onImageDetailsEvent(
    ImageDetailsEvent event,
    Emitter<ImageDetailsState> emit,
  ) async {
    if (event is ImageDetailsStarted) {
      return _onImageDetailsStarted(event, emit);
    }
  }

  Future<void> _onImageDetailsStarted(
    ImageDetailsStarted event,
    Emitter<ImageDetailsState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      final data = await repository.getImageDetails(state.imageId);
      final listData = await repository.getRelatedList();
      emit(state.copyWith(
        data: data,
        listData: listData,
        status: BaseStatusEnum.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
