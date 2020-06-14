import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/widgets.dart';

class LocalDetailPage extends StatefulWidget {
  @override
  _LocalDetailPageState createState() => _LocalDetailPageState();
}

class _LocalDetailPageState extends State<LocalDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      top: false,
      child: Column(
        children: [
          Container(
            height: 50.0,
            color: ColorPalette.overlay50,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: Spacing.m,
                    right: Spacing.m,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      _buildCloseButton(),
                    ],
                  ),
                ),
                _buildLogo(),
                _buildLocalName(),
                _buildAlertTruckersAround(count: 4),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCloseButton() => InkResponse(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: ColorPalette.grey400, width: 1.0),
          ),
          // child: Icon(Icons.close),),
          child: Icon(Icons.close, size: 24.0),
        ),
      );

  Widget _buildLogo() => RoundImage();

  Widget _buildLocalName() => Padding(
        padding: EdgeInsets.fromLTRB(
          Spacing.mms,
          Spacing.mms,
          Spacing.mms,
          Spacing.m,
        ),
        child: Text(
          'Loja de Conveniência AM/PM Serra Talhada',
          textAlign: TextAlign.center,
        ).h1(),
      );

  Widget _buildAlertTruckersAround({int count}) => Padding(
        padding: EdgeInsets.only(
          left: Spacing.mms,
          right: Spacing.mms,
          bottom: Spacing.m,
        ),
        child: Text('$count amigos caminhoneiros estão aqui agora!')
            .p1(color: ColorPalette.green50),
      );
}
