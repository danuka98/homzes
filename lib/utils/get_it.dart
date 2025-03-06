import 'package:get_it/get_it.dart';
import 'package:homzes/services/firebase_db_service.dart';
import 'package:homzes/stores/featured_list_store.dart';
import 'package:homzes/stores/new_offers_store.dart';
import 'package:homzes/stores/popular_rent_store.dart';

Future<void> getItInitialize() async {
  GetIt getIt = GetIt.instance;

  // Register services
  getIt.registerSingleton<FirebaseDbService>(FirebaseDbService());

  // Register stores
  getIt.registerSingleton<FeaturedListStore>(FeaturedListStore());
  getIt.registerSingleton<PopularRentStore>(PopularRentStore());
  getIt.registerSingleton<NewOffersStore>(NewOffersStore());
}
