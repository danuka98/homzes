import 'package:get_it/get_it.dart';
import 'package:homzes/enum/property_type.dart';
import 'package:homzes/services/firebase_db_service.dart';
import 'package:mobx/mobx.dart';
import '../models/property.dart';

part 'featured_list_store.g.dart';

class FeaturedListStore = FeaturedListBaseStore with _$FeaturedListStore;

abstract class FeaturedListBaseStore with Store {
  final firebaseService = GetIt.I<FirebaseDbService>();

  @observable
  ObservableList<Property> featuredProperties = ObservableList<Property>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchFeaturedProperties() async {
    isLoading = true;
    errorMessage = null;

    try {
      final properties = await firebaseService.getFeaturedProperties();
      print('properties: $properties');
      featuredProperties.clear();

      // Set the property type to featured
      final List<Property> typedProperties = properties.map((property) {
        return property.copyWith(type: PropertyType.featured);
      }).toList();

      featuredProperties.addAll(typedProperties);
    } catch (e) {
      errorMessage = 'Failed to load featured properties: $e';
    } finally {
      isLoading = false;
    }
  }

  // @action
  // Future<void> toggleFavorite(Property property) async {
  //   final index = featuredProperties.indexWhere((p) => p.id == property.id);
  //   if (index >= 0) {
  //     final newStatus = await _firebaseService.toggleFavorite(property);

  //     // Update the property in the list with the new favorite status
  //     featuredProperties[index] = property.copyWith(isFavorite: newStatus);
  //   }
  // }
}
