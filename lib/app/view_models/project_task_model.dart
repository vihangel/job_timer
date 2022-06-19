import '../entities/project_tasks.dart';

class ProjectTaskModel {
  int? id;
  String name;
  int duration;

  ProjectTaskModel({
    this.id,
    required this.name,
    required this.duration,
  });

  factory ProjectTaskModel.fromEntity(ProjectTask entity) {
    return ProjectTaskModel(
      id: entity.id,
      name: entity.name,
      duration: entity.duration,
    );
  }
}
