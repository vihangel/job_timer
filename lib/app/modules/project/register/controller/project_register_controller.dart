import 'package:bloc/bloc.dart';
import 'package:job_timer/app/modules/services/projects/projects_service.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectsService _projectsService;

  ProjectRegisterController({required ProjectsService projectsService})
      : _projectsService = projectsService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    emit(ProjectRegisterStatus.loading);
  }
}
