import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_errors_models.freezed.dart';
part 'list_errors_models.g.dart';

@freezed
class ListErrorsModels with _$ListErrorsModels {
  const factory ListErrorsModels({
    required String id,
    required dynamic shareId,
    required String shortId,
    required String title,
    required String culprit,
    required String permalink,
    required String level,
    required String status,
    required String substatus,
    required bool isPublic,
    required String platform,
    required Project project,
    required String type,
    required Metadata metadata,
    required int numComments,
    required dynamic assignedTo,
    required bool isBookmarked,
    required bool isSubscribed,
    required bool hasSeen,
    required String issueType,
    required String issueCategory,
    required String priority,
    required bool isUnhandled,
    required String count,
    required int userCount,
    required DateTime firstSeen,
    required DateTime lastSeen,
  }) = _ListErrorsModels;

  factory ListErrorsModels.fromJson(Map<String, dynamic> json) =>
      _$ListErrorsModelsFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    required String value,
    String? type,
    String? filename,
    String? function,
    bool? displayTitleWithTreeLabel,
    required String inAppFrameMix,
    required Sdk sdk,
    required int initialPriority,
    dynamic title,
    SeerSimilarity? seerSimilarity,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}


@freezed
class Sdk with _$Sdk {
  const factory Sdk({
    required String name,
    required String nameNormalized,
  }) = _Sdk;

  factory Sdk.fromJson(Map<String, dynamic> json) => _$SdkFromJson(json);
}

@freezed
class SeerSimilarity with _$SeerSimilarity {
  const factory SeerSimilarity({
    required String similarityModelVersion,
    required String requestHash,
  }) = _SeerSimilarity;

  factory SeerSimilarity.fromJson(Map<String, dynamic> json) =>
      _$SeerSimilarityFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String name,
    required String slug,
    required String platform,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}
