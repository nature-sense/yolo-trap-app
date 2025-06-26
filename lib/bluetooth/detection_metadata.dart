class DetectionMetadata {

  final String session;
  final int detection;
  final int created;
  final int updated;
  final double score;
  final int clazz;
  final int width;
  final int height;

  DetectionMetadata(this.session,
      this.detection,
      this.created,
      this.updated,
      this.score,
      this.clazz,
      this.width,
      this.height);
}

