import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crash_inspector/src/features/home/domain/models/sentry_config_model.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/get_sentry_configs_usecase.dart';
import 'package:crash_inspector/src/features/home/domain/usecases/remove_sentry_config_usecase.dart';

part 'event.dart';
part 'state.dart';

class BlocHome extends Bloc<HomeEvent, HomeState> {
  BlocHome({
    required this.getSentryConfigsUseCase,
    required this.removeSentryConfigUseCase,
  }) : super(const InitialState(Model())) {
    on<GetSentryConfigsEvent>(_onGetSentryConfigs);
    on<RemoveSentryConfigEvent>(_onRemoveSentryConfig);
  }

  final GetSentryConfigsUseCase getSentryConfigsUseCase;
  final RemoveSentryConfigUseCase removeSentryConfigUseCase;

  Future<void> _onGetSentryConfigs(
    GetSentryConfigsEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      LoadingGetSentryConfigsState(
        state.model,
      ),
    );

    final getSentryConfigs = await getSentryConfigsUseCase.getSentryConfigs();

    getSentryConfigs.fold(
      (failure) {
        emit(
          ErrorGetSentryConfigsState(
            model: state.model,
            message: failure.errorMessage,
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
    Emitter<HomeState> emit,
  ) async {
    emit(
      LoadingRemoveSentryConfigState(
        state.model,
      ),
    );
    final removeConfig = await removeSentryConfigUseCase.call(event.index);

    removeConfig.fold(
      (failure) {
        emit(
          ErrorRemoveSentryConfigState(
            model: state.model,
            message: failure.errorMessage,
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
