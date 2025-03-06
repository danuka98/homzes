import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes/enum/property_type.dart';
import '../models/property.dart';

class FirebaseDbService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _propertyCollection = 'property';
  static const String _featuredPropertiesDoc = 'getFeaturedProperties';
  static const String _newOffersDoc = 'getNewOffers';
  static const String _popularRentOffersDoc = 'getPopularRentOffers';
  static const String _listCollection = 'list';

  Future<void> init() async {
    log('Firebase Service initialized');
  }

  Future<List<Property>> getFeaturedProperties() async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(_propertyCollection)
          .doc(_featuredPropertiesDoc)
          .collection(_listCollection)
          .get();

      log('Fetched ${snapshot.docs.length} featured properties');

      return snapshot.docs
          .map(
              (doc) => Property.fromFirestore(doc, type: PropertyType.featured))
          .toList();
    } catch (e) {
      log('Error fetching featured properties: $e');
      return [];
    }
  }

  Future<List<Property>> getNewOffers() async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(_propertyCollection)
          .doc(_newOffersDoc)
          .collection(_listCollection)
          .get();

      log('Fetched ${snapshot.docs.length} new offers');

      return snapshot.docs
          .map(
              (doc) => Property.fromFirestore(doc, type: PropertyType.newOffer))
          .toList();
    } catch (e) {
      log('Error fetching new offers: $e');
      return [];
    }
  }

  Future<List<Property>> getPopularRentOffers() async {
    try {
      final QuerySnapshot snapshot = await _firestore
          .collection(_propertyCollection)
          .doc(_popularRentOffersDoc)
          .collection(_listCollection)
          .get();

      log('Fetched ${snapshot.docs.length} popular rent offers');

      return snapshot.docs
          .map((doc) =>
              Property.fromFirestore(doc, type: PropertyType.popularRent))
          .toList();
    } catch (e) {
      log('Error fetching popular rent offers: $e');
      return [];
    }
  }

  /// Toggle favorite status of a property
  // Future<bool> toggleFavorite(Property property) async {
  //   try {
  //     // Determine which collection the property belongs to
  //     String docPath;
  //     if (property.type == PropertyType.featured) {
  //       docPath =
  //           '$_propertyCollection/$_featuredPropertiesDoc/$_listCollection/${property.id}';
  //     } else if (property.type == PropertyType.newOffer) {
  //       docPath =
  //           '$_propertyCollection/$_newOffersDoc/$_listCollection/${property.id}';
  //     } else {
  //       docPath =
  //           '$_propertyCollection/$_popularRentOffersDoc/$_listCollection/${property.id}';
  //     }

  //     // Update the property's favorite status
  //     await _firestore.doc(docPath).update({
  //       'isFavorite': !property.isFavorite,
  //     });

  //     log('Toggled favorite status for property ${property.id}');
  //     return !property.isFavorite;
  //   } catch (e) {
  //     log('Error toggling favorite status: $e');
  //     return property.isFavorite; // Return original value if operation failed
  //   }
  // }
}
