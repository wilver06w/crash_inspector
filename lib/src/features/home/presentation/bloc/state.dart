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

class LoadingGetSentryConfigsState extends OrdersState {
  const LoadingGetSentryConfigsState(super.model);
}

class LoadedGetSentryConfigsState extends OrdersState {
  const LoadedGetSentryConfigsState(super.model);
}

class ErrorGetSentryConfigsState extends OrdersState {
  const ErrorGetSentryConfigsState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class LoadingRemoveSentryConfigState extends OrdersState {
  const LoadingRemoveSentryConfigState(super.model);
}

class LoadedRemoveSentryConfigState extends OrdersState {
  const LoadedRemoveSentryConfigState({
    required Model model,
    required this.sentryConfigModel,
  }) : super(model);
  final SentryConfigModel sentryConfigModel;
}

class ErrorRemoveSentryConfigState extends OrdersState {
  const ErrorRemoveSentryConfigState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class Model extends Equatable {
  const Model({
    this.sentryConfigs = const [],
  });

  final List<SentryConfigModel> sentryConfigs;

  Model copyWith({
    List<SentryConfigModel>? sentryConfigs,
  }) {
    return Model(
      sentryConfigs: sentryConfigs ?? this.sentryConfigs,
    );
  }

  @override
  List<Object?> get props => [
        sentryConfigs,
      ];
}
