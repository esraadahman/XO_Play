import 'package:flutter/material.dart';
import 'package:xo_play/Core/Routing/routing.dart';
import 'package:xo_play/Core/Theming/colors/colors.dart';
import 'package:xo_play/Core/Theming/decoration/decoration.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';
import 'package:xo_play/Core/Theming/size/size.dart';
import 'package:xo_play/View/Computer/Ui/page/computer.dart';
import 'package:xo_play/View/Friend/Ui/page/friend.dart';
import 'package:xo_play/View/welcome/Ui/widgets/buttonWidget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: size.heightMedia(context, 1),
        width: size.widthMedia(context, 1),
        decoration: CustomDecoration.decorationForCenterContainer(),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "XO GAME",
                style: styling.maintitle.copyWith(fontSize: 55),
              ),
              size.height(20),
              Text(
                "TIC TAC TOE",
                style: styling.subtitle
                    .copyWith(fontSize: 20, color: ColorsClass.sub_primary),
              ),
              size.height(40),
              CircleAvatar(
                  radius: 175,
                  backgroundColor: ColorsClass.sub_primary,
                  child: Image.asset(
                    "assets/images/xo.png",
                    height: 290,
                  )),
              size.height(40),
              buttonwidget(
                ontap: () {
                  context.navigateTo(const FriendScreen());
                },
                text: "Play  VS  Friend",
              ),
              size.height(20),
              buttonwidget(
                ontap: () {
                  context.navigateTo(const ComputerScreen());
                },
                text: "Play VS Computer",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
