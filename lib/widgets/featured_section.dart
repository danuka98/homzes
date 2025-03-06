import 'package:flutter/material.dart';
import 'package:homzes/constants/text_styles.dart';
import 'package:homzes/models/property.dart';
import 'package:homzes/widgets/property_card.dart';

class FeaturedSection extends StatelessWidget {
  final List<Property> properties;
  final VoidCallback onViewAllPressed;
  final bool isLoading;

  const FeaturedSection({
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
                'Featured',
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
        SizedBox(
          height: isLoading ? 150 : 230,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: properties.length,
            itemBuilder: (context, index) {
              return isLoading
                  ? Container(
                      margin: const EdgeInsets.only(right: 16),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    )
                  : PropertyCard(
                      property: properties[index],
                      onTap: () {},
                    );
            },
          ),
        ),
      ],
    );
  }
}
