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

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class NewSessionMsg extends $pb.GeneratedMessage {
  factory NewSessionMsg({
    $core.String? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  NewSessionMsg._();

  factory NewSessionMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory NewSessionMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewSessionMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewSessionMsg clone() => NewSessionMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewSessionMsg copyWith(void Function(NewSessionMsg) updates) => super.copyWith((message) => updates(message as NewSessionMsg)) as NewSessionMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewSessionMsg create() => NewSessionMsg._();
  @$core.override
  NewSessionMsg createEmptyInstance() => create();
  static $pb.PbList<NewSessionMsg> createRepeated() => $pb.PbList<NewSessionMsg>();
  @$core.pragma('dart2js:noInline')
  static NewSessionMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewSessionMsg>(create);
  static NewSessionMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
}

class SessionDeletedMsg extends $pb.GeneratedMessage {
  factory SessionDeletedMsg({
    $core.String? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  SessionDeletedMsg._();

  factory SessionDeletedMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SessionDeletedMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SessionDeletedMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDeletedMsg clone() => SessionDeletedMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDeletedMsg copyWith(void Function(SessionDeletedMsg) updates) => super.copyWith((message) => updates(message as SessionDeletedMsg)) as SessionDeletedMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionDeletedMsg create() => SessionDeletedMsg._();
  @$core.override
  SessionDeletedMsg createEmptyInstance() => create();
  static $pb.PbList<SessionDeletedMsg> createRepeated() => $pb.PbList<SessionDeletedMsg>();
  @$core.pragma('dart2js:noInline')
  static SessionDeletedMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionDeletedMsg>(create);
  static SessionDeletedMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
}

class SessionDetailsMsg extends $pb.GeneratedMessage {
  factory SessionDetailsMsg({
    $core.String? session,
    $core.int? detections,
  }) {
    final result = create();
    if (session != null) result.session = session;
    if (detections != null) result.detections = detections;
    return result;
  }

  SessionDetailsMsg._();

  factory SessionDetailsMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SessionDetailsMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SessionDetailsMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'detections', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDetailsMsg clone() => SessionDetailsMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionDetailsMsg copyWith(void Function(SessionDetailsMsg) updates) => super.copyWith((message) => updates(message as SessionDetailsMsg)) as SessionDetailsMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionDetailsMsg create() => SessionDetailsMsg._();
  @$core.override
  SessionDetailsMsg createEmptyInstance() => create();
  static $pb.PbList<SessionDetailsMsg> createRepeated() => $pb.PbList<SessionDetailsMsg>();
  @$core.pragma('dart2js:noInline')
  static SessionDetailsMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionDetailsMsg>(create);
  static SessionDetailsMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get detections => $_getIZ(1);
  @$pb.TagNumber(2)
  set detections($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDetections() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetections() => $_clearField(2);
}

enum SessionMsg_Inner {
  newSession, 
  delSession, 
  sessDetails, 
  notSet
}

class SessionMsg extends $pb.GeneratedMessage {
  factory SessionMsg({
    NewSessionMsg? newSession,
    SessionDeletedMsg? delSession,
    SessionDetailsMsg? sessDetails,
  }) {
    final result = create();
    if (newSession != null) result.newSession = newSession;
    if (delSession != null) result.delSession = delSession;
    if (sessDetails != null) result.sessDetails = sessDetails;
    return result;
  }

  SessionMsg._();

  factory SessionMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SessionMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SessionMsg_Inner> _SessionMsg_InnerByTag = {
    1 : SessionMsg_Inner.newSession,
    2 : SessionMsg_Inner.delSession,
    3 : SessionMsg_Inner.sessDetails,
    0 : SessionMsg_Inner.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SessionMsg', createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<NewSessionMsg>(1, _omitFieldNames ? '' : 'newSession', subBuilder: NewSessionMsg.create)
    ..aOM<SessionDeletedMsg>(2, _omitFieldNames ? '' : 'delSession', subBuilder: SessionDeletedMsg.create)
    ..aOM<SessionDetailsMsg>(3, _omitFieldNames ? '' : 'sessDetails', subBuilder: SessionDetailsMsg.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionMsg clone() => SessionMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SessionMsg copyWith(void Function(SessionMsg) updates) => super.copyWith((message) => updates(message as SessionMsg)) as SessionMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SessionMsg create() => SessionMsg._();
  @$core.override
  SessionMsg createEmptyInstance() => create();
  static $pb.PbList<SessionMsg> createRepeated() => $pb.PbList<SessionMsg>();
  @$core.pragma('dart2js:noInline')
  static SessionMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SessionMsg>(create);
  static SessionMsg? _defaultInstance;

  SessionMsg_Inner whichInner() => _SessionMsg_InnerByTag[$_whichOneof(0)]!;
  void clearInner() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  NewSessionMsg get newSession => $_getN(0);
  @$pb.TagNumber(1)
  set newSession(NewSessionMsg value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasNewSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearNewSession() => $_clearField(1);
  @$pb.TagNumber(1)
  NewSessionMsg ensureNewSession() => $_ensure(0);

  @$pb.TagNumber(2)
  SessionDeletedMsg get delSession => $_getN(1);
  @$pb.TagNumber(2)
  set delSession(SessionDeletedMsg value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDelSession() => $_has(1);
  @$pb.TagNumber(2)
  void clearDelSession() => $_clearField(2);
  @$pb.TagNumber(2)
  SessionDeletedMsg ensureDelSession() => $_ensure(1);

  @$pb.TagNumber(3)
  SessionDetailsMsg get sessDetails => $_getN(2);
  @$pb.TagNumber(3)
  set sessDetails(SessionDetailsMsg value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSessDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearSessDetails() => $_clearField(3);
  @$pb.TagNumber(3)
  SessionDetailsMsg ensureSessDetails() => $_ensure(2);
}

enum ImageMsg_Inner {
  header, 
  segment, 
  notSet
}

class ImageMsg extends $pb.GeneratedMessage {
  factory ImageMsg({
    ImageHeaderMsg? header,
    ImageSegmentMsg? segment,
  }) {
    final result = create();
    if (header != null) result.header = header;
    if (segment != null) result.segment = segment;
    return result;
  }

  ImageMsg._();

  factory ImageMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ImageMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, ImageMsg_Inner> _ImageMsg_InnerByTag = {
    1 : ImageMsg_Inner.header,
    2 : ImageMsg_Inner.segment,
    0 : ImageMsg_Inner.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageMsg', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<ImageHeaderMsg>(1, _omitFieldNames ? '' : 'header', subBuilder: ImageHeaderMsg.create)
    ..aOM<ImageSegmentMsg>(2, _omitFieldNames ? '' : 'segment', subBuilder: ImageSegmentMsg.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMsg clone() => ImageMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageMsg copyWith(void Function(ImageMsg) updates) => super.copyWith((message) => updates(message as ImageMsg)) as ImageMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageMsg create() => ImageMsg._();
  @$core.override
  ImageMsg createEmptyInstance() => create();
  static $pb.PbList<ImageMsg> createRepeated() => $pb.PbList<ImageMsg>();
  @$core.pragma('dart2js:noInline')
  static ImageMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageMsg>(create);
  static ImageMsg? _defaultInstance;

  ImageMsg_Inner whichInner() => _ImageMsg_InnerByTag[$_whichOneof(0)]!;
  void clearInner() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ImageHeaderMsg get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(ImageHeaderMsg value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => $_clearField(1);
  @$pb.TagNumber(1)
  ImageHeaderMsg ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  ImageSegmentMsg get segment => $_getN(1);
  @$pb.TagNumber(2)
  set segment(ImageSegmentMsg value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSegment() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegment() => $_clearField(2);
  @$pb.TagNumber(2)
  ImageSegmentMsg ensureSegment() => $_ensure(1);
}

class StateMsg extends $pb.GeneratedMessage {
  factory StateMsg({
    $core.int? activeFlow,
  }) {
    final result = create();
    if (activeFlow != null) result.activeFlow = activeFlow;
    return result;
  }

  StateMsg._();

  factory StateMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory StateMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StateMsg', createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'activeFlow', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateMsg clone() => StateMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StateMsg copyWith(void Function(StateMsg) updates) => super.copyWith((message) => updates(message as StateMsg)) as StateMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StateMsg create() => StateMsg._();
  @$core.override
  StateMsg createEmptyInstance() => create();
  static $pb.PbList<StateMsg> createRepeated() => $pb.PbList<StateMsg>();
  @$core.pragma('dart2js:noInline')
  static StateMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StateMsg>(create);
  static StateMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get activeFlow => $_getIZ(0);
  @$pb.TagNumber(1)
  set activeFlow($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasActiveFlow() => $_has(0);
  @$pb.TagNumber(1)
  void clearActiveFlow() => $_clearField(1);
}

class ImageHeaderMsg extends $pb.GeneratedMessage {
  factory ImageHeaderMsg({
    $core.String? session,
    $core.int? detection,
    $core.int? width,
    $core.int? height,
    $core.int? segments,
  }) {
    final result = create();
    if (session != null) result.session = session;
    if (detection != null) result.detection = detection;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (segments != null) result.segments = segments;
    return result;
  }

  ImageHeaderMsg._();

  factory ImageHeaderMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ImageHeaderMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageHeaderMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'detection', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'segments', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageHeaderMsg clone() => ImageHeaderMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageHeaderMsg copyWith(void Function(ImageHeaderMsg) updates) => super.copyWith((message) => updates(message as ImageHeaderMsg)) as ImageHeaderMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageHeaderMsg create() => ImageHeaderMsg._();
  @$core.override
  ImageHeaderMsg createEmptyInstance() => create();
  static $pb.PbList<ImageHeaderMsg> createRepeated() => $pb.PbList<ImageHeaderMsg>();
  @$core.pragma('dart2js:noInline')
  static ImageHeaderMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageHeaderMsg>(create);
  static ImageHeaderMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get detection => $_getIZ(1);
  @$pb.TagNumber(2)
  set detection($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDetection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetection() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get width => $_getIZ(2);
  @$pb.TagNumber(3)
  set width($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWidth() => $_has(2);
  @$pb.TagNumber(3)
  void clearWidth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get height => $_getIZ(3);
  @$pb.TagNumber(4)
  set height($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHeight() => $_has(3);
  @$pb.TagNumber(4)
  void clearHeight() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get segments => $_getIZ(4);
  @$pb.TagNumber(5)
  set segments($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSegments() => $_has(4);
  @$pb.TagNumber(5)
  void clearSegments() => $_clearField(5);
}

class ImageSegmentMsg extends $pb.GeneratedMessage {
  factory ImageSegmentMsg({
    $core.String? session,
    $core.int? detection,
    $core.int? segment,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (session != null) result.session = session;
    if (detection != null) result.detection = detection;
    if (segment != null) result.segment = segment;
    if (data != null) result.data = data;
    return result;
  }

  ImageSegmentMsg._();

  factory ImageSegmentMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory ImageSegmentMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageSegmentMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'detection', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'segment', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageSegmentMsg clone() => ImageSegmentMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageSegmentMsg copyWith(void Function(ImageSegmentMsg) updates) => super.copyWith((message) => updates(message as ImageSegmentMsg)) as ImageSegmentMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageSegmentMsg create() => ImageSegmentMsg._();
  @$core.override
  ImageSegmentMsg createEmptyInstance() => create();
  static $pb.PbList<ImageSegmentMsg> createRepeated() => $pb.PbList<ImageSegmentMsg>();
  @$core.pragma('dart2js:noInline')
  static ImageSegmentMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageSegmentMsg>(create);
  static ImageSegmentMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get detection => $_getIZ(1);
  @$pb.TagNumber(2)
  set detection($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDetection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetection() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get segment => $_getIZ(2);
  @$pb.TagNumber(3)
  set segment($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSegment() => $_has(2);
  @$pb.TagNumber(3)
  void clearSegment() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => $_clearField(4);
}

enum FrameMsg_Inner {
  header, 
  segment, 
  notSet
}

class FrameMsg extends $pb.GeneratedMessage {
  factory FrameMsg({
    FrameHeaderMsg? header,
    FrameSegmentMsg? segment,
  }) {
    final result = create();
    if (header != null) result.header = header;
    if (segment != null) result.segment = segment;
    return result;
  }

  FrameMsg._();

  factory FrameMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory FrameMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, FrameMsg_Inner> _FrameMsg_InnerByTag = {
    1 : FrameMsg_Inner.header,
    2 : FrameMsg_Inner.segment,
    0 : FrameMsg_Inner.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FrameMsg', createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<FrameHeaderMsg>(1, _omitFieldNames ? '' : 'header', subBuilder: FrameHeaderMsg.create)
    ..aOM<FrameSegmentMsg>(2, _omitFieldNames ? '' : 'segment', subBuilder: FrameSegmentMsg.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrameMsg clone() => FrameMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrameMsg copyWith(void Function(FrameMsg) updates) => super.copyWith((message) => updates(message as FrameMsg)) as FrameMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrameMsg create() => FrameMsg._();
  @$core.override
  FrameMsg createEmptyInstance() => create();
  static $pb.PbList<FrameMsg> createRepeated() => $pb.PbList<FrameMsg>();
  @$core.pragma('dart2js:noInline')
  static FrameMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrameMsg>(create);
  static FrameMsg? _defaultInstance;

  FrameMsg_Inner whichInner() => _FrameMsg_InnerByTag[$_whichOneof(0)]!;
  void clearInner() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  FrameHeaderMsg get header => $_getN(0);
  @$pb.TagNumber(1)
  set header(FrameHeaderMsg value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasHeader() => $_has(0);
  @$pb.TagNumber(1)
  void clearHeader() => $_clearField(1);
  @$pb.TagNumber(1)
  FrameHeaderMsg ensureHeader() => $_ensure(0);

  @$pb.TagNumber(2)
  FrameSegmentMsg get segment => $_getN(1);
  @$pb.TagNumber(2)
  set segment(FrameSegmentMsg value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSegment() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegment() => $_clearField(2);
  @$pb.TagNumber(2)
  FrameSegmentMsg ensureSegment() => $_ensure(1);
}

class FrameHeaderMsg extends $pb.GeneratedMessage {
  factory FrameHeaderMsg({
    $fixnum.Int64? timestamp,
    $core.int? width,
    $core.int? height,
    $core.int? segments,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    if (segments != null) result.segments = segments;
    return result;
  }

  FrameHeaderMsg._();

  factory FrameHeaderMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory FrameHeaderMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FrameHeaderMsg', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'segments', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrameHeaderMsg clone() => FrameHeaderMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrameHeaderMsg copyWith(void Function(FrameHeaderMsg) updates) => super.copyWith((message) => updates(message as FrameHeaderMsg)) as FrameHeaderMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrameHeaderMsg create() => FrameHeaderMsg._();
  @$core.override
  FrameHeaderMsg createEmptyInstance() => create();
  static $pb.PbList<FrameHeaderMsg> createRepeated() => $pb.PbList<FrameHeaderMsg>();
  @$core.pragma('dart2js:noInline')
  static FrameHeaderMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrameHeaderMsg>(create);
  static FrameHeaderMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get width => $_getIZ(1);
  @$pb.TagNumber(2)
  set width($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWidth() => $_has(1);
  @$pb.TagNumber(2)
  void clearWidth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get height => $_getIZ(2);
  @$pb.TagNumber(3)
  set height($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasHeight() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeight() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get segments => $_getIZ(3);
  @$pb.TagNumber(4)
  set segments($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSegments() => $_has(3);
  @$pb.TagNumber(4)
  void clearSegments() => $_clearField(4);
}

class FrameSegmentMsg extends $pb.GeneratedMessage {
  factory FrameSegmentMsg({
    $fixnum.Int64? timestamp,
    $core.int? segment,
    $core.List<$core.int>? data,
  }) {
    final result = create();
    if (timestamp != null) result.timestamp = timestamp;
    if (segment != null) result.segment = segment;
    if (data != null) result.data = data;
    return result;
  }

  FrameSegmentMsg._();

  factory FrameSegmentMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory FrameSegmentMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FrameSegmentMsg', createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'segment', $pb.PbFieldType.O3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrameSegmentMsg clone() => FrameSegmentMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FrameSegmentMsg copyWith(void Function(FrameSegmentMsg) updates) => super.copyWith((message) => updates(message as FrameSegmentMsg)) as FrameSegmentMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FrameSegmentMsg create() => FrameSegmentMsg._();
  @$core.override
  FrameSegmentMsg createEmptyInstance() => create();
  static $pb.PbList<FrameSegmentMsg> createRepeated() => $pb.PbList<FrameSegmentMsg>();
  @$core.pragma('dart2js:noInline')
  static FrameSegmentMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FrameSegmentMsg>(create);
  static FrameSegmentMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get segment => $_getIZ(1);
  @$pb.TagNumber(2)
  set segment($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSegment() => $_has(1);
  @$pb.TagNumber(2)
  void clearSegment() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => $_clearField(3);
}

class DetectionsForSessionMsg extends $pb.GeneratedMessage {
  factory DetectionsForSessionMsg({
    $core.String? session,
  }) {
    final result = create();
    if (session != null) result.session = session;
    return result;
  }

  DetectionsForSessionMsg._();

  factory DetectionsForSessionMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DetectionsForSessionMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DetectionsForSessionMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetectionsForSessionMsg clone() => DetectionsForSessionMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetectionsForSessionMsg copyWith(void Function(DetectionsForSessionMsg) updates) => super.copyWith((message) => updates(message as DetectionsForSessionMsg)) as DetectionsForSessionMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DetectionsForSessionMsg create() => DetectionsForSessionMsg._();
  @$core.override
  DetectionsForSessionMsg createEmptyInstance() => create();
  static $pb.PbList<DetectionsForSessionMsg> createRepeated() => $pb.PbList<DetectionsForSessionMsg>();
  @$core.pragma('dart2js:noInline')
  static DetectionsForSessionMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetectionsForSessionMsg>(create);
  static DetectionsForSessionMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);
}

class DetectionReferenceMsg extends $pb.GeneratedMessage {
  factory DetectionReferenceMsg({
    $core.String? session,
    $core.int? detection,
  }) {
    final result = create();
    if (session != null) result.session = session;
    if (detection != null) result.detection = detection;
    return result;
  }

  DetectionReferenceMsg._();

  factory DetectionReferenceMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DetectionReferenceMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DetectionReferenceMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'detection', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetectionReferenceMsg clone() => DetectionReferenceMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetectionReferenceMsg copyWith(void Function(DetectionReferenceMsg) updates) => super.copyWith((message) => updates(message as DetectionReferenceMsg)) as DetectionReferenceMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DetectionReferenceMsg create() => DetectionReferenceMsg._();
  @$core.override
  DetectionReferenceMsg createEmptyInstance() => create();
  static $pb.PbList<DetectionReferenceMsg> createRepeated() => $pb.PbList<DetectionReferenceMsg>();
  @$core.pragma('dart2js:noInline')
  static DetectionReferenceMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetectionReferenceMsg>(create);
  static DetectionReferenceMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get detection => $_getIZ(1);
  @$pb.TagNumber(2)
  set detection($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDetection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetection() => $_clearField(2);
}

class DetectionMetadataMsg extends $pb.GeneratedMessage {
  factory DetectionMetadataMsg({
    $core.String? session,
    $core.int? detection,
    $fixnum.Int64? created,
    $fixnum.Int64? updated,
    $core.double? score,
    $core.int? clazz,
    $core.int? width,
    $core.int? height,
  }) {
    final result = create();
    if (session != null) result.session = session;
    if (detection != null) result.detection = detection;
    if (created != null) result.created = created;
    if (updated != null) result.updated = updated;
    if (score != null) result.score = score;
    if (clazz != null) result.clazz = clazz;
    if (width != null) result.width = width;
    if (height != null) result.height = height;
    return result;
  }

  DetectionMetadataMsg._();

  factory DetectionMetadataMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory DetectionMetadataMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DetectionMetadataMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'session')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'detection', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'created')
    ..aInt64(4, _omitFieldNames ? '' : 'updated')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'score', $pb.PbFieldType.OF)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'clazz', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'width', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'height', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetectionMetadataMsg clone() => DetectionMetadataMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DetectionMetadataMsg copyWith(void Function(DetectionMetadataMsg) updates) => super.copyWith((message) => updates(message as DetectionMetadataMsg)) as DetectionMetadataMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DetectionMetadataMsg create() => DetectionMetadataMsg._();
  @$core.override
  DetectionMetadataMsg createEmptyInstance() => create();
  static $pb.PbList<DetectionMetadataMsg> createRepeated() => $pb.PbList<DetectionMetadataMsg>();
  @$core.pragma('dart2js:noInline')
  static DetectionMetadataMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DetectionMetadataMsg>(create);
  static DetectionMetadataMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get session => $_getSZ(0);
  @$pb.TagNumber(1)
  set session($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSession() => $_has(0);
  @$pb.TagNumber(1)
  void clearSession() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get detection => $_getIZ(1);
  @$pb.TagNumber(2)
  set detection($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDetection() => $_has(1);
  @$pb.TagNumber(2)
  void clearDetection() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get created => $_getI64(2);
  @$pb.TagNumber(3)
  set created($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCreated() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreated() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get updated => $_getI64(3);
  @$pb.TagNumber(4)
  set updated($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUpdated() => $_has(3);
  @$pb.TagNumber(4)
  void clearUpdated() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get score => $_getN(4);
  @$pb.TagNumber(5)
  set score($core.double value) => $_setFloat(4, value);
  @$pb.TagNumber(5)
  $core.bool hasScore() => $_has(4);
  @$pb.TagNumber(5)
  void clearScore() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get clazz => $_getIZ(5);
  @$pb.TagNumber(6)
  set clazz($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasClazz() => $_has(5);
  @$pb.TagNumber(6)
  void clearClazz() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get width => $_getIZ(6);
  @$pb.TagNumber(7)
  set width($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasWidth() => $_has(6);
  @$pb.TagNumber(7)
  void clearWidth() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get height => $_getIZ(7);
  @$pb.TagNumber(8)
  set height($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeight() => $_clearField(8);
}

class StorageMsg extends $pb.GeneratedMessage {
  factory StorageMsg({
    $core.bool? mounted,
    $core.String? volume,
    $core.int? space,
  }) {
    final result = create();
    if (mounted != null) result.mounted = mounted;
    if (volume != null) result.volume = volume;
    if (space != null) result.space = space;
    return result;
  }

  StorageMsg._();

  factory StorageMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory StorageMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StorageMsg', createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'mounted')
    ..aOS(2, _omitFieldNames ? '' : 'volume')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'space', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorageMsg clone() => StorageMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorageMsg copyWith(void Function(StorageMsg) updates) => super.copyWith((message) => updates(message as StorageMsg)) as StorageMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorageMsg create() => StorageMsg._();
  @$core.override
  StorageMsg createEmptyInstance() => create();
  static $pb.PbList<StorageMsg> createRepeated() => $pb.PbList<StorageMsg>();
  @$core.pragma('dart2js:noInline')
  static StorageMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StorageMsg>(create);
  static StorageMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get mounted => $_getBF(0);
  @$pb.TagNumber(1)
  set mounted($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasMounted() => $_has(0);
  @$pb.TagNumber(1)
  void clearMounted() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get volume => $_getSZ(1);
  @$pb.TagNumber(2)
  set volume($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVolume() => $_has(1);
  @$pb.TagNumber(2)
  void clearVolume() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get space => $_getIZ(2);
  @$pb.TagNumber(3)
  set space($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSpace() => $_has(2);
  @$pb.TagNumber(3)
  void clearSpace() => $_clearField(3);
}

class SettingsMsg extends $pb.GeneratedMessage {
  factory SettingsMsg({
    $core.String? trapname,
    $core.String? wifiSsid,
    $core.String? wifiPassword,
    $core.bool? wifiEnabled,
    $core.int? maxSessions,
    $core.double? minScore,
  }) {
    final result = create();
    if (trapname != null) result.trapname = trapname;
    if (wifiSsid != null) result.wifiSsid = wifiSsid;
    if (wifiPassword != null) result.wifiPassword = wifiPassword;
    if (wifiEnabled != null) result.wifiEnabled = wifiEnabled;
    if (maxSessions != null) result.maxSessions = maxSessions;
    if (minScore != null) result.minScore = minScore;
    return result;
  }

  SettingsMsg._();

  factory SettingsMsg.fromBuffer($core.List<$core.int> data, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(data, registry);
  factory SettingsMsg.fromJson($core.String json, [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SettingsMsg', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'trapname')
    ..aOS(2, _omitFieldNames ? '' : 'wifiSsid')
    ..aOS(3, _omitFieldNames ? '' : 'wifiPassword')
    ..aOB(4, _omitFieldNames ? '' : 'wifiEnabled')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'maxSessions', $pb.PbFieldType.O3)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'minScore', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettingsMsg clone() => SettingsMsg()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SettingsMsg copyWith(void Function(SettingsMsg) updates) => super.copyWith((message) => updates(message as SettingsMsg)) as SettingsMsg;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SettingsMsg create() => SettingsMsg._();
  @$core.override
  SettingsMsg createEmptyInstance() => create();
  static $pb.PbList<SettingsMsg> createRepeated() => $pb.PbList<SettingsMsg>();
  @$core.pragma('dart2js:noInline')
  static SettingsMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SettingsMsg>(create);
  static SettingsMsg? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get trapname => $_getSZ(0);
  @$pb.TagNumber(1)
  set trapname($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTrapname() => $_has(0);
  @$pb.TagNumber(1)
  void clearTrapname() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get wifiSsid => $_getSZ(1);
  @$pb.TagNumber(2)
  set wifiSsid($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasWifiSsid() => $_has(1);
  @$pb.TagNumber(2)
  void clearWifiSsid() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get wifiPassword => $_getSZ(2);
  @$pb.TagNumber(3)
  set wifiPassword($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWifiPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearWifiPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.bool get wifiEnabled => $_getBF(3);
  @$pb.TagNumber(4)
  set wifiEnabled($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasWifiEnabled() => $_has(3);
  @$pb.TagNumber(4)
  void clearWifiEnabled() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get maxSessions => $_getIZ(4);
  @$pb.TagNumber(5)
  set maxSessions($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMaxSessions() => $_has(4);
  @$pb.TagNumber(5)
  void clearMaxSessions() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get minScore => $_getN(5);
  @$pb.TagNumber(6)
  set minScore($core.double value) => $_setFloat(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMinScore() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinScore() => $_clearField(6);
}


const $core.bool _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
