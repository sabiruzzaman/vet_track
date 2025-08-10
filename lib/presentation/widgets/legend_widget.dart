import 'package:flutter/material.dart';

class LegendItem extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;

  const LegendItem({
    super.key,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: CircleAvatar(
            radius: 5,
            backgroundColor: color,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.labelSmall
            ),
          ],
        ),
      ],
    );
  }
}
