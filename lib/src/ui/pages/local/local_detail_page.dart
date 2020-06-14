import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/widgets.dart';

class LocalDetailPage extends StatefulWidget {
  @override
  _LocalDetailPageState createState() => _LocalDetailPageState();
}

class _LocalDetailPageState extends State<LocalDetailPage> {
  final List<Map<String, dynamic>> truckersAround = [
    {
      "name": "Samuel",
      "photo": "https://i.imgur.com/4kGRWdN.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0f",
      "crown": true,
    },
    {
      "name": "Pedro",
      "photo": "https://i.imgur.com/JKy7cll.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0a",
      "crown": false,
    },
    {
      "name": "Biel",
      "photo": "https://i.imgur.com/JKy7cll.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0b",
      "crown": false,
    },
    {
      "name": "Bolsoni",
      "photo": "https://i.imgur.com/JKy7cll.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0c",
      "crown": false,
    },
    {
      "name": "Barroso",
      "photo": "https://i.imgur.com/JKy7cll.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0c",
      "crown": false,
    },
    {
      "name": "João",
      "photo": "https://i.imgur.com/JKy7cll.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0c",
      "crown": false,
    },
    {
      "name": "Jho n",
      "photo": "https://i.imgur.com/JKy7cll.jpg",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0e",
      "crown": false,
    },
  ];
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
                _buildTruckersAroundList(truckersAround),
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

  Widget _buildLogo() => RoundImage(
        width: 80.0,
        height: 80.0,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/udNKxr0AEaZD6qSrZ7HUnYaHRkH7x38boN3Jzfmri851cJvL9B7MguksjBKuoMxZvtvH4GWgpUUXOGohtRnectXLoax1JJbJFNmSJbGW-was',
      );

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

  Widget _buildTruckersAroundList(List<Map<String, dynamic>> truckersAround) {
    return Container(
      height: 60.0,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: truckersAround.length,
        itemBuilder: (BuildContext context, int index) {
          final trucker = truckersAround.elementAt(index);
          return _buildTruckersAroundListItem(trucker, truckersAround, index);
        },
      ),
    );
  }

  Widget _buildTruckersAroundListItem(
    Map<String, dynamic> trucker,
    List<Map<String, dynamic>> truckersAround,
    int index,
  ) {
    final bool isTheFirstPositionOfArray = index == 0;
    final bool isTheLastPositionOfArray = index + 1 == truckersAround.length;
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: isTheFirstPositionOfArray ? Spacing.l : 0.0,
            right: Spacing.s,
          ),
          child: RoundImage(
            borderColor: ColorPalette.green50,
            widthBorderImage: 3,
            imageUrl: trucker['photo'],
            showBadge: trucker['crown'],
          ),
        ),
        Visibility(
          visible: isTheLastPositionOfArray,
          child: Padding(
            padding: EdgeInsets.only(
              left: isTheFirstPositionOfArray ? Spacing.l : 0.0,
              right: isTheLastPositionOfArray ? Spacing.l : Spacing.s,
            ),
            child: More(
              count: '2',
            ),
          ),
        )
      ],
    );
  }
}
