// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_errors_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListErrorsModelsImpl _$$ListErrorsModelsImplFromJson(
        Map<String, dynamic> json) =>
    _$ListErrorsModelsImpl(
      id: json['id'] as String,
      shareId: json['shareId'],
      shortId: json['shortId'] as String,
      title: json['title'] as String,
      culprit: json['culprit'] as String,
      permalink: json['permalink'] as String,
      level: json['level'] as String,
      status: json['status'] as String,
      substatus: json['substatus'] as String,
      isPublic: json['isPublic'] as bool,
      platform: json['platform'] as String,
      project: Project.fromJson(json['project'] as Map<String, dynamic>),
      type: json['type'] as String,
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      numComments: (json['numComments'] as num).toInt(),
      assignedTo: json['assignedTo'],
      isBookmarked: json['isBookmarked'] as bool,
      isSubscribed: json['isSubscribed'] as bool,
      hasSeen: json['hasSeen'] as bool,
      issueType: json['issueType'] as String,
      issueCategory: json['issueCategory'] as String,
      priority: json['priority'] as String,
      isUnhandled: json['isUnhandled'] as bool,
      count: json['count'] as String,
      userCount: (json['userCount'] as num).toInt(),
      firstSeen: DateTime.parse(json['firstSeen'] as String),
      lastSeen: DateTime.parse(json['lastSeen'] as String),
    );

Map<String, dynamic> _$$ListErrorsModelsImplToJson(
        _$ListErrorsModelsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shareId': instance.shareId,
      'shortId': instance.shortId,
      'title': instance.title,
      'culprit': instance.culprit,
      'permalink': instance.permalink,
      'level': instance.level,
      'status': instance.status,
      'substatus': instance.substatus,
      'isPublic': instance.isPublic,
      'platform': instance.platform,
      'project': instance.project,
      'type': instance.type,
      'metadata': instance.metadata,
      'numComments': instance.numComments,
      'assignedTo': instance.assignedTo,
      'isBookmarked': instance.isBookmarked,
      'isSubscribed': instance.isSubscribed,
      'hasSeen': instance.hasSeen,
      'issueType': instance.issueType,
      'issueCategory': instance.issueCategory,
      'priority': instance.priority,
      'isUnhandled': instance.isUnhandled,
      'count': instance.count,
      'userCount': instance.userCount,
      'firstSeen': instance.firstSeen.toIso8601String(),
      'lastSeen': instance.lastSeen.toIso8601String(),
    };

_$MetadataImpl _$$MetadataImplFromJson(Map<String, dynamic> json) =>
    _$MetadataImpl(
      value: json['value'] as String,
      type: json['type'] as String?,
      filename: json['filename'] as String?,
      function: json['function'] as String?,
      displayTitleWithTreeLabel: json['displayTitleWithTreeLabel'] as bool?,
      inAppFrameMix: json['inAppFrameMix'] as String,
      sdk: Sdk.fromJson(json['sdk'] as Map<String, dynamic>),
      initialPriority: (json['initialPriority'] as num).toInt(),
      title: json['title'],
      seerSimilarity: json['seerSimilarity'] == null
          ? null
          : SeerSimilarity.fromJson(
              json['seerSimilarity'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetadataImplToJson(_$MetadataImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'type': instance.type,
      'filename': instance.filename,
      'function': instance.function,
      'displayTitleWithTreeLabel': instance.displayTitleWithTreeLabel,
      'inAppFrameMix': instance.inAppFrameMix,
      'sdk': instance.sdk,
      'initialPriority': instance.initialPriority,
      'title': instance.title,
      'seerSimilarity': instance.seerSimilarity,
    };

_$SdkImpl _$$SdkImplFromJson(Map<String, dynamic> json) => _$SdkImpl(
      name: json['name'] as String,
      nameNormalized: json['nameNormalized'] as String,
    );

Map<String, dynamic> _$$SdkImplToJson(_$SdkImpl instance) => <String, dynamic>{
      'name': instance.name,
      'nameNormalized': instance.nameNormalized,
    };

_$SeerSimilarityImpl _$$SeerSimilarityImplFromJson(Map<String, dynamic> json) =>
    _$SeerSimilarityImpl(
      similarityModelVersion: json['similarityModelVersion'] as String,
      requestHash: json['requestHash'] as String,
    );

Map<String, dynamic> _$$SeerSimilarityImplToJson(
        _$SeerSimilarityImpl instance) =>
    <String, dynamic>{
      'similarityModelVersion': instance.similarityModelVersion,
      'requestHash': instance.requestHash,
    };

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      platform: json['platform'] as String,
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'platform': instance.platform,
    };
