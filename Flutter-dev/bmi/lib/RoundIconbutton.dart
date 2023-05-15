import 'package:flutter/material.dart';
import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  // const RoundIconButton({super.key});

  const RoundIconButton({super.key, this.icon, this.ontap});
  final IconData? icon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: ontap,
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: kFloatButtonColor,
      child: Icon(icon),
    );
  }
}
