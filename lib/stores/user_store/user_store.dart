import 'package:orders_app/constants/token_values.dart';
import 'package:orders_app/stores/index.dart';
import 'package:mobx/mobx.dart';
import 'package:corsac_jwt/corsac_jwt.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

enum Role { leaser, client, repairer, manager }

final Map<String, Role> stringRoles = {
  'Leaser': Role.leaser,
  'Client': Role.client,
  'Repairer': Role.repairer,
  'Manager': Role.manager,
};

abstract class _UserStore with Store {
  @observable
  String userId;

  @observable
  String email;

  @observable
  String name;

  @observable
  String phoneNumber;

  @observable
  Role role;

  @observable
  bool loading = false;

  @observable
  bool loaded = false;

  _UserStore({Map<String, dynamic> data}) {
    if (data != null) {
      userId = data['id'];
      email = data['email'];
      name = data['fullName'];
    }
  }

  Map<String, dynamic> toJson() => {
        "id": userId,
        "email": email,
        "fullName": name,
      };

  @action
  Future<void> load() async {
    final jwtClaims = JWT.parse(authStore.token).claims;

    role = stringRoles[jwtClaims[TokenValues.role]];
    userId = jwtClaims[TokenValues.id];
    email = jwtClaims[TokenValues.email];
    name = jwtClaims[TokenValues.userName];

    phoneNumber = '(319) 555-0115';

    print('done');
  }
}
