import 'package:flutter/material.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/widgets.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';

class RewardsPage extends StatefulWidget {
  @override
  _RewardsPageState createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  final Map<String, dynamic> trucker = {
    "name": "Valdisley Matos",
    "photo": "https://i.imgur.com/4kGRWdN.jpg",
    "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0f",
    "crown": true,
    "level": "Ouro",
    "points": 2032
  };

  final List<Map<String, Object>> rewards = [
    {
      "category": "Combust[ivel",
      "items": [
        {"id": "1", "points": 100, "img": "https://i.imgur.com/4kGRWdN.jpg"},
        {"id": "2", "points": 80, "img": "https://i.imgur.com/4kGRWdN.jpg"},
        {"id": "3", "points": 100, "img": "https://i.imgur.com/4kGRWdN.jpg"}
      ]
    },
    {
      "category": "Mecânico e autopeças",
      "items": [
        {"id": "4", "points": 100, "img": "https://i.imgur.com/4kGRWdN.jpg"},
        {"id": "5", "points": 100, "img": "https://i.imgur.com/4kGRWdN.jpg"},
        {"id": "6", "points": 100, "img": "https://i.imgur.com/4kGRWdN.jpg"}
      ]
    }
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
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(imgTrucko),
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(
                      left: Spacing.m,
                      right: Spacing.m,
                    ),
                    child: Column(
                      children: [
                        _profileContainer(trucker),
                        _pointsContainer(points: trucker["points"]),
                        _whatsContainer(),
                        _buildRewards(rewards)
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRewards(List<Map<String, Object>> rewards) =>
      Text("Benefícios disponíveis").h2(color: ColorPalette.black100);

  Widget _whatsContainer() => Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(Spacing.m),
                  margin: const EdgeInsets.only(top: Spacing.m),
                  decoration: BoxDecoration(
                      color: ColorPalette.grey50,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    "Convide seus amigos caminhoneiros e ganhe muitos pontos!",
                    textAlign: TextAlign.left,
                  ).p1(color: ColorPalette.black100))),
        ],
      );

  Widget _pointsContainer({int points}) => Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.all(Spacing.m),
                  margin: const EdgeInsets.only(top: Spacing.m),
                  decoration: BoxDecoration(
                      color: ColorPalette.grey50,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: Text(
                    "$points pontos",
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.4,
                  ).h1(color: ColorPalette.black100))),
        ],
      );

  Widget _profileContainer(Map<String, dynamic> trucker) => Container(
        padding: const EdgeInsets.only(top: Spacing.l),
        child: Row(
          children: [
            RoundImage(
              width: 64.0,
              height: 64.0,
              badgeScale: 3,
              showBadge: trucker["crown"],
              imageUrl: trucker["photo"],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: Spacing.m,
                    ),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(children: [
                          Text("${trucker["name"]}")
                              .h1(color: ColorPalette.black100),
                          Visibility(
                              visible: trucker["crown"],
                              child: Text("Embaixador ${trucker["level"]}")
                                  .p1(color: ColorPalette.red100))
                        ])),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}
