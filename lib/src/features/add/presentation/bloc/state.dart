part of 'bloc.dart';

abstract class AddState extends Equatable {
  const AddState(this.model);
  final Model model;

  @override
  List<Object?> get props => <Object>[model];
}

class InitialState extends AddState {
  const InitialState(super.model);
}

class LoadedChangeSource extends AddState {
  const LoadedChangeSource(super.model);
}

class LoadedChangeSentryOrganizationId extends AddState {
  const LoadedChangeSentryOrganizationId(super.model);
}

class LoadedChangeSentryProjectId extends AddState {
  const LoadedChangeSentryProjectId(super.model);
}

class LoadedChangeSentryToken extends AddState {
  const LoadedChangeSentryToken(super.model);
}

class Model extends Equatable {
  const Model({
    this.sources = const <String>[
      'Sentry',
      'Crashlytics',
      'Other',
    ],
    this.selectedSource,
    this.sentryOrganizationId = '',
    this.sentryProjectId = '',
    this.sentryToken = '',
  });

  final List<String>? sources;
  final String? selectedSource;
  final String sentryOrganizationId;
  final String sentryProjectId;
  final String sentryToken;

  Model copyWith({
    List<String>? sources,
    String? selectedSource,
    String? sentryOrganizationId,
    String? sentryProjectId,
    String? sentryToken,
  }) {
    return Model(
      sources: sources ?? this.sources,
      selectedSource: selectedSource ?? this.selectedSource,
      sentryOrganizationId: sentryOrganizationId ?? this.sentryOrganizationId,
      sentryProjectId: sentryProjectId ?? this.sentryProjectId,
      sentryToken: sentryToken ?? this.sentryToken,
    );
  }

  bool get isFormFilledCompleted =>
      selectedSource == 'Sentry' &&
      sentryOrganizationId.isNotEmpty &&
      sentryProjectId.isNotEmpty &&
      sentryToken.isNotEmpty;

  @override
  List<Object?> get props {
    return <Object?>[
      sources,
      selectedSource,
      sentryOrganizationId,
      sentryProjectId,
      sentryToken,
    ];
  }
}
