import 'package:flutter/material.dart';
import '../Components/task_card_meta.dart';


class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String pictureName;
  final String priority;
  final String status;
  final String createdOn;
  final int rowsToDisplay;
  final bool isSelected;

  const TaskCard({
    Key? key,
    required this.title,
    required this.description,
    required this.pictureName,
    required this.priority,
    required this.status,
    required this.createdOn,
    this.rowsToDisplay = 4,
    this.isSelected = false,
     
  }) : super(key:key);

  String get _normalizedStatus => status.trim().toLowerCase();
  Color get _defaultStatusColor => Color(0xFFF21E1E);
  Color get _backgroundClr => isSelected ? Color(0xFFA1A3AB).withAlpha(17) : Color(0xFFF5F8FF);
  Color get _statusColor => switch (_normalizedStatus) {
        'completed' => const Color(0xFF05A301),
        'in progress' => const Color(0xFF0225FF),
        'not started' => _defaultStatusColor,
        _ => _defaultStatusColor, 
      };
  


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 460, maxHeight: 166),
      padding: const EdgeInsets.fromLTRB(14, 8, 32, 8),
      decoration: BoxDecoration(
        color: _backgroundClr,
        border: Border.all(color: const Color(0xFFA1A3AB)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            // margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: _statusColor,
                width: 2,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF192252),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz_outlined,
                        color: Color(0xFF848FAC),
                      ),
                      splashRadius: 14,
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        maxLines: rowsToDisplay,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14,
                          color: Color(0xFF848FAC),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        pictureName,
                        width: 88,
                        height: 88,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: TaskCardMeta(label: "Priority:", value: priority,valueColor: Color(0xFF42ADE2)),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TaskCardMeta(label: "Status:", value: status, valueColor: _statusColor),
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: TaskCardMeta(label: "Created:", value: createdOn,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}