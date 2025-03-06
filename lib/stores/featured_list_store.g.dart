// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeaturedListStore on FeaturedListBaseStore, Store {
  late final _$featuredPropertiesAtom =
      Atom(name: 'FeaturedListBaseStore.featuredProperties', context: context);

  @override
  ObservableList<Property> get featuredProperties {
    _$featuredPropertiesAtom.reportRead();
    return super.featuredProperties;
  }

  @override
  set featuredProperties(ObservableList<Property> value) {
    _$featuredPropertiesAtom.reportWrite(value, super.featuredProperties, () {
      super.featuredProperties = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'FeaturedListBaseStore.isLoading', context: context);

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
      Atom(name: 'FeaturedListBaseStore.errorMessage', context: context);

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

  late final _$fetchFeaturedPropertiesAsyncAction = AsyncAction(
      'FeaturedListBaseStore.fetchFeaturedProperties',
      context: context);

  @override
  Future<void> fetchFeaturedProperties() {
    return _$fetchFeaturedPropertiesAsyncAction
        .run(() => super.fetchFeaturedProperties());
  }

  @override
  String toString() {
    return '''
featuredProperties: ${featuredProperties},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
