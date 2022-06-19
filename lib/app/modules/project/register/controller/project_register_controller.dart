import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/entities/project_status.dart';
import 'package:job_timer/app/modules/services/projects/projects_service.dart';
import 'package:job_timer/app/view_models/project_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterStatus> {
  ProjectsService _projectsService;

  ProjectRegisterController({required ProjectsService projectsService})
      : _projectsService = projectsService,
        super(ProjectRegisterStatus.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterStatus.loading);

      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.emAndamento,
        tasks: [],
      );

      await _projectsService.register(project);
      emit(ProjectRegisterStatus.success);
    } catch (e, s) {
      log('Error ao salvar projeto, error: $e ,stack: $s}');
      emit(ProjectRegisterStatus.failure);
    }
  }
}
