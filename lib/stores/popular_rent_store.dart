import 'package:get_it/get_it.dart';
import 'package:homzes/services/firebase_db_service.dart';
import 'package:mobx/mobx.dart';
import '../models/property.dart';

part 'popular_rent_store.g.dart';

class PopularRentStore = PopularRentBaseStore with _$PopularRentStore;

abstract class PopularRentBaseStore with Store {
  final firebaseService = GetIt.I<FirebaseDbService>();

  @observable
  ObservableList<Property> popularRentOffers = ObservableList<Property>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchPopularRentOffers() async {
    isLoading = true;
    errorMessage = null;

    try {
      final offers = await firebaseService.getPopularRentOffers();
      popularRentOffers.clear();
      popularRentOffers.addAll(offers);
    } catch (e) {
      errorMessage = 'Failed to load popular rent offers: $e';
    } finally {
      isLoading = false;
    }
  }

  // @action
  // Future<void> toggleFavorite(Property property) async {
  //   final index = popularRentOffers.indexWhere((p) => p.id == property.id);
  //   if (index >= 0) {
  //     final newStatus = await _firebaseService.toggleFavorite(property);

  //     // Update the property in the list with the new favorite status
  //     popularRentOffers[index] = property.copyWith(isFavorite: newStatus);
  //   }
  // }
}
