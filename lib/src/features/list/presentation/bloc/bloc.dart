import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crash_inspector/src/features/list/data/models/list_errors_models.dart';
import 'package:crash_inspector/src/features/list/domain/usecases/get_list_errors_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocList extends Bloc<ListEvent, ListState> {
  BlocList({
    required this.getListErrorsUseCase,
  }) : super(const InitialState(Model())) {
    on<GetListErrorsEvent>(_onGetListErrorsEvent);
  }

  final GetListErrorsUseCase getListErrorsUseCase;

  Future<void> _onGetListErrorsEvent(
    GetListErrorsEvent event,
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
              listErrorsModels: configs,
            ),
          ),
        );
      },
    );
  }
}
