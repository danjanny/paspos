import 'package:flutter/material.dart';
import 'package:paspos/route/paspos_router.dart';
import 'package:qlevar_router/qlevar_router.dart';

class PasposApp extends StatelessWidget {
  const PasposApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      routeInformationParser: const QRouteInformationParser(),
      routerDelegate: QRouterDelegate(PasposRouter.routes));
}
