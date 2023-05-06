import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_cubit.dart';
import 'package:paspos/module/presentation/manager/login_cubit/login_state.dart';
import 'package:paspos/paspos_app.dart';
import 'package:qlevar_router/qlevar_router.dart';

import 'module/utils/viewport_util.dart';

void main() {
  QR.setUrlStrategy();
  runApp(const PasposApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialApp materialApp = MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );

    return MultiBlocProvider(
        providers: [BlocProvider(create: (ctx) => LoginCubit())],
        child: materialApp);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });

    context.read<LoginCubit>().submit();
  }

  @override
  Widget build(BuildContext context) {
    var viewportUtil = ViewportUtil.getLimitMaxWidthHeight(
        context, 375.0, const Color(0xffE4E4E4));

    return Scaffold(
        body: Center(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: viewportUtil.edgeBorderColor!)),
        constraints: BoxConstraints(
            maxHeight: viewportUtil.maxHeight!,
            maxWidth: viewportUtil.maxWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            BlocBuilder<LoginCubit, LoginState>(builder: (ctx, state) {
              Widget widget;
              if (state is LoadedLoginState) {
                int counters = context.read<LoginCubit>().counter;
                widget = Text(counters.toString());
              } else {
                widget = Container();
              }
              return widget;
            })
          ],
        ),
      ),
    ));
  }
}
