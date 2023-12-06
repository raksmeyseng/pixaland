part of 'homefeed_bloc.dart';

sealed class HomeFeedEvent extends Equatable {
  const HomeFeedEvent();

  @override
  List<Object> get props => [];
}

class HomeFeedStarted extends HomeFeedEvent {
  const HomeFeedStarted();

  @override
  List<Object> get props => [];
}
