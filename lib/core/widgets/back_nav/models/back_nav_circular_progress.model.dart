part of 'export.models.dart';

class CircularProgressModel {
  final double progress;
  final double level;

  CircularProgressModel(this.progress, this.level);

  @override
  String toString() {
    return 'CircularProgressModel{progress: $progress, level: $level}';
  }
}