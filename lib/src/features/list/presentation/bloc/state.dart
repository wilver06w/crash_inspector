part of 'bloc.dart';

abstract class ListState extends Equatable {
  const ListState(this.model);
  final Model model;

  @override
  List<Object?> get props => [model];
}

class InitialState extends ListState {
  const InitialState(super.model);
}

class LoadingGetSentryConfigsState extends ListState {
  const LoadingGetSentryConfigsState(super.model);
}

class LoadedGetSentryConfigsState extends ListState {
  const LoadedGetSentryConfigsState(super.model);
}

class ErrorGetSentryConfigsState extends ListState {
  const ErrorGetSentryConfigsState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class LoadingRemoveSentryConfigState extends ListState {
  const LoadingRemoveSentryConfigState(super.model);
}

class LoadedRemoveSentryConfigState extends ListState {
  const LoadedRemoveSentryConfigState({
    required Model model,
    required this.sentryConfigModel,
  }) : super(model);
  final SentryConfigModel sentryConfigModel;
}

class ErrorRemoveSentryConfigState extends ListState {
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
