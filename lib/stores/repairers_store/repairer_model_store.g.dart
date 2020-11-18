// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repairer_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RepairerModelStore on _RepairerModelStore, Store {
  Computed<int> _$ordersAmountComputed;

  @override
  int get ordersAmount =>
      (_$ordersAmountComputed ??= Computed<int>(() => super.ordersAmount))
          .value;
  Computed<ObservableList<RepairWorkModelStore>> _$completedOrdersComputed;

  @override
  ObservableList<RepairWorkModelStore> get completedOrders =>
      (_$completedOrdersComputed ??= Computed<ObservableList<RepairWorkModelStore>>(
              () => super.completedOrders))
          .value;
  Computed<ObservableList<OrderModelStore>> _$ordersComputed;

  @override
  ObservableList<OrderModelStore> get orders => (_$ordersComputed ??=
          Computed<ObservableList<OrderModelStore>>(() => super.orders))
      .value;

  final _$emailAtom = Atom(name: '_RepairerModelStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$profileImageAtom = Atom(name: '_RepairerModelStore.profileImage');

  @override
  Uint8List get profileImage {
    _$profileImageAtom.context.enforceReadPolicy(_$profileImageAtom);
    _$profileImageAtom.reportObserved();
    return super.profileImage;
  }

  @override
  set profileImage(Uint8List value) {
    _$profileImageAtom.context.conditionallyRunInAction(() {
      super.profileImage = value;
      _$profileImageAtom.reportChanged();
    }, _$profileImageAtom, name: '${_$profileImageAtom.name}_set');
  }

  final _$_RepairerModelStoreActionController =
      ActionController(name: '_RepairerModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_RepairerModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_RepairerModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
