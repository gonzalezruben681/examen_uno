import 'package:examen/provider/catalogo_provider.dart';
import 'package:examen/provider/descripcion_provider.dart';
import 'package:examen/provider/modelo_provider.dart';
import 'package:flutter/material.dart';

import 'package:examen/theme/app_theme.dart';
import 'package:examen/router/app_routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatalogoProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => ModeloProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (context) => DescripcionProvider(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: AppTheme.lightTheme);
  }
}
