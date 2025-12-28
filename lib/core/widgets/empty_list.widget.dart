import 'package:flutter/material.dart';
import 'package:pokemon/core/resources/export.resources.dart';
import 'package:pokemon/core/widgets/export.widgets.dart';

class EmptyListUi extends StatelessWidget {
  const EmptyListUi({super.key, this.topMargin, required this.message});

  final EdgeInsets? topMargin;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: topMargin ?? EdgeInsets.only(top: 78),
        width: double.infinity,
        child: Padding(
          padding: baseViewPaddingBig,
          child: Column(
            children: [
              TextUi.onBoardingTitle(message,
                textAlign: TextAlign.center,
                style: onBoardingTitle.copyWith(
                    fontSize: 16,
                    fontWeight: regularText,
                    color: black800
                ),
              ),
              Gap(7),
              TextUi.onBoardingTitle('Your history would show here when you\ntransact on the app',
                  textAlign: TextAlign.center,
                  style: onBoardingTitle.copyWith(
                      fontSize: 12,
                      height: 1.4,
                      letterSpacing: 0
                  )),
            ],
          ),
        )
    );
  }
}