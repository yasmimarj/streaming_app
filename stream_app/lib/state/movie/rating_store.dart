import 'package:mobx/mobx.dart';

part 'rating_store.g.dart';

class RatingStore = _RatingStore with _$RatingStore;

abstract class _RatingStore with Store {
  @observable
  String? selectedRating;

  @action
  void setRating(String rating) {
    selectedRating = rating;
  }

  @action
  void clearRating() {
    selectedRating = null;
  }
}
