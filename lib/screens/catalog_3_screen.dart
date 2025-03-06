import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:homzes/constants/app_colors.dart';
import 'package:homzes/stores/popular_rent_store.dart';
import 'package:homzes/widgets/custom_search_bar.dart';
import 'package:homzes/widgets/property_list_item.dart';

class Catalog3Screen extends StatefulWidget {
  const Catalog3Screen({super.key});

  @override
  State<Catalog3Screen> createState() => _Catalog3ScreenState();
}

class _Catalog3ScreenState extends State<Catalog3Screen> {
  final PopularRentStore popularRentStore = GetIt.I<PopularRentStore>();

  @override
  void initState() {
    super.initState();
    popularRentStore.fetchPopularRentOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.background3,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 70.0,
                bottom: 40.0,
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: CustomSearchBar(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Popular rent offers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Builder(
            builder: (context) {
              return popularRentStore.isLoading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: popularRentStore.popularRentOffers.length,
                        itemBuilder: (context, index) {
                          final property =
                              popularRentStore.popularRentOffers[index];
                          return PropertyListItem(property: property);
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
