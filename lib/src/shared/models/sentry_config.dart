class SentryConfig {

  const SentryConfig({
    required this.organizationId,
    required this.projectId,
    required this.token,
  });

  factory SentryConfig.fromJson(Map<String, dynamic> json) {
    return SentryConfig(
      organizationId: json['organizationId'] as String,
      projectId: json['projectId'] as String,
      token: json['token'] as String,
    );
  }
  final String organizationId;
  final String projectId;
  final String token;

  Map<String, String> toJson() => <String, String>{
        'organizationId': organizationId,
        'projectId': projectId,
        'token': token,
      };
}
