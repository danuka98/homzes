// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_offers_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewOffersStore on NewOffersBaseStore, Store {
  late final _$newOffersAtom =
      Atom(name: 'NewOffersBaseStore.newOffers', context: context);

  @override
  ObservableList<Property> get newOffers {
    _$newOffersAtom.reportRead();
    return super.newOffers;
  }

  @override
  set newOffers(ObservableList<Property> value) {
    _$newOffersAtom.reportWrite(value, super.newOffers, () {
      super.newOffers = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'NewOffersBaseStore.isLoading', context: context);

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
      Atom(name: 'NewOffersBaseStore.errorMessage', context: context);

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

  late final _$fetchNewOffersAsyncAction =
      AsyncAction('NewOffersBaseStore.fetchNewOffers', context: context);

  @override
  Future<void> fetchNewOffers() {
    return _$fetchNewOffersAsyncAction.run(() => super.fetchNewOffers());
  }

  @override
  String toString() {
    return '''
newOffers: ${newOffers},
isLoading: ${isLoading},
errorMessage: ${errorMessage}
    ''';
  }
}
