part of 'bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object?> get props => [];
}

class GetListErrorsEvent extends ListEvent {
  const GetListErrorsEvent();
}
