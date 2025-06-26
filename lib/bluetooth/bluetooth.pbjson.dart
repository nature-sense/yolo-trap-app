//
//  Generated code. Do not modify.
//  source: bluetooth.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use newSessionMsgDescriptor instead')
const NewSessionMsg$json = {
  '1': 'NewSessionMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `NewSessionMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newSessionMsgDescriptor = $convert.base64Decode(
    'Cg1OZXdTZXNzaW9uTXNnEhgKB3Nlc3Npb24YASABKAlSB3Nlc3Npb24=');

@$core.Deprecated('Use sessionDeletedMsgDescriptor instead')
const SessionDeletedMsg$json = {
  '1': 'SessionDeletedMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `SessionDeletedMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDeletedMsgDescriptor = $convert.base64Decode(
    'ChFTZXNzaW9uRGVsZXRlZE1zZxIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9u');

@$core.Deprecated('Use sessionDetailsMsgDescriptor instead')
const SessionDetailsMsg$json = {
  '1': 'SessionDetailsMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {'1': 'detections', '3': 2, '4': 1, '5': 5, '10': 'detections'},
  ],
};

/// Descriptor for `SessionDetailsMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDetailsMsgDescriptor = $convert.base64Decode(
    'ChFTZXNzaW9uRGV0YWlsc01zZxIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9uEh4KCmRldGVjdG'
    'lvbnMYAiABKAVSCmRldGVjdGlvbnM=');

@$core.Deprecated('Use sessionMsgDescriptor instead')
const SessionMsg$json = {
  '1': 'SessionMsg',
  '2': [
    {'1': 'new_session', '3': 1, '4': 1, '5': 11, '6': '.NewSessionMsg', '9': 0, '10': 'newSession'},
    {'1': 'del_session', '3': 2, '4': 1, '5': 11, '6': '.SessionDeletedMsg', '9': 0, '10': 'delSession'},
    {'1': 'sess_details', '3': 3, '4': 1, '5': 11, '6': '.SessionDetailsMsg', '9': 0, '10': 'sessDetails'},
  ],
  '8': [
    {'1': 'inner'},
  ],
};

/// Descriptor for `SessionMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionMsgDescriptor = $convert.base64Decode(
    'CgpTZXNzaW9uTXNnEjEKC25ld19zZXNzaW9uGAEgASgLMg4uTmV3U2Vzc2lvbk1zZ0gAUgpuZX'
    'dTZXNzaW9uEjUKC2RlbF9zZXNzaW9uGAIgASgLMhIuU2Vzc2lvbkRlbGV0ZWRNc2dIAFIKZGVs'
    'U2Vzc2lvbhI3CgxzZXNzX2RldGFpbHMYAyABKAsyEi5TZXNzaW9uRGV0YWlsc01zZ0gAUgtzZX'
    'NzRGV0YWlsc0IHCgVpbm5lcg==');

@$core.Deprecated('Use imageMsgDescriptor instead')
const ImageMsg$json = {
  '1': 'ImageMsg',
  '2': [
    {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.ImageHeaderMsg', '9': 0, '10': 'header'},
    {'1': 'segment', '3': 2, '4': 1, '5': 11, '6': '.ImageSegmentMsg', '9': 0, '10': 'segment'},
  ],
  '8': [
    {'1': 'inner'},
  ],
};

/// Descriptor for `ImageMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageMsgDescriptor = $convert.base64Decode(
    'CghJbWFnZU1zZxIpCgZoZWFkZXIYASABKAsyDy5JbWFnZUhlYWRlck1zZ0gAUgZoZWFkZXISLA'
    'oHc2VnbWVudBgCIAEoCzIQLkltYWdlU2VnbWVudE1zZ0gAUgdzZWdtZW50QgcKBWlubmVy');

@$core.Deprecated('Use stateMsgDescriptor instead')
const StateMsg$json = {
  '1': 'StateMsg',
  '2': [
    {'1': 'active_flow', '3': 1, '4': 1, '5': 5, '10': 'activeFlow'},
    {'1': 'storage_mounted', '3': 2, '4': 1, '5': 8, '10': 'storageMounted'},
  ],
};

