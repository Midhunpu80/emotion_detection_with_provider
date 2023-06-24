import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtbe/controller/procontroller.dart';
import 'package:youtbe/view/Home.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(  
    MultiProvider(
    
      providers: [ChangeNotifierProvider<procontrolller>(create: (_) => procontrolller())],
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          body: Home(),
        ));
  }
}
