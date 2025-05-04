import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/http/failures.dart';
import '../../domain/models/sentry_config_model.dart';
import '../../domain/usecases/get_sentry_configs_usecase.dart';
import '../../domain/usecases/remove_sentry_config_usecase.dart';

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

    final Either<Failure, List<SentryConfigModel>> getSentryConfigs =
        await getSentryConfigsUseCase.getSentryConfigs();

    getSentryConfigs.fold(
      (Failure failure) {
        emit(
          ErrorGetSentryConfigsState(
            model: state.model,
            message: failure.message,
          ),
        );
      },
      (List<SentryConfigModel> configs) {
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
    final Either<Failure, SentryConfigModel> removeConfig =
        await removeSentryConfigUseCase.call(event.index);

    removeConfig.fold(
      (Failure failure) {
        emit(
          ErrorRemoveSentryConfigState(
            model: state.model,
            message: failure.message,
          ),
        );
      },
      (SentryConfigModel configs) {
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