/// Descriptor for `StateMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stateMsgDescriptor = $convert.base64Decode(
    'CghTdGF0ZU1zZxIfCgthY3RpdmVfZmxvdxgBIAEoBVIKYWN0aXZlRmxvdxInCg9zdG9yYWdlX2'
    '1vdW50ZWQYAiABKAhSDnN0b3JhZ2VNb3VudGVk');

@$core.Deprecated('Use imageHeaderMsgDescriptor instead')
const ImageHeaderMsg$json = {
  '1': 'ImageHeaderMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {'1': 'detection', '3': 2, '4': 1, '5': 5, '10': 'detection'},
    {'1': 'width', '3': 3, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 4, '4': 1, '5': 5, '10': 'height'},
    {'1': 'segments', '3': 5, '4': 1, '5': 5, '10': 'segments'},
  ],
};

/// Descriptor for `ImageHeaderMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageHeaderMsgDescriptor = $convert.base64Decode(
    'Cg5JbWFnZUhlYWRlck1zZxIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9uEhwKCWRldGVjdGlvbh'
    'gCIAEoBVIJZGV0ZWN0aW9uEhQKBXdpZHRoGAMgASgFUgV3aWR0aBIWCgZoZWlnaHQYBCABKAVS'
    'BmhlaWdodBIaCghzZWdtZW50cxgFIAEoBVIIc2VnbWVudHM=');

@$core.Deprecated('Use imageSegmentMsgDescriptor instead')
const ImageSegmentMsg$json = {
  '1': 'ImageSegmentMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {'1': 'detection', '3': 2, '4': 1, '5': 5, '10': 'detection'},
    {'1': 'segment', '3': 3, '4': 1, '5': 5, '10': 'segment'},
    {'1': 'data', '3': 4, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `ImageSegmentMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageSegmentMsgDescriptor = $convert.base64Decode(
    'Cg9JbWFnZVNlZ21lbnRNc2cSGAoHc2Vzc2lvbhgBIAEoCVIHc2Vzc2lvbhIcCglkZXRlY3Rpb2'
    '4YAiABKAVSCWRldGVjdGlvbhIYCgdzZWdtZW50GAMgASgFUgdzZWdtZW50EhIKBGRhdGEYBCAB'
    'KAxSBGRhdGE=');

@$core.Deprecated('Use frameMsgDescriptor instead')
const FrameMsg$json = {
  '1': 'FrameMsg',
  '2': [
    {'1': 'header', '3': 1, '4': 1, '5': 11, '6': '.FrameHeaderMsg', '9': 0, '10': 'header'},
    {'1': 'segment', '3': 2, '4': 1, '5': 11, '6': '.FrameSegmentMsg', '9': 0, '10': 'segment'},
  ],
  '8': [
    {'1': 'inner'},
  ],
};

/// Descriptor for `FrameMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameMsgDescriptor = $convert.base64Decode(
    'CghGcmFtZU1zZxIpCgZoZWFkZXIYASABKAsyDy5GcmFtZUhlYWRlck1zZ0gAUgZoZWFkZXISLA'
    'oHc2VnbWVudBgCIAEoCzIQLkZyYW1lU2VnbWVudE1zZ0gAUgdzZWdtZW50QgcKBWlubmVy');

@$core.Deprecated('Use frameHeaderMsgDescriptor instead')
const FrameHeaderMsg$json = {
  '1': 'FrameHeaderMsg',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'width', '3': 2, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 3, '4': 1, '5': 5, '10': 'height'},
    {'1': 'segments', '3': 4, '4': 1, '5': 5, '10': 'segments'},
  ],
};

/// Descriptor for `FrameHeaderMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameHeaderMsgDescriptor = $convert.base64Decode(
    'Cg5GcmFtZUhlYWRlck1zZxIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcBIUCgV3aWR0aB'
    'gCIAEoBVIFd2lkdGgSFgoGaGVpZ2h0GAMgASgFUgZoZWlnaHQSGgoIc2VnbWVudHMYBCABKAVS'
    'CHNlZ21lbnRz');

@$core.Deprecated('Use frameSegmentMsgDescriptor instead')
const FrameSegmentMsg$json = {
  '1': 'FrameSegmentMsg',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'segment', '3': 2, '4': 1, '5': 5, '10': 'segment'},
    {'1': 'data', '3': 3, '4': 1, '5': 12, '10': 'data'},
  ],
};

