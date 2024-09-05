import 'package:flutter/material.dart';
import 'package:taskder/constants.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final int severity;
  final void Function(bool?) checkboxCallback;
  final void Function() deleteCallback;
  static final List<Color> colors = [
    const Color(0xFF62B899),
    const Color(0xFFDFCF78),
    const Color(0xFFBF5858)
  ];

  const TaskTile({
    super.key,
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.deleteCallback,
    required this.severity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: deleteCallback,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: kDarkGreyColor,
            width: 4,
            strokeAlign: -1,
          ),
          color: kLightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        height: 60,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: kDarkGreyColor,
                  width: 4,
                  strokeAlign: 0,
                ),
                color: colors[severity],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: TextStyle(
                    decoration: (isChecked)
                        ? (TextDecoration.lineThrough)
                        : (TextDecoration.none),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                const Text('time will be displayed here'),
              ],
            ),
            Expanded(child: Container()),
            Checkbox(
              value: isChecked,
              activeColor: colors[severity],
              checkColor: colors[severity],
              shape: const CircleBorder(),
              onChanged: checkboxCallback,
            ),
          ],
        ),
      ),
    );
  }
}
