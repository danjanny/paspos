import 'package:paspos/module/presentation/pages/login_page.dart';
import 'package:qlevar_router/qlevar_router.dart';

class PasposRouter {
  static String loginPath = "/login-page";
  static String rootPath = "/";

  static final routes = [
    QRoute(path: loginPath, builder: () => const LoginPage()),
    QRoute(path: rootPath, builder: () => const LoginPage())
  ];
}
