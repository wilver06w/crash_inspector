import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/http/failures.dart';
import '../../data/models/errors_model.dart';
import '../../domain/usecases/get_list_errors_usecase.dart';

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

    final Either<Failure, List<ErrorsModel>> getSentryConfigs =
        await getListErrorsUseCase.getListErrors();

    getSentryConfigs.fold(
      (Failure failure) {
        emit(
          ErrorGetSentryConfigsState(
            model: state.model,
            message: failure.message,
          ),
        );
      },
      (List<ErrorsModel> errorsModel) {
        emit(
          LoadedGetSentryConfigsState(
            state.model.copyWith(
              listErrorsModel: errorsModel,
            ),
          ),
        );
      },
    );
  }
}
