import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_order_usecase.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_search_order_usecase.dart';
import 'package:equatable/equatable.dart';

part 'event.dart';
part 'state.dart';

class BlocOrders extends Bloc<OrdersEvent, OrdersState> {
  BlocOrders({
    required this.getOrdersUseCase,
    required this.getSearchOrdersUseCase,
  }) : super(const InitialState(Model())) {
    on<GetOrderListEvent>(_onGetOrderListEvent);
    on<SearchOrdersEvent>(_onSearchOrdersEvent);
  }

  final GetOrdersUseCase getOrdersUseCase;
  final GetSearchOrdersUseCase getSearchOrdersUseCase;

  Future<void> _onGetOrderListEvent(
    GetOrderListEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(
      LoadingGetOrderState(
        state.model,
      ),
    );

    final getOrders = await getOrdersUseCase.getOrders();

    getOrders.fold((l) {
      emit(
        ErrorGetOrderState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedGetOrderState(
          state.model.copyWith(
            listArchetype: r,
          ),
        ),
      );
    });
  }

  Future<void> _onSearchOrdersEvent(
    SearchOrdersEvent event,
    Emitter<OrdersState> emit,
  ) async {
    emit(LoadingGetSearchOrderState(state.model));

    final getOrders = await getSearchOrdersUseCase.setSearchOrder(
      search: event.search,
    );

    getOrders.fold((l) {
      emit(
        ErrorGetSearchOrderState(
          model: state.model,
          message: l.errorMessage,
        ),
      );
    }, (r) {
      emit(
        LoadedGetSearchOrderState(
          state.model.copyWith(
              // listArchetype: r,
              ),
        ),
      );
    });
  }
}
