part of 'bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState(this.model);
  final Model model;

  @override
  List<Object?> get props => [model];
}

class InitialState extends OrdersState {
  const InitialState(super.model);
}

class ErrorGetOrderState extends OrdersState {
  const ErrorGetOrderState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class LoadedGetOrderState extends OrdersState {
  const LoadedGetOrderState(super.model);
}

class LoadingGetSearchOrderState extends OrdersState {
  const LoadingGetSearchOrderState(super.model);
}

class ErrorGetSearchOrderState extends OrdersState {
  const ErrorGetSearchOrderState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class LoadedGetSearchOrderState extends OrdersState {
  const LoadedGetSearchOrderState(super.model);
}

class LoadingGetOrderState extends OrdersState {
  const LoadingGetOrderState(super.model);
}

class Model extends Equatable {
  const Model({
    this.listArchetype,
  });

  final List<Archetype>? listArchetype;

  Model copyWith({
    List<Archetype>? listArchetype,
  }) {
    return Model(
      listArchetype: listArchetype ?? this.listArchetype,
    );
  }

  @override
  List<Object?> get props {
    return [
      listArchetype,
    ];
  }
}
