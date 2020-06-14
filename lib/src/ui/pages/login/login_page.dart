import 'package:flutter/material.dart';
import 'package:trucko/src/core/constants/assets/images.dart';
import 'package:trucko/src/core/theme/theme.dart';
import 'package:trucko/src/ui/widgets/tab_bar/bottom_tab_bar_controller.dart';
import 'package:trucko/src/ui/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      appBar: null,
      body: _buildBody(),
    );
  }

  Widget _buildBody() => SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacing.ms),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(trucko),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Spacing.xl),
                child: PrimaryButton(
                  label: 'ENTRAR COM FACEBOOK',
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomTabBarController()),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
