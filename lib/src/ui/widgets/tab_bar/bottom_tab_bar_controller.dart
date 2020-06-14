import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/assets.dart';
import 'package:trucko/src/core/theme/theme.dart';

import 'package:trucko/src/ui/pages/companies/companies_page.dart';
import 'package:trucko/src/ui/pages/maps/maps_page.dart';
import 'package:trucko/src/ui/pages/rewards/rewards_page.dart';

class BottomTabBarController extends StatefulWidget {
  @override
  _BottomTabBarControllerState createState() => _BottomTabBarControllerState();
}

class _BottomTabBarControllerState extends State<BottomTabBarController> {
  // Properties & Variables needed

  int currentTab = 1; // to keep track of active tab index
  final List<Widget> screens = [
    CompaniesPage(),
    MapsPage(),
    RewardsPage(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MapsPage(); // Our first view in viewport
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        CompaniesPage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        currentTab == 0
                            ? iconMegaphoneActive
                            : iconMegaphoneInactive,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Spacing.s),
                      child: Text(
                        'Campanhas'.toUpperCase(),
                      ).t1(
                        color: currentTab == 0
                            ? ColorPalette.black100
                            : ColorPalette.grey300,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        MapsPage(); // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        currentTab == 1 ? iconMapActive : iconMapInactive,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Spacing.s),
                      child: Text(
                        'Mapa'.toUpperCase(),
                      ).t1(
                        color: currentTab == 1
                            ? ColorPalette.black100
                            : ColorPalette.grey300,
                      ),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        RewardsPage(); // if user taps on this dashboard tab will be active
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: AssetImage(
                        currentTab == 2 ? iconRewardActive : iconRewardInactive,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Spacing.s),
                      child: Text(
                        'Recompensas'.toUpperCase(),
                      ).t1(
                        color: currentTab == 2
                            ? ColorPalette.black100
                            : ColorPalette.grey300,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
