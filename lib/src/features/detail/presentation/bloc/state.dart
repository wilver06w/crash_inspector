part of 'bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState(this.model);
  final Model model;

  @override
  List<Object?> get props => [model];
}

class InitialState extends DetailState {
  const InitialState(super.model);
}

class LoadingGetSentryConfigsState extends DetailState {
  const LoadingGetSentryConfigsState(super.model);
}

class LoadedGetSentryConfigsState extends DetailState {
  const LoadedGetSentryConfigsState(super.model);
}

class ErrorGetSentryConfigsState extends DetailState {
  const ErrorGetSentryConfigsState({
    required Model model,
    required this.message,
  }) : super(model);
  final String message;
}

class Model extends Equatable {
  const Model({
    this.listErrorsModel,
  });

  final List<ErrorsModel>? listErrorsModel;

  Model copyWith({
    List<ErrorsModel>? listErrorsModel,
  }) {
    return Model(
      listErrorsModel: listErrorsModel ?? this.listErrorsModel,
    );
  }

  @override
  List<Object?> get props => [
        listErrorsModel,
      ];
}
