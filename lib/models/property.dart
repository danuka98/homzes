import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homzes/enum/property_type.dart';

class Property {
  final String id;
  final String title;
  final String subtitle;
  final double price;
  final String imageUrl;
  final double? rating;
  final int? reviewCount;
  final bool isFavorite;
  final String? address;
  final String? location;
  final int rooms;
  final int? beds;
  final int? bathrooms;

  Property({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    this.rating,
    this.reviewCount,
    this.isFavorite = false,
    this.address,
    this.location,
    this.beds,
    this.bathrooms,
    required this.rooms,
  });

  Property copyWith({
    String? id,
    String? title,
    String? subtitle,
    double? price,
    String? imageUrl,
    double? rating,
    int? reviewCount,
    bool? isFavorite,
    String? location,
    int? rooms,
    int? beds,
    int? bathrooms,
    PropertyType? type,
  }) {
    return Property(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      isFavorite: isFavorite ?? this.isFavorite,
      location: location ?? this.location,
      rooms: rooms ?? this.rooms,
      beds: beds ?? this.beds,
      bathrooms: bathrooms ?? this.bathrooms,
    );
  }

  factory Property.fromFirestore(
    DocumentSnapshot doc, {
    PropertyType type = PropertyType.featured,
  }) {
    final data = doc.data() as Map<String, dynamic>;
    return Property(
      id: doc.id,
      title: data['title'] ?? '',
      subtitle: data['subTitle'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      imageUrl: data['image'] ?? '',
      rating: data['rating']?.toDouble(),
      reviewCount: data['reviewCount'],
      isFavorite: data['isFavorite'] ?? false,
      location: data['location'],
      rooms: data['rooms'] ?? 0,
      beds: data['beds'],
      bathrooms: data['bathrooms'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subTitle': subtitle,
      'price': price,
      'image': imageUrl,
      'rating': rating,
      'reviewCount': reviewCount,
      'isFavorite': isFavorite,
      'location': location,
      'rooms': rooms,
      'beds': beds,
      'bathrooms': bathrooms,
    };
  }

  // Sample data for the app
  static List<Property> getFeaturedProperties() {
    return [
      Property(
        id: '1',
        title: 'Rent 3 room',
        subtitle: 'apartment in the center',
        price: 580,
        imageUrl: 'assets/images/modern_house.jpg',
        rooms: 3,
      ),
      Property(
        id: '2',
        title: 'Apartment',
        subtitle: '4 rooms',
        price: 750,
        imageUrl: 'assets/images/classic_house.jpg',
        rooms: 4,
      ),
      Property(
        id: '3',
        title: 'Apartment',
        subtitle: 'center',
        price: 1100,
        imageUrl: 'assets/images/modern_apartment.webp',
        rooms: 3,
      ),
    ];
  }

  // static List<Property> getNewOffers() {
  //   return [
  //     Property(
  //       id: '4',
  //       title: 'Apartment 3 rooms',
  //       subtitle: '',
  //       price: 1250,
  //       imageUrl: 'assets/images/classic_house.jpg',
  //       rating: 4.9,
  //       reviewCount: 29,
  //       isFavorite: false,
  //       rooms: 3,
  //     ),
  //   ];
  // }

  static List<Property> getPopularRentOffers() {
    return [
      Property(
        id: '5',
        title: 'Apartment 4 rooms',
        subtitle: '',
        price: 1250,
        imageUrl: 'assets/images/modern_house.jpg',
        rooms: 4,
        beds: 3,
        bathrooms: 2,
        location: 'Russia, Moscow',
        isFavorite: false,
      ),
      Property(
        id: '6',
        title: 'Apartment 3 rooms',
        subtitle: '',
        price: 1430,
        imageUrl: 'assets/images/modern_house_2.png',
        rooms: 3,
        beds: 2,
        bathrooms: 2,
        location: 'Russia, Moscow',
        isFavorite: false,
      ),
      Property(
        id: '7',
        title: 'House 5 rooms',
        subtitle: '',
        price: 1850,
        imageUrl: 'assets/images/classic_house.jpg',
        rooms: 5,
        beds: 4,
        bathrooms: 3,
        location: 'Russia, Moscow',
        isFavorite: true,
      ),
    ];
  }
}
