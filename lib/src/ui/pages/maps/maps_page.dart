import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/ui/pages/local/local_detail_page.dart';

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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LocalDetailPage()),
            ),
            child: Image(
              image: AssetImage(imgTrucko),
            ),
          ),
        ),
      ],
    );
  }
}
