part of 'bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object?> get props => [];
}

class GetSentryConfigsEvent extends OrdersEvent {
  const GetSentryConfigsEvent();
}

class RemoveSentryConfigEvent extends OrdersEvent {
  const RemoveSentryConfigEvent({
    required this.index,
  });
  final int index;
}