/// Descriptor for `FrameSegmentMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List frameSegmentMsgDescriptor = $convert.base64Decode(
    'Cg9GcmFtZVNlZ21lbnRNc2cSHAoJdGltZXN0YW1wGAEgASgDUgl0aW1lc3RhbXASGAoHc2VnbW'
    'VudBgCIAEoBVIHc2VnbWVudBISCgRkYXRhGAMgASgMUgRkYXRh');

@$core.Deprecated('Use detectionsForSessionMsgDescriptor instead')
const DetectionsForSessionMsg$json = {
  '1': 'DetectionsForSessionMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
  ],
};

/// Descriptor for `DetectionsForSessionMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detectionsForSessionMsgDescriptor = $convert.base64Decode(
    'ChdEZXRlY3Rpb25zRm9yU2Vzc2lvbk1zZxIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9u');

@$core.Deprecated('Use detectionReferenceMsgDescriptor instead')
const DetectionReferenceMsg$json = {
  '1': 'DetectionReferenceMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {'1': 'detection', '3': 2, '4': 1, '5': 5, '10': 'detection'},
  ],
};

/// Descriptor for `DetectionReferenceMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detectionReferenceMsgDescriptor = $convert.base64Decode(
    'ChVEZXRlY3Rpb25SZWZlcmVuY2VNc2cSGAoHc2Vzc2lvbhgBIAEoCVIHc2Vzc2lvbhIcCglkZX'
    'RlY3Rpb24YAiABKAVSCWRldGVjdGlvbg==');

@$core.Deprecated('Use detectionMetadataMsgDescriptor instead')
const DetectionMetadataMsg$json = {
  '1': 'DetectionMetadataMsg',
  '2': [
    {'1': 'session', '3': 1, '4': 1, '5': 9, '10': 'session'},
    {'1': 'detection', '3': 2, '4': 1, '5': 5, '10': 'detection'},
    {'1': 'created', '3': 3, '4': 1, '5': 3, '10': 'created'},
    {'1': 'updated', '3': 4, '4': 1, '5': 3, '10': 'updated'},
    {'1': 'score', '3': 5, '4': 1, '5': 2, '10': 'score'},
    {'1': 'clazz', '3': 6, '4': 1, '5': 5, '10': 'clazz'},
    {'1': 'width', '3': 7, '4': 1, '5': 5, '10': 'width'},
    {'1': 'height', '3': 8, '4': 1, '5': 5, '10': 'height'},
  ],
};

/// Descriptor for `DetectionMetadataMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List detectionMetadataMsgDescriptor = $convert.base64Decode(
    'ChREZXRlY3Rpb25NZXRhZGF0YU1zZxIYCgdzZXNzaW9uGAEgASgJUgdzZXNzaW9uEhwKCWRldG'
    'VjdGlvbhgCIAEoBVIJZGV0ZWN0aW9uEhgKB2NyZWF0ZWQYAyABKANSB2NyZWF0ZWQSGAoHdXBk'
    'YXRlZBgEIAEoA1IHdXBkYXRlZBIUCgVzY29yZRgFIAEoAlIFc2NvcmUSFAoFY2xhenoYBiABKA'
    'VSBWNsYXp6EhQKBXdpZHRoGAcgASgFUgV3aWR0aBIWCgZoZWlnaHQYCCABKAVSBmhlaWdodA==');

@$core.Deprecated('Use storageMsgDescriptor instead')
const StorageMsg$json = {
  '1': 'StorageMsg',
  '2': [
    {'1': 'mounted', '3': 1, '4': 1, '5': 8, '10': 'mounted'},
    {'1': 'volume', '3': 2, '4': 1, '5': 9, '10': 'volume'},
    {'1': 'space', '3': 3, '4': 1, '5': 5, '10': 'space'},
  ],
};

/// Descriptor for `StorageMsg`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storageMsgDescriptor = $convert.base64Decode(
    'CgpTdG9yYWdlTXNnEhgKB21vdW50ZWQYASABKAhSB21vdW50ZWQSFgoGdm9sdW1lGAIgASgJUg'
    'Z2b2x1bWUSFAoFc3BhY2UYAyABKAVSBXNwYWNl');

