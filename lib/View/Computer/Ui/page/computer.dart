import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xo_play/Core/Theming/decoration/decoration.dart';
import 'package:xo_play/Core/Theming/fonts/fonts.dart';
import 'package:xo_play/Core/Theming/size/size.dart';
import 'package:xo_play/View/Computer/cubit/cubit/computer_cubit.dart';
import 'package:xo_play/View/Friend/Ui/widgets/PlayerScoreWidget.dart';
import 'package:xo_play/View/Friend/Ui/widgets/alertWidget.dart';
import 'package:xo_play/View/Friend/Ui/widgets/containetOfPlay.dart';
import 'package:xo_play/View/Friend/Ui/widgets/scoreWidget.dart';
import 'package:xo_play/View/Friend/Ui/widgets/appbar_Widget.dart';

class ComputerScreen extends StatefulWidget {
  const ComputerScreen({super.key});

  @override
  State<ComputerScreen> createState() => _ComputerScreenState();
}

class _ComputerScreenState extends State<ComputerScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ComputerCubit(),
      child: BlocConsumer<ComputerCubit, ComputerState>(
        listener: (context, state) {
          if (state is ComputerHaveWinner) {
            showDialog(
              context: context,
              // Prevent closing dialog by tapping outside
              barrierDismissible: false,
              builder: (BuildContext context) {
                // Use a timer to close the dialog automatically
                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.of( context)
                      .pop(); // Close the dialog after 3 seconds
                  context
                      .read<ComputerCubit>()
                      .ResetFunction(); // Reset game state
                });

                return AlertWidget(
                  text: state.winner,
                );
              },
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ComputerCubit>(context);
          return Scaffold(
            body: Container(
              height: size.heightMedia(context, 1),
              width: size.widthMedia(context, 1),
              decoration: CustomDecoration.decorationForCenterContainer(),
              child: SafeArea(
                child: Column(
                  children: [
                    AppbarWidget(
                      text: "Computer",
                      ontap: () {
                        setState(() {
                          cubit.ResetFunction();
                        });
                      },
                    ),
                    size.height(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PlayerScoreWidget(
                          score: '${cubit.xSocre}',
                          charis: 'X',
                          your_turn: true,
                        ),
                        ScoreWidget(
                          score: '${cubit.drawScore}',
                        ),
                        PlayerScoreWidget(
                          score: '${cubit.oScore}',
                          charis: 'O',
                          your_turn: false,
                        )
                      ],
                    ),
                    size.height(15),
                    Text(
                      "Now Time For X",
                      style: styling.maintitle
                          .copyWith(fontFamily: 'second', fontSize: 22),
                    ),
                    size.height(20),
                    SizedBox(
                      width: size.widthMedia(context, .98),
                      height: size.widthMedia(context, 1),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0),
                        itemCount: cubit.sq.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                cubit.ClickContainer(index);
                              });
                            },
                            child: ContainerOfPlay(
                              text: cubit.sq[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
