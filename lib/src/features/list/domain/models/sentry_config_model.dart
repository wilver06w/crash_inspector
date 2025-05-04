import '../../../../shared/models/sentry_config.dart';

class SentryConfigModel {

  const SentryConfigModel({
    required this.organizationId,
    required this.projectId,
    required this.token,
  });

  factory SentryConfigModel.fromEntity(SentryConfig entity) {
    return SentryConfigModel(
      organizationId: entity.organizationId,
      projectId: entity.projectId,
      token: entity.token,
    );
  }
  final String organizationId;
  final String projectId;
  final String token;
}
