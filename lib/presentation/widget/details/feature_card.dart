import 'package:flutter/material.dart';

import '../../../core/locator.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  final String icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: theme.bg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: theme.sBgDark.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Text(
              icon,
              style: const TextStyle(fontSize: 28),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: theme.text,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: theme.textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
