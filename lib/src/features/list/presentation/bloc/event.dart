part of 'bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object?> get props => <Object?>[];
}

class GetListErrorsEvent extends ListEvent {
  const GetListErrorsEvent();
}
