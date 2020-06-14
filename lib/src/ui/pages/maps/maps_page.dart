import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/routing/routes.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: InkResponse(
            onTap: () =>
                Navigator.pushNamed(context, AppTabNavigatorRoutes.localDetail),
            child: Image(
              image: AssetImage(imgTrucko),
            ),
          ),
        ),
      ],
    );
  }
}
