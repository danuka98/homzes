import 'package:flutter/material.dart';
import 'package:homzes/constants/app_colors.dart';

class RatingBadge extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const RatingBadge({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star_border_outlined,
          color: Colors.green,
          size: 20,
        ),
        const SizedBox(width: 4),
        Text(
          rating.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '($reviewCount Reviews)',
          style: TextStyle(
            color: AppColors.textLight,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
