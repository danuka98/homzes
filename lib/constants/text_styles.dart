import 'package:flutter/material.dart';
import 'package:homzes/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle subheading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textDark,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: AppColors.textDark,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 12,
    color: AppColors.textLight,
  );

  static const TextStyle price = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle viewAll = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  );
}
