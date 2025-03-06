import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:homzes/components/catalog_1_app_bar.dart';
import 'package:homzes/constants/app_colors.dart';
import 'package:homzes/screens/catalog_3_screen.dart';
import 'package:homzes/widgets/custom_search_bar.dart';
import 'package:homzes/widgets/featured_section.dart';
import 'package:homzes/widgets/new_offers_section.dart';
import 'package:homzes/stores/featured_list_store.dart';
import 'package:homzes/stores/new_offers_store.dart';
import 'package:get_it/get_it.dart';

class Catalog1Screen extends StatefulWidget {
  const Catalog1Screen({super.key});

  @override
  State<Catalog1Screen> createState() => _Catalog1ScreenState();
}

class _Catalog1ScreenState extends State<Catalog1Screen> {
  final FeaturedListStore featuredListStore = GetIt.I<FeaturedListStore>();
  final NewOffersBaseStore newOffersStore = GetIt.I<NewOffersStore>();

  @override
  void initState() {
    super.initState();
    featuredListStore.fetchFeaturedProperties();
    newOffersStore.fetchNewOffers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Observer(
          builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: AppColors.background2,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomAppBar(
                        userName: 'Stanislav',
                        userInitial: 'S',
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: CustomSearchBar(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                FeaturedSection(
                  properties: featuredListStore.featuredProperties,
                  isLoading: featuredListStore.isLoading,
                  onViewAllPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Catalog3Screen();
                        },
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                NewOffersSection(
                  properties: newOffersStore.newOffers,
                  isLoading: newOffersStore.isLoading,
                  onViewAllPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Catalog3Screen();
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
