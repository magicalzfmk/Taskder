import 'package:flutter/material.dart';
import 'package:taskder/constants.dart';

class FloatingSegmentedButton extends StatelessWidget {
  const FloatingSegmentedButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 80,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildButton(context, 'home'),
            SizedBox(width: 5.0),
            _buildButton(context, 'tasks'),
            SizedBox(width: 5.0),
            _buildButton(context, 'notes'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label) {
    return Expanded(
      child: InkWell(
        onTap: () {
          switch (label) {
            case 'home':
              Navigator.of(context).pushReplacementNamed('/home');
              break;
            case 'tasks':
              Navigator.of(context).pushReplacementNamed('/tasks');
              break;
            case 'notes':
              Navigator.of(context).pushReplacementNamed('/notes');
              break;
          }
        },
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              color: kDarkGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(50.0))),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(label.toUpperCase(),
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Inconsolata",
                      color: kLightGreyColor,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
