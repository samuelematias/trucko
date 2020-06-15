import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/routing/routes.dart';
import 'package:trucko/src/core/theme/spaces/spacing.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  GoogleMapController _mapController;

  void _setMapStyle() async {
    final String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    _setMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(-7.8968268, -34.831139),
              zoom: 12,
            ),
            myLocationEnabled: true,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: Spacing.l),
            child: InkResponse(
              onTap: () => Navigator.pushNamed(
                  context, AppTabNavigatorRoutes.localDetail),
              child: Image(
                image: AssetImage(imgTrucko),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
