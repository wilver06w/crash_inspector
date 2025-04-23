part of 'bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class GetOrderListEvent extends OrdersEvent {
  const GetOrderListEvent({
    this.page = 1,
  });
  final int page;
}

class SearchOrdersEvent extends OrdersEvent {
  const SearchOrdersEvent({
    this.search = '',
  });
  final String search;
}
