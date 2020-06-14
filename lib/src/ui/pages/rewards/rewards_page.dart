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
      "category": "Combustível",
      "items": [
        {"id": "1", "points": 100, "img": imgCompanies1},
        {"id": "2", "points": 80, "img": imgCompanies1},
        {"id": "3", "points": 100, "img": imgCompanies1}
      ]
    },
    {
      "category": "Mecânico e autopeças",
      "items": [
        {"id": "4", "points": 100, "img": imgCompanies1},
        {"id": "5", "points": 100, "img": imgCompanies1},
        {"id": "6", "points": 100, "img": imgCompanies1}
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
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                  Column(
                    children: [
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
                            _buildRewardsTitle(),
                          ],
                        ),
                      ),
                      _buildCompanies(rewards[0]),
                      _buildCompanies(rewards[1])
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildRewardsTitle() => Container(
      margin: const EdgeInsets.only(top: Spacing.l),
      alignment: Alignment.centerLeft,
      child: Text(
        "Benefícios disponíveis",
        textAlign: TextAlign.left,
      ).h2(color: ColorPalette.black100));

  Widget _buildCompanies(Map<String, dynamic> rewards) => Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(
              Spacing.m,
              Spacing.mms,
              Spacing.mms,
              Spacing.m,
            ),
            child: Text(
              '${rewards["category"]}',
            ).p1(),
          ),
          Row(
            children: [
              _buildCompaniesList(rewards["items"]),
            ],
          ),
        ],
      );

  Widget _buildCompaniesList(List<Map<String, dynamic>> rewardsList) =>
      Expanded(
        child: Container(
          height: 220.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: rewardsList.length,
            itemBuilder: (BuildContext context, int index) {
              final reward = rewardsList.elementAt(index);
              return Container(
                  alignment: Alignment.centerLeft,
                  child: _buildCompaniesListItem(reward, rewardsList, index));
            },
          ),
        ),
      );

  Widget _buildCompaniesListItem(
    Map<String, dynamic> reward,
    List<Map<String, dynamic>> rewardsList,
    int index,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        right: Spacing.m,
        left: Spacing.m,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                child: Image(
                  image: AssetImage(reward['img']),
                ),
              ),
              Positioned(
                  left: 8,
                  top: 8,
                  child: Container(
                      padding: EdgeInsets.all(
                        Spacing.s,
                      ),
                      decoration: BoxDecoration(
                          color: ColorPalette.grey50,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        "${reward["points"]} pts",
                        textAlign: TextAlign.center,
                      ).h2(color: ColorPalette.black100))),
            ],
          ),
          Container(
            width: 140.0,
            padding: EdgeInsets.only(
              top: Spacing.mms,
            ),
            child: PrimaryButton(label: 'COMPRAR', onPressed: () {}),
          )
        ],
      ),
    );
  }

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
                  child: Column(
                    children: [
                      Text(
                        "Convide seus amigos caminhoneiros e ganhe muitos pontos!",
                        textAlign: TextAlign.left,
                      ).p1(color: ColorPalette.black100),
                    ],
                  ))),
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
                        left: Spacing.l,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${trucker["name"]}")
                                .h1(color: ColorPalette.black100),
                            Visibility(
                                visible: trucker["crown"],
                                child: Text("Embaixador ${trucker["level"]}")
                                    .h2(color: ColorPalette.red100))
                          ])),
                ],
              ),
            ),
          ],
        ),
      );
}
