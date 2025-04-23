import 'package:effective_error_handling/generated/l10n.dart';
import 'package:effective_error_handling/src/features/home/data/models/archetype.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_order_usecase.dart';
import 'package:effective_error_handling/src/features/home/domain/usecases/get_search_order_usecase.dart';
import 'package:effective_error_handling/src/features/home/presentation/bloc/bloc.dart';
import 'package:effective_error_handling/src/shared/http/http_client.dart'
    hide ModularWatchExtension;
import 'package:effective_error_handling/src/shared/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:effective_error_handling/src/features/home/presentation/_sections/body.dart';
part 'package:effective_error_handling/src/features/home/presentation/_sections/my_card.dart';

class Page extends StatelessWidget {
  const Page({super.key});

  @override
  Widget build(BuildContext context) {
    final getOrdersUseCase = Modular.get<GetOrdersUseCase>();
    final getSearchOrdersUseCase = Modular.get<GetSearchOrdersUseCase>();
    return BlocProvider(
      create: (context) => BlocOrders(
        getOrdersUseCase: getOrdersUseCase,
        getSearchOrdersUseCase: getSearchOrdersUseCase,
      )..add(const GetOrderListEvent()),
      child: BlocListener<BlocOrders, OrdersState>(
        listener: _listener,
        child: Body(),
      ),
    );
  }
}

Future<void> _listener(BuildContext context, OrdersState state) async {
  if (state is LoadingGetOrderState) {
    AppLoading.show(context);
  } else if (state is ErrorGetOrderState) {
    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(state.message),
        backgroundColor: Colors.red,
      ),
    );
  } else if (state is LoadedGetOrderState) {
    Navigator.pop(context);
  }
}
