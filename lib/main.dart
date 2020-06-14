import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trucko/src/core/routing/routes.dart';
import 'package:trucko/src/core/routing/screen_argumentos.dart';
import 'package:trucko/src/ui/pages/companies/companies_detail_page.dart';
import 'package:trucko/src/ui/pages/local/local_detail_page.dart';
import 'package:trucko/src/ui/pages/login/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Transparent statusBar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Trucko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppTabNavigatorRoutes.localDetail:
            return PageTransition(
                child: LocalDetailPage(), type: PageTransitionType.downToUp);
            break;
          case AppTabNavigatorRoutes.companiesDetail:
            final CompaniesDetailPageArguments arguments = settings.arguments;
            return PageTransition(
                child: CompaniesDetailPage(arguments: arguments),
                type: PageTransitionType.downToUp);
            break;
          default:
            return null;
        }
      },
    );
  }
}
