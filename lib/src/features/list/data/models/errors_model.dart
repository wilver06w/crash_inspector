import 'package:freezed_annotation/freezed_annotation.dart';

part 'errors_model.freezed.dart';
part 'errors_model.g.dart';

@freezed
class ErrorsModel with _$ErrorsModel {
  const factory ErrorsModel({
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
  }) = _ErrorsModel;

  factory ErrorsModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorsModelFromJson(json);
}

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    required String value,
    String? type,
    String? filename,
    String? function,
    @JsonKey(name: 'display_title_with_tree_label')
    bool? displayTitleWithTreeLabel,
    @JsonKey(name: 'in_app_frame_mix') String? inAppFrameMix,
    required Sdk sdk,
    @JsonKey(name: 'initial_priority') required int initialPriority,
    dynamic title,
    @JsonKey(name: 'seer_similarity') SeerSimilarity? seerSimilarity,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

@freezed
class Sdk with _$Sdk {
  const factory Sdk({
    required String name,
    @JsonKey(name: 'name_normalized') required String nameNormalized,
  }) = _Sdk;

  factory Sdk.fromJson(Map<String, dynamic> json) => _$SdkFromJson(json);
}

@freezed
class SeerSimilarity with _$SeerSimilarity {
  const factory SeerSimilarity({
    @JsonKey(name: 'similarity_model_version')
    required String similarityModelVersion,
    @JsonKey(name: 'request_hash') required String requestHash,
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
