import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wandr_frontend/blocs/tab/tabBloc.dart';
import 'package:wandr_frontend/routes.dart';
import 'package:wandr_frontend/views/pages/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB),
      ),
      routes: {
        WandrRoutes.home: (context) {
          return MultiBlocProvider(providers: [
            BlocProvider<TabBloc>(
              create: (context) => TabBloc(),
            )
          ], child: HomePage());
        }
      },
    );
  }
}
