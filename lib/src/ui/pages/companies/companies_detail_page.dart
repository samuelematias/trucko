import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/routing/screen_argumentos.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/widgets.dart';

class CompaniesDetailPage extends StatefulWidget {
  final CompaniesDetailPageArguments arguments;

  const CompaniesDetailPage({
    Key key,
    @required this.arguments,
  }) : super(key: key);
  @override
  _CompaniesDetailPageState createState() => _CompaniesDetailPageState();
}

class _CompaniesDetailPageState extends State<CompaniesDetailPage> {
  List<Map<String, dynamic>> campaign;
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

  // final List<Map<String, dynamic>> campaign = [
  //   {
  //     "photo": imgCompanies1,
  //     "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0f",
  //   },
  //   {
  //     "photo": imgCompanies2,
  //     "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0a",
  //   },
  // ];

  void _getValues() {
    if (widget.arguments.value == 1) {
      setState(() {
        campaign = [
          {
            "photo": "https://i.imgur.com/nsd9N0E.png",
            "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0f",
            "title": "Campanha de Vacinação COVID-19",
            "about":
                "O Ministério da Saúde incluiu caminhoneiros, motoristas de transportes coletivo e trabalhadores portuários na segunda fase da Campanha Nacional de Vacinação contra a Gripe, que começa no dia 16 de abril. As três categorias se juntam ao grupo prioritário que também contempla doentes crônicos e profissionais das forças de segurança e salvamento. O anúncio da inclusão dos caminhoneiros, motoristas de transporte coletivo e portuários foi feito na última segunda-feira (30/3) pelos ministros da Saúde, Luiz Henrique Mandetta, e da Infraestrutura, Tarcísio Gomes de Freitas.",
            "information": [
              {
                "icon": iconLocationBlue,
                "label": "Dirija até um posto de vacinação",
              },
              {
                "icon": iconOk,
                "label": "Tome a vacina do COVID-19",
              },
              {
                "icon": iconGiftRed,
                "label": "Ganhe 50 pontos",
              },
            ]
          },
        ];
      });
    } else {
      setState(() {
        campaign = [
          {
            "photo": "https://i.imgur.com/J6iztQz.png",
            "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0f",
            "title": "Venha tomar seu cafézinho num posto Ipiranga",
            "about":
                "Na compra de um café Nespresso, nossos queridos caminhoneiros compram um salgado de sua preferência pela METADE do preço e ainda ganham 30 pontos no aplicativo! Na compra de um café Nespresso, nossos queridos caminhoneiros compram um salgado de sua preferência pela METADE do preço e ainda ganham 30 pontos no aplicativo!",
            "information": [
              {
                "icon": iconLocationBlue,
                "label": "Dirija até um Posto Ipiranga",
              },
              {
                "icon": iconOk,
                "label": "Compre um combo café expresso + pão de queijo",
              },
              {
                "icon": iconGiftRed,
                "label": "Ganhe 50 pontos",
              },
            ]
          },
        ];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getValues();
  }

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
          Stack(
            children: <Widget>[
              _buildLogo(),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  Spacing.m,
                  Spacing.ss,
                  Spacing.m,
                  Spacing.m,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildBackButton(),
                    _buildCloseButton(),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLocalName(),
                  _buildAlertTruckersAround(count: 327),
                  _buildTruckersAroundList(truckersAround),
                  _buildInformationBoxList(),
                  _buildAboutCampaign(),
                  _buildButtons(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBackButton() => InkResponse(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: ColorPalette.white50,
            shape: BoxShape.circle,
            border: Border.all(color: ColorPalette.grey400, width: 1.0),
          ),
          child: Icon(Icons.arrow_back, size: 24.0),
        ),
      );

  Widget _buildCloseButton() => InkResponse(
        onTap: () => Navigator.of(
          context,
          rootNavigator: true,
        ).pushAndRemoveUntil(
          PageTransition(
              child: BottomTabBarController(), type: PageTransitionType.fade),
          (Route<dynamic> route) => false,
        ),
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: ColorPalette.white50,
            shape: BoxShape.circle,
            border: Border.all(color: ColorPalette.grey400, width: 1.0),
          ),
          child: Icon(Icons.close, size: 24.0),
        ),
      );

  Widget _buildLogo() => Image(
        image: CachedNetworkImageProvider(
          '${campaign[0]["photo"]}',
        ),
      );

  Widget _buildLocalName() => Padding(
        padding: EdgeInsets.fromLTRB(
          Spacing.mms,
          Spacing.mms,
          Spacing.mms,
          Spacing.m,
        ),
        child: Text(
          '${campaign[0]["title"]}',
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
              count: '320',
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAboutCampaign() => Padding(
        padding:
            EdgeInsets.fromLTRB(Spacing.ms, Spacing.l, Spacing.ms, Spacing.lls),
        child: Row(
          children: [
            Flexible(
              child: Text(
                '${campaign[0]["about"]}',
              ).p2(color: ColorPalette.grey100),
            ),
          ],
        ),
      );

  Widget _buildInformationBoxList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: campaign[0]["information"].length,
      itemBuilder: (BuildContext context, int index) {
        final camp = campaign[0]["information"].elementAt(index);
        return _buildInformationBoxListItem(
            camp, campaign[0]["information"], index);
      },
    );
  }

  Widget _buildInformationBoxListItem(
    Map<String, dynamic> camp,
    List<Map<String, dynamic>> campaign,
    int index,
  ) {
    final bool isTheFirstPositionOfArray = index == 0;
    return Padding(
      padding: EdgeInsets.only(
        left: Spacing.mms,
        top: isTheFirstPositionOfArray ? 0.0 : Spacing.ms,
        right: Spacing.mms,
      ),
      child: InformationBox(
        label: camp["label"],
        iconLeft: camp["icon"],
      ),
    );
  }

  Widget _buildButtons() => Padding(
        padding: EdgeInsets.only(
          left: Spacing.mms,
          right: Spacing.mms,
          bottom: Spacing.ms,
        ),
        child: Column(
          children: <Widget>[
            SecondaryButton(
              label: 'COMPARTILHAR',
              onPressed: () => _buildBuyByCode(),
              iconLeft: iconWhatsapp,
              showIconLeft: true,
            ),
            SizedBox(
              height: 12.0,
            ),
            PrimaryButton(
                label: 'RESGATAR', onPressed: () => _buildRedeemCode())
          ],
        ),
      );

  Widget _buildCompanyLogo() => RoundImage(
        width: 80.0,
        height: 80.0,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/udNKxr0AEaZD6qSrZ7HUnYaHRkH7x38boN3Jzfmri851cJvL9B7MguksjBKuoMxZvtvH4GWgpUUXOGohtRnectXLoax1JJbJFNmSJbGW-was',
      );

  void _showModalBottomSheet({@required Widget child}) => showModalBottomSheet(
        backgroundColor: ColorPalette.transparent,
        context: context,
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: ColorPalette.white50,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
          ),
          child: child,
        ),
      );

