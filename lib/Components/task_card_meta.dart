import 'package:flutter/material.dart';

class TaskCardMeta extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const TaskCardMeta({
    Key? key,
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF747474),
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: "Inter",
              fontSize: 10,
              color: Color(0xFF000000),
            ),
          ),
          const SizedBox(width: 2),
          Flexible(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 10,
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}