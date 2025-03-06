import 'package:flutter/material.dart';
import 'package:homzes/components/rating_badge.dart';
import 'package:homzes/constants/text_styles.dart';
import 'package:homzes/models/property.dart';

class NewOffersSection extends StatelessWidget {
  final List<Property> properties;
  final VoidCallback onViewAllPressed;
  final bool isLoading;

  const NewOffersSection({
    super.key,
    required this.properties,
    required this.onViewAllPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'New offers',
                style: AppTextStyles.sectionTitle,
              ),
              TextButton(
                onPressed: onViewAllPressed,
                child: const Text(
                  'View all',
                  style: AppTextStyles.viewAll,
                ),
              ),
            ],
          ),
        ),

        // New offers list
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: properties.length,
          itemBuilder: (context, index) {
            final property = properties[index];
            return isLoading
                ? Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 160,
                    height: 230,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              property.imageUrl,
                              width: double.infinity,
                              height: 230,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '\$ ${property.price.toInt()}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 18,
                            right: 18,
                            child: Icon(
                              property.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: property.isFavorite
                                  ? Colors.red
                                  : Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property.title,
                            style: AppTextStyles.subheading,
                          ),
                          if (property.rating != null &&
                              property.reviewCount != null)
                            RatingBadge(
                              rating: property.rating!,
                              reviewCount: property.reviewCount!,
                            ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
