import 'package:flutter/material.dart';
import 'package:homzes/components/price_tag.dart';
import 'package:homzes/constants/app_colors.dart';
import 'package:homzes/models/property.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final double width;
  final double height;
  final bool showFavorite;
  final VoidCallback? onTap;

  const PropertyCard({
    super.key,
    required this.property,
    this.width = 150,
    this.height = 150,
    this.showFavorite = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    property.imageUrl,
                    width: width,
                    height: height,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: PriceTag(price: property.price),
                ),
                if (showFavorite)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        property.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: property.isFavorite ? Colors.red : Colors.grey,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              property.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            if (property.subtitle.isNotEmpty)
              Text(
                property.subtitle,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textLight,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
