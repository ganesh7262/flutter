import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const double bottomBarHeight = 70.0;

const Color defColor = Color(0xFF1D1E33);

const Color bottomBarColor = Color(0xffeb1555);

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: defColor,
                    cardChild:
                        IconsContent(genderIcon: Icons.male, gender: 'MALE'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: defColor,
                    cardChild: IconsContent(
                        genderIcon: Icons.female, gender: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: defColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: defColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: defColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            color: bottomBarColor,
            width: double.infinity,
            height: bottomBarHeight,
          ),
        ],
      ),
    );
  }
}
