import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/widgets.dart';

class CompaniesPage extends StatefulWidget {
  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  final List<Map<String, dynamic>> campaigns = [
    {
      "title": "Campanha de Vacinação COVID-19",
      "photo": "https://i.imgur.com/6blTHgJ.png",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0f",
      "date": "Até 21/06/21",
      "place": "236 estabelecimentos",
      "company": "https://i.imgur.com/6blTHgJ.png"
    },
    {
      "title": "Venha tomar seu cafézinho num posto Ipiranga",
      "photo": "https://i.imgur.com/tIk9bnr.png",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0a",
      "date": "Até 21/06/21",
      "place": "157 estabelecimentos",
      "company": "https://i.imgur.com/tIk9bnr.png",
    },
    {
      "title": "Venhar participar da Fenatran 2019!",
      "photo": "https://i.imgur.com/bOOewKz.png",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0b",
      "date": "Até 21/06/21",
      "place": "1 estabelecimentos",
      "company": "https://i.imgur.com/bOOewKz.png",
    },
    {
      "title": "Venha na RM Motors e conheça o novo Mercerdes Actros 2020",
      "photo": "https://i.imgur.com/wT91EyI.png",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0c",
      "date": "Até 21/06/21",
      "place": "400 estabelecimentos",
      "company": "https://i.imgur.com/wT91EyI.png",
    },
    {
      "title": "Faça sua troca de óleo conosco e manutenção preventiva",
      "photo": "https://i.imgur.com/VT80Fj4.png",
      "id": "6d579be3-68b8-454f-9a5f-f7b3aaed1a0c",
      "date": "Até 21/06/21",
      "place": "7 estabelecimentos",
      "company":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSkccf1AbwGseavrFgLnBeRtR7zaaTgo_nug6KYDovimTtogSZK&usqp=CAU",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() => SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: Spacing.m),
                child: Image(
                  image: AssetImage(imgTrucko),
                ),
              ),
            ),
            Expanded(
              child: _buildCampaignsList(),
            )
          ],
        ),
      );
  Widget _buildCampaignsList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.s),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: campaigns.length,
        itemBuilder: (BuildContext context, int index) {
          final campaign = campaigns.elementAt(index);
          return _buildCampaignsListItem(campaign, campaigns, index);
        },
      ),
    );
  }

  Widget _buildCampaignsListItem(
    Map<String, dynamic> campaign,
    List<Map<String, dynamic>> campaigns,
    int index,
  ) {
    final String dateAndPlace = '${campaign["date"]}\n${campaign["place"]}';
    return ListTile(
      leading: Image(
        image: CachedNetworkImageProvider(campaign["photo"]),
      ),
      title: Text(campaign["title"]).p1(),
      subtitle: Text(dateAndPlace).p1(color: ColorPalette.grey100),
      trailing: RoundImage(
        imageUrl: campaign["company"],
        width: 32.0,
        height: 32.0,
      ),
    );
  }
}
