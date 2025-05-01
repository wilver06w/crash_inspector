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

class Model extends Equatable {
  const Model({
    this.listErrorsModels,
  });

  final ListErrorsModels? listErrorsModels;

  Model copyWith({
    ListErrorsModels? listErrorsModels,
  }) {
    return Model(
      listErrorsModels: listErrorsModels ?? this.listErrorsModels,
    );
  }

  @override
  List<Object?> get props => [
        listErrorsModels,
      ];
}
