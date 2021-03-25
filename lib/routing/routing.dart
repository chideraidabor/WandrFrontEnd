// import 'package:flutter/material.dart';
// import 'package:wandr_frontend/views/tabs/search.dart';
// import 'package:wandr_frontend/views/pages/Calendar.dart';
// import 'package:wandr_frontend/views/pages/joinEventDailyCalendar.dart';
//
// Route<dynamic> generateRoute(RouteSettings settings){
//     //Getting arguments passed in while calling Navigator.pushNamed
//     final args = settings.arguments;
//
//     switch (settings.name){
//       case'/fullCalender':
//         if(args is String){
//           return MaterialPageRoute(builder: (context) => FullCalendar(settings.arguments),
//           );
//         }
//
//         return _errorRoute();
//       default:
//         return _errorRoute();
//     }
//   }
//
//   Route<dynamic> _errorRoute(){
//     return MaterialPageRoute(builder: (_){
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('ERROR'),
//         )
//       );
//     });
//   }
