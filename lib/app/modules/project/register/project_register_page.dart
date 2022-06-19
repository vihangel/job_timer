import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import 'controller/project_register_controller.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;

  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _estimateEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _estimateEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Criar novo projeto',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nameEC,
                decoration: const InputDecoration(
                  label: Text('Nome do projeto'),
                ),
                validator: Validatorless.required('Nome obrigatório'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _estimateEC,
                decoration: const InputDecoration(
                  label: Text('Estimativa de horas'),
                ),
                validator: Validatorless.multiple([
                  Validatorless.required('Horas obrigatória'),
                  Validatorless.number('Permitido somente números')
                ]),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 49,
                child: ElevatedButton(
                  onPressed: () async {
                    final formValid =
                        _formKey.currentState?.validate() ?? false;
                    if (formValid) {
                      final name = _nameEC.text;
                      final estimate = int.parse(_estimateEC.text);

                      await widget.controller.register(name, estimate);
                    }
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
