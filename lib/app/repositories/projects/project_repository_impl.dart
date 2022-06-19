import 'dart:developer';

import 'package:isar/isar.dart';

import '../../core/exceptions/failure.dart';
import '../../core/ui/database/database.dart';
import '../../entities/project.dart';
import './project_repository.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final Database _database;

  ProjectRepositoryImpl({required Database database}) : _database = database;

  @override
  Future<void> register(Project project) async {
    try {
      final connection = await _database.openConnection();

      await connection.writeTxn(
        (isar) {
          return isar.projects.put(project);
        },
      );
    } on IsarError catch (e, s) {
      log('Erro ao cadastrar projeto, error: $e, stack: $s');
      throw Failure(message: 'Erro ao cadastrar projeto');
    }
  }
}
