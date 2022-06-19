import 'package:job_timer/app/repositories/projects/project_repository.dart';
import 'package:job_timer/app/view_models/project_model.dart';

import '../../../entities/project.dart';
import './projects_service.dart';

class ProjectsServiceImpl implements ProjectsService {
  final ProjectRepository _projectRepository;

  ProjectsServiceImpl({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  @override
  Future<void> register(ProjectModel projectModel) async {
    final project = Project()
      ..id = projectModel.id
      ..name = projectModel.name
      ..estimate = projectModel.estimate
      ..status = projectModel.status;

    await _projectRepository.register(project);
  }
}
