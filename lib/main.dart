import 'package:ecomik/utils/app_routes.dart';
import 'package:ecomik/utils/constants/app_page_names.dart';
import 'package:ecomik/utils/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EcomikUserApp());
}

class EcomikUserApp extends StatelessWidget {
  const EcomikUserApp({Key? key}) : super(key: key);

  // This widget is the root of this app.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecomik',
      onGenerateRoute: AppRouteGenerator.generateRoute,
      initialRoute: AppPageNames.rootScreen,
      // home: TempScreen(),
      theme: AppThemeData.appThemeData,
    );
  }
}
