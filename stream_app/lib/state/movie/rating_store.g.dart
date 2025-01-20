// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RatingStore on _RatingStore, Store {
  late final _$selectedRatingAtom =
      Atom(name: '_RatingStore.selectedRating', context: context);

  @override
  String? get selectedRating {
    _$selectedRatingAtom.reportRead();
    return super.selectedRating;
  }

  @override
  set selectedRating(String? value) {
    _$selectedRatingAtom.reportWrite(value, super.selectedRating, () {
      super.selectedRating = value;
    });
  }

  late final _$_RatingStoreActionController =
      ActionController(name: '_RatingStore', context: context);

  @override
  void setRating(String rating) {
    final _$actionInfo = _$_RatingStoreActionController.startAction(
        name: '_RatingStore.setRating');
    try {
      return super.setRating(rating);
    } finally {
      _$_RatingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearRating() {
    final _$actionInfo = _$_RatingStoreActionController.startAction(
        name: '_RatingStore.clearRating');
    try {
      return super.clearRating();
    } finally {
      _$_RatingStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedRating: ${selectedRating}
    ''';
  }
}
