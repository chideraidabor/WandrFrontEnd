import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wandr_frontend/blocs/tab/tabBloc.dart';
import 'package:wandr_frontend/controllers/eventController.dart';
import 'package:wandr_frontend/routes.dart';
import 'package:wandr_frontend/views/pages/homePage.dart';
import 'package:wandr_frontend/views/pages/login_screen.dart';
import 'package:wandr_frontend/views/pages/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => EventController(),
          ),
        ],
        child: MaterialApp(
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
            },
            WandrRoutes.login: (context) {
              return LoginScreen();
            }
          },
          initialRoute: WandrRoutes.login,
        ));
  }
}
