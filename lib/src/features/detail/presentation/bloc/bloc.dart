import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crash_inspector/src/features/list/data/models/errors_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class BlocDetail extends Bloc<DetailEvent, DetailState> {
  BlocDetail() : super(const InitialState(Model())) {
    on<GetListErrorsEvent>(_onGetListErrorsEvent);
  }

  Future<void> _onGetListErrorsEvent(
    GetListErrorsEvent event,
    Emitter<DetailState> emit,
  ) async {
    // emit(
    //   LoadingGetSentryConfigsState(
    //     state.model,
    //   ),
    // );

    // final getSentryConfigs = await getListErrorsUseCase.getListErrors();

    // getSentryConfigs.fold(
    //   (failure) {
    //     emit(
    //       ErrorGetSentryConfigsState(
    //         model: state.model,
    //         message: failure.message,
    //       ),
    //     );
    //   },
    //   (errorsModel) {
    //     emit(
    //       LoadedGetSentryConfigsState(
    //         state.model.copyWith(
    //           listErrorsModel: errorsModel,
    //         ),
    //       ),
    //     );
    //   },
    // );
  }
}
