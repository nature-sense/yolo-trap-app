import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'bluetooth.pb.dart' as bluetooth;
import 'detection_metadata.dart';

NumberFormat sessionFmt = NumberFormat("0000000000");
NumberFormat detectionFmt = NumberFormat("00000");

enum ImageMsgType {
  imageHeader,
  imageSegment,
  unknown
}

enum  SessionMsgType {
  newSession,
  sessionDeleted,
  sessionDetails,
  unknown
}

enum ActiveFlow {
  noFlow(0),
  detectFlow(1),
  previewFlow(2);

  final int value;

  const ActiveFlow(this.value);

  static ActiveFlow fromValue(int value) {
    for(var f in ActiveFlow.values) {
      if(f.value == value) {
        return f;
      }
    }
    return ActiveFlow.noFlow;
  }
}

class TrapState {
  final ActiveFlow activeFlow;
  const TrapState(this.activeFlow);
}

class SessionMessage {
  NewSessionMessage? newSession;
  DeleteSessionMessage? deleteSession;
  SessionDetailsMessage? detailsMessage;

  static SessionMessage fromProto(proto) {
    var sessMsg = SessionMessage();
    var msg = bluetooth.SessionMsg.fromBuffer(proto);
    if(msg.hasNewSession()) {
      sessMsg.newSession = NewSessionMessage(msg.newSession.session);
    } else if(msg.hasDelSession()) {
      sessMsg.deleteSession = DeleteSessionMessage(msg.delSession.session);
    } else if(msg.hasSessDetails()) {
      sessMsg.detailsMessage = SessionDetailsMessage(
          msg.sessDetails.session, msg.sessDetails.detections
      );
    }
    return sessMsg;
  }
}

class NewSessionMessage {
  final String session;
  const NewSessionMessage(this.session);
}

class DeleteSessionMessage {
  final String session;
  const DeleteSessionMessage(this.session);
}

class SessionDetailsMessage {
  final String session;
  final int detections;
  const SessionDetailsMessage(this.session, this.detections);
}

class ImageMessage {
  ImageHeaderMessage? header;
  ImageSegmentMessage? segment;

  static ImageMessage fromProto(proto) {
    var imgMsg = ImageMessage();
    var msg = bluetooth.ImageMsg.fromBuffer(proto);
    if(msg.hasHeader()) {
      imgMsg.header = ImageHeaderMessage(
          msg.header.session,
          msg.header.detection,
          msg.header.width,
          msg.header.height,
          msg.header.segments
      );
    } else if(msg.hasSegment()) {
      imgMsg.segment = ImageSegmentMessage(
        msg.segment.session,
        msg.segment.detection,
        msg.segment.segment,
        msg.segment.data
      );
    }
    return imgMsg;
  }
}

class ImageHeaderMessage {
  final String session;
  final int detection;
  final int width;
  final int height;
  final int segments;
  const ImageHeaderMessage(this.session, this.detection, this.width, this.height, this.segments);
}

class ImageSegmentMessage {
  final String session;
  final int detection;
  final int segment;
  final List<int> data;
  const ImageSegmentMessage(this.session, this.detection, this.segment, this.data);
}

class DetectionsForSessionMessage {
  final String session;
  DetectionsForSessionMessage(this.session);

  Uint8List toProto() {
    var msg = bluetooth.DetectionsForSessionMsg(session: session);
    return msg.writeToBuffer();
  }

  static DetectionsForSessionMessage fromProto(proto) {
    var msg = bluetooth.DetectionReferenceMsg.fromBuffer(proto);
    return DetectionsForSessionMessage(msg.session);
  }
}

class DetectionReferenceMessage {
  final String session;
  final int detection;

  DetectionReferenceMessage(this.session, this.detection);

  Uint8List toProto() {
    var msg = bluetooth.DetectionReferenceMsg(session: session, detection: detection);
    return msg.writeToBuffer();
  }

  static DetectionReferenceMessage fromProto(proto) {
    var msg = bluetooth.DetectionReferenceMsg.fromBuffer(proto);
    return DetectionReferenceMessage(msg.session, msg.detection);
  }
}

class DetectionMetadataMessage {
  final String session;
  final int detection;
  final int created;
  final int updated;
  final double score;
  final int clazz;
  final int width;
  final int height;

  DetectionMetadataMessage(this.session,
      this.detection,
      this.created,
      this.updated,
      this.score,
      this.clazz,
      this.width,
      this.height);

  static DetectionMetadata fromProto(proto) {
    var msg = bluetooth.DetectionMetadataMsg.fromBuffer(proto);
    return DetectionMetadata(
        msg.session,
        msg.detection,
        msg.created.toInt(),
        msg.updated.toInt(),
        msg.score,
        msg.clazz,
        msg.width,
        msg.height);
  }
}

class FrameMessage {

  FrameHeaderMessage? header;
  FrameSegmentMessage? segment;

  static FrameMessage fromProto(proto) {
    var frmMsg = FrameMessage();
    var msg = bluetooth.FrameMsg.fromBuffer(proto);
    if(msg.hasHeader()) {
      frmMsg.header = FrameHeaderMessage(
          msg.header.timestamp.toInt(),
          msg.header.width,
          msg.header.height,
          msg.header.segments
      );
    } else if(msg.hasSegment()) {
      frmMsg.segment = FrameSegmentMessage(
          msg.segment.timestamp.toInt(),
          msg.segment.segment,
          msg.segment.data
      );
    }
    return frmMsg;
  }
}

class FrameHeaderMessage {
  int timestamp;
  int width;
  int height;
  int segments;

  FrameHeaderMessage(this.timestamp, this.width, this.height, this.segments);
}

class FrameSegmentMessage {
  int timestamp;
  int segment;
  final List<int> data;

  FrameSegmentMessage(this.timestamp, this.segment, this.data);
}

class StateMessage {
  final ActiveFlow activeFlow;

  const StateMessage(this.activeFlow);

  static StateMessage fromProto(proto) {
    var msg = bluetooth.StateMsg.fromBuffer(proto);
    return StateMessage(ActiveFlow.fromValue(msg.activeFlow));
  }

  TrapState toTrapState() => TrapState(activeFlow);
}

class SettingsMessage {
  final String trapName;
  final String wifiSsid;
  final String wifiPassword;
  final bool wifiEnabled;
  final int maxSessions;
  final double minScore;

  SettingsMessage(
      this.trapName,
      this.wifiSsid,
      this.wifiPassword,
      this.wifiEnabled,
      this.maxSessions,
      this.minScore
      );

  Uint8List toProto() {
    var msg = bluetooth.SettingsMsg(
        trapname: trapName,
        wifiSsid: wifiSsid,
        wifiPassword: wifiPassword,
        wifiEnabled: wifiEnabled,
        maxSessions: maxSessions,
        minScore: minScore
    );
    return msg.writeToBuffer();
  }

  static SettingsMessage fromProto(proto) {
    var msg = bluetooth.SettingsMsg.fromBuffer(proto);
    return SettingsMessage(
      msg.trapname,
        msg.wifiSsid,
        msg.wifiPassword,
        msg.wifiEnabled,
        msg.maxSessions,
        msg.minScore
    );
  }



}


