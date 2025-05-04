part of 'bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState(this.model);
  final Model model;

  @override
  List<Object?> get props => <Object?>[model];
}

class InitialState extends HomeState {
  const InitialState(super.model);
}

class LoadingGetSentryConfigsState extends HomeState {
  const LoadingGetSentryConfigsState(super.model);
}

class LoadedGetSentryConfigsState extends HomeState {
  const LoadedGetSentryConfigsState(super.model);
}

class ErrorGetSentryConfigsState extends HomeState {
  const ErrorGetSentryConfigsState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class LoadingRemoveSentryConfigState extends HomeState {
  const LoadingRemoveSentryConfigState(super.model);
}

class LoadedRemoveSentryConfigState extends HomeState {
  const LoadedRemoveSentryConfigState({
    required Model model,
    required this.sentryConfigModel,
  }) : super(model);
  final SentryConfigModel sentryConfigModel;
}

class ErrorRemoveSentryConfigState extends HomeState {
  const ErrorRemoveSentryConfigState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class Model extends Equatable {
  const Model({
    this.sentryConfigs = const <SentryConfigModel>[],
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
  List<Object?> get props => <Object?>[
        sentryConfigs,
      ];
}
