class SentryConfig {
  final String organizationId;
  final String projectId;
  final String token;

  const SentryConfig({
    required this.organizationId,
    required this.projectId,
    required this.token,
  });

  Map<String, dynamic> toJson() => {
        'organizationId': organizationId,
        'projectId': projectId,
        'token': token,
      };

  factory SentryConfig.fromJson(Map<String, dynamic> json) {
    return SentryConfig(
      organizationId: json['organizationId'] as String,
      projectId: json['projectId'] as String,
      token: json['token'] as String,
    );
  }
}
