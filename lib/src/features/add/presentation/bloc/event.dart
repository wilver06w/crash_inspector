part of 'bloc.dart';

abstract class AddEvent extends Equatable {
  const AddEvent();

  @override
  List<Object?> get props => List<Object>.empty();
}

class GetOrderListEvent extends AddEvent {
  const GetOrderListEvent({
    this.page = 1,
  });
  final int page;
}

class SearchOrdersEvent extends AddEvent {
  const SearchOrdersEvent({
    this.search = '',
  });
  final String search;
}

class UpdateSelectedSourceEvent extends AddEvent {
  const UpdateSelectedSourceEvent({required this.selectedSource});
  final String selectedSource;

  @override
  List<Object?> get props => <Object>[selectedSource];
}

class UpdateSentryOrganizationIdEvent extends AddEvent {
  const UpdateSentryOrganizationIdEvent({required this.organizationId});
  final String organizationId;

  @override
  List<Object?> get props => <Object>[organizationId];
}

class UpdateSentryProjectIdEvent extends AddEvent {
  const UpdateSentryProjectIdEvent({required this.projectId});
  final String projectId;

  @override
  List<Object?> get props => <Object>[projectId];
}

class UpdateSentryTokenEvent extends AddEvent {
  const UpdateSentryTokenEvent({required this.token});
  final String token;

  @override
  List<Object?> get props => <Object>[token];
}
