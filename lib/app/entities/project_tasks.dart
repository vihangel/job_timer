import 'package:isar/isar.dart';

part 'project_tasks.g.dart';

@Collection()
class ProjectTask {
  @Id()
  int? id;
  late String name;
  late int duration;
  late DateTime created = DateTime.now();
}
