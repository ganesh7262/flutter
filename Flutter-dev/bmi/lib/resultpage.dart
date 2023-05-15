import 'package:bmi/constants.dart';
import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key, required this.weight,
      required this.result,
      required this.interpretation});

  final String weight;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'YOUR RESULT',
                  style: kNumberTextStyle.copyWith(fontSize: 25),
                ),
              ),
            ),
            Expanded(
              flex: 12,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      weight,
                      style: kResultTextStyle,
                    ),
                    Text(
                      result,
                      style: kResultBodyWeight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: kResultBodyTextStyle,
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                color: kBottomBarColor,
                width: double.infinity,
                height: kBottomBarHeight,
                child: Center(
                  child: Text(
                    'RE-CALCULATE',
                    style: kNumberTextStyle.copyWith(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
