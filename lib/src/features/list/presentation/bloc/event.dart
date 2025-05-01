part of 'bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object?> get props => [];
}

class GetSentryConfigsEvent extends ListEvent {
  const GetSentryConfigsEvent();
}

class RemoveSentryConfigEvent extends ListEvent {
  const RemoveSentryConfigEvent({
    required this.index,
  });
  final int index;
}
