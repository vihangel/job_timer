import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/login/login_module.dart';
import 'package:job_timer/app/modules/services/auth/auth_service.dart';
import 'package:job_timer/app/modules/services/auth/auth_service_impl.dart';

import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];
}
