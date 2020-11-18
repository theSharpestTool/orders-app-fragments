import 'package:orders_app/services/helper_service.dart';
import 'package:orders_app/stores/user_store/user_store.dart';
import 'package:mobx/mobx.dart';
import 'package:orders_app/stores/base_store/base_model_store.dart';

part 'rating_details_model_store.g.dart';

enum Compliment {
  cleanliness,
  qualityWorkmanship,
  fastService,
  proffesionalisn,
}

class RatingModelStore = _RatingModelStore with _$RatingModelStore;

abstract class _RatingModelStore extends BaseModelStore with Store {
  _RatingModelStore(Map<String, dynamic> data) : super(data);
  _RatingModelStore.plain() : super.plain();

  @observable
  UserStore user;

  @observable
  DateTime createDate;

  @computed
  String get createDateString => stringDate(createDate);

  @observable
  int state;

  @observable
  String notes;

  @observable
  Compliment compliment;

  @observable
  int rating;

  @observable
  String orderId;

  @override
  void serialize(Map<String, dynamic> data) {
    super.serialize(data);
    user = UserStore(data: data['user']);
    createDate = DateTime.parse(data['createDate']);
    state = data['state'];
    notes = data['notes'] ?? '';
    rating = data['rating'] ?? 0; 

    if (data['professionalism'] == true) compliment = Compliment.proffesionalisn;
    if (data['cleanliness'] == true) compliment = Compliment.cleanliness;
    if (data['qualityworkmanship'] == true) compliment = Compliment.qualityWorkmanship;
    if (data['fastService'] == true) compliment = Compliment.fastService;
  }

  @override
  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'notes': notes,
        'professionalism': compliment == Compliment.proffesionalisn,
        'cleanliness': compliment == Compliment.cleanliness,
        'qualityworkmanship': compliment == Compliment.qualityWorkmanship,
        'fastService': compliment == Compliment.fastService,
        'rating': rating,
      };
}
