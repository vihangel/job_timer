part of 'home_controller.dart';

enum HomeStatus {
  intitial,
  loading,
  complete,
  failure;
}

class HomeState extends Equatable {
  final List<ProjectModel> projects;
  final HomeStatus status;
  final ProjectStatus projectFilter;

  const HomeState._({
    required this.projects,
    required this.status,
    required this.projectFilter,
  });

  HomeState.initial()
      : this._(
          projects: [],
          status: HomeStatus.intitial,
          projectFilter: ProjectStatus.emAndamento,
        );

  @override
  List<Object?> get props => [projects, status, projectFilter];

  HomeState copyWith({
    List<ProjectModel>? projects,
    HomeStatus? status,
    ProjectStatus? projectFilter,
  }) {
    return HomeState._(
      projects: projects ?? this.projects,
      status: status ?? this.status,
      projectFilter: projectFilter ?? this.projectFilter,
    );
  }
}
