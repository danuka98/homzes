// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_rent_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PopularRentStore on PopularRentBaseStore, Store {
  late final _$popularRentOffersAtom =
      Atom(name: 'PopularRentBaseStore.popularRentOffers', context: context);

  @override
  ObservableList<Property> get popularRentOffers {
    _$popularRentOffersAtom.reportRead();
    return super.popularRentOffers;
  }

  @override
  set popularRentOffers(ObservableList<Property> value) {
    _$popularRentOffersAtom.reportWrite(value, super.popularRentOffers, () {
      super.popularRentOffers = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'PopularRentBaseStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'PopularRentBaseStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$fetchPopularRentOffersAsyncAction = AsyncAction(
      'PopularRentBaseStore.fetchPopularRentOffers',
      context: context);

  @override
  Future<void> fetchPopularRentOffers() {
    return _$fetchPopularRentOffersAsyncAction
        .run(() => super.fetchPopularRentOffers());
  }

  @override
  String toString() {
    return '''
popularRentOffers: ${popularRentOffers},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