  void _buildRedeemCode() => _showModalBottomSheet(
        child: Padding(
          padding: EdgeInsets.only(
            left: Spacing.mms,
            right: Spacing.mms,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: Spacing.mms,
                    ),
                    child: _buildCompanyLogo(),
                  ),
                  Text(
                    '${campaign[0]["title"]}',
                    textAlign: TextAlign.center,
                  ).h2(),
                ],
              ),
              PrimaryButton(
                  label: 'RESGATAR', onPressed: () => Navigator.pop(context)),
              Text('CANCELAR').h2(color: ColorPalette.grey100),
            ],
          ),
        ),
      );

  void _buildBuyByCode() => _showModalBottomSheet(
        child: Padding(
          padding: EdgeInsets.only(
            left: Spacing.mms,
            right: Spacing.mms,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  bottom: Spacing.mms,
                ),
                child: Text(
                  'Gastar 100 pontos para resgatar cupom de R\$200 reais de combustível no posto Ipiranga?',
                  textAlign: TextAlign.center,
                ).p1(fontWeight: FontWeight.bold),
              ),
              PrimaryButton(
                  label: 'COMPRAR', onPressed: () => Navigator.pop(context)),
              Text('CANCELAR').h2(color: ColorPalette.grey100),
            ],
          ),
        ),
      );
}
