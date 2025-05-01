part of 'bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class GetSentryConfigsEvent extends HomeEvent {
  const GetSentryConfigsEvent();
}

class RemoveSentryConfigEvent extends HomeEvent {
  const RemoveSentryConfigEvent({
    required this.index,
  });
  final int index;
}
