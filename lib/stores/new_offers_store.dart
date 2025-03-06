import 'package:get_it/get_it.dart';
import 'package:homzes/services/firebase_db_service.dart';
import 'package:mobx/mobx.dart';
import '../models/property.dart';

part 'new_offers_store.g.dart';

class NewOffersStore = NewOffersBaseStore with _$NewOffersStore;

abstract class NewOffersBaseStore with Store {
  final firebaseService = GetIt.I<FirebaseDbService>();

  @observable
  ObservableList<Property> newOffers = ObservableList<Property>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchNewOffers() async {
    isLoading = true;
    errorMessage = null;

    try {
      final offers = await firebaseService.getNewOffers();
      newOffers.clear();
      newOffers.addAll(offers);
    } catch (e) {
      errorMessage = 'Failed to load new offers: $e';
    } finally {
      isLoading = false;
    }
  }

  // @action
  // Future<void> toggleFavorite(Property property) async {
  //   final index = newOffers.indexWhere((p) => p.id == property.id);
  //   if (index >= 0) {
  //     final newStatus = await _firebaseService.toggleFavorite(property);

  //     // Update the property in the list with the new favorite status
  //     newOffers[index] = property.copyWith(isFavorite: newStatus);
  //   }
  // }
}
