part of 'bloc.dart';

abstract class ListState extends Equatable {
  const ListState(this.model);
  final Model model;

  @override
  List<Object?> get props => <Object?>[model];
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
  List<Object?> get props => <Object?>[
        listErrorsModel,
      ];
}
