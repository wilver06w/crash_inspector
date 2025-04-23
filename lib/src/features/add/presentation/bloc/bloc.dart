import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class AddBloc extends Bloc<AddEvent, AddState> {
  AddBloc() : super(const InitialState(Model())) {
    on<UpdateSelectedSourceEvent>(_onUpdateSelectedSource);
    on<UpdateSentryOrganizationIdEvent>(_onUpdateSentryOrganizationId);
    on<UpdateSentryProjectIdEvent>(_onUpdateSentryProjectId);
    on<UpdateSentryTokenEvent>(_onUpdateSentryToken);
  }

  void _onUpdateSelectedSource(
    UpdateSelectedSourceEvent event,
    Emitter<AddState> emit,
  ) {
    emit(
      LoadedChangeSource(
        state.model.copyWith(
          selectedSource: event.selectedSource,
        ),
      ),
    );
  }

  void _onUpdateSentryOrganizationId(
    UpdateSentryOrganizationIdEvent event,
    Emitter<AddState> emit,
  ) {
    emit(LoadedChangeSentryOrganizationId(state.model.copyWith(
      sentryOrganizationId: event.organizationId,
    )));
  }

  void _onUpdateSentryProjectId(
    UpdateSentryProjectIdEvent event,
    Emitter<AddState> emit,
  ) {
    emit(
      LoadedChangeSentryProjectId(
        state.model.copyWith(
          sentryProjectId: event.projectId,
        ),
      ),
    );
  }

  void _onUpdateSentryToken(
    UpdateSentryTokenEvent event,
    Emitter<AddState> emit,
  ) {
    emit(
      LoadedChangeSentryToken(
        state.model.copyWith(
          sentryToken: event.token,
        ),
      ),
    );
  }
}
