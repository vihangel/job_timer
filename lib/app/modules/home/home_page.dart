import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/entities/project_status.dart';
import '../../entities/project.dart';
import '../../core/ui/database/database.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'home',
      home: Scaffold(
        appBar: AppBar(title: const Text('home')),
        body: Column(
          children: [
            Container(),
            ElevatedButton(
              onPressed: () async {
                final db = Modular.get<Database>();
                final connection = await db.openConnection();

                connection.writeTxn(
                  (isar) {
                    var project = Project();
                    project.name = 'Teste';

                    project.status = ProjectStatus.emAndamento;
                    return connection.projects.put(project);
                  },
                );
              },
              child: Text('Cadastrar'),
            )
          ],
        ),
      ),
    );
  }
}
