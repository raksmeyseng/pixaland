import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixaland/core/enum/base_status_enum.dart';
import 'package:pixaland/core/modules/homefeed/models/image_model.dart';
import 'package:pixaland/core/modules/homefeed/repositories/homefeed_repository.dart';

part 'homefeed_event.dart';
part 'homefeed_state.dart';

class HomeFeedBloc extends Bloc<HomeFeedEvent, HomeFeedState> {
  HomeFeedBloc({required this.repository}) : super(const HomeFeedState()) {
    on<HomeFeedEvent>(_onEvent);
  }

  final HomeFeedRepository repository;

  Future<void> _onEvent(
    HomeFeedEvent event,
    Emitter<HomeFeedState> emit,
  ) async {
    if (event is HomeFeedStarted) {
      return _onHomeFeedStarted(event, emit);
    }
  }

  Future<void> _onHomeFeedStarted(
    HomeFeedStarted event,
    Emitter<HomeFeedState> emit,
  ) async {
    emit(state.copyWith(status: BaseStatusEnum.inprogress));
    try {
      final images = await repository.getAllImageList();
      emit(state.copyWith(
        images: images.reversed.toList(),
        status: BaseStatusEnum.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: BaseStatusEnum.failure));
    }
  }
}
