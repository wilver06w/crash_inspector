import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/get_list_errors_usecase.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/remove_list_errors_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';

part 'event.dart';
part 'state.dart';

class BlocList extends Bloc<ListEvent, ListState> {
  BlocList({
    required this.getListErrorsUseCase,
    required this.removeListErrorsUseCase,
  }) : super(const InitialState(Model())) {
    on<GetSentryConfigsEvent>(_onGetSentryConfigs);
    on<RemoveSentryConfigEvent>(_onRemoveSentryConfig);
  }

  final GetListErrorsUseCase getListErrorsUseCase;
  final RemoveListErrorsUseCase removeListErrorsUseCase;

  Future<void> _onGetSentryConfigs(
    GetSentryConfigsEvent event,
    Emitter<ListState> emit,
  ) async {
    emit(
      LoadingGetSentryConfigsState(
        state.model,
      ),
    );

    final getSentryConfigs = await getListErrorsUseCase.getListErrors();

    getSentryConfigs.fold(
      (failure) {
        emit(
          ErrorGetSentryConfigsState(
            model: state.model,
            message: failure.message,
          ),
        );
      },
      (configs) {
        emit(
          LoadedGetSentryConfigsState(
            state.model.copyWith(
              sentryConfigs: configs,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onRemoveSentryConfig(
    RemoveSentryConfigEvent event,
    Emitter<ListState> emit,
  ) async {
    emit(
      LoadingRemoveSentryConfigState(
        state.model,
      ),
    );
    final removeConfig = await removeListErrorsUseCase.call(event.index);

    removeConfig.fold(
      (failure) {
        emit(
          ErrorRemoveSentryConfigState(
            model: state.model,
            message: failure.message,
          ),
        );
      },
      (configs) {
        emit(
          LoadedRemoveSentryConfigState(
            model: state.model,
            sentryConfigModel: configs,
          ),
        );
      },
    );
  }
}
