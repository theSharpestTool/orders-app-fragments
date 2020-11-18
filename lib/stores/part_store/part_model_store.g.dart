// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PartModelStore on _PartModelStore, Store {
  final _$isAddedAtom = Atom(name: '_PartModelStore.isAdded');

  @override
  bool get isAdded {
    _$isAddedAtom.context.enforceReadPolicy(_$isAddedAtom);
    _$isAddedAtom.reportObserved();
    return super.isAdded;
  }

  @override
  set isAdded(bool value) {
    _$isAddedAtom.context.conditionallyRunInAction(() {
      super.isAdded = value;
      _$isAddedAtom.reportChanged();
    }, _$isAddedAtom, name: '${_$isAddedAtom.name}_set');
  }

  final _$numberAtom = Atom(name: '_PartModelStore.number');

  @override
  String get number {
    _$numberAtom.context.enforceReadPolicy(_$numberAtom);
    _$numberAtom.reportObserved();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.context.conditionallyRunInAction(() {
      super.number = value;
      _$numberAtom.reportChanged();
    }, _$numberAtom, name: '${_$numberAtom.name}_set');
  }

  final _$priceAtom = Atom(name: '_PartModelStore.price');

  @override
  double get price {
    _$priceAtom.context.enforceReadPolicy(_$priceAtom);
    _$priceAtom.reportObserved();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.context.conditionallyRunInAction(() {
      super.price = value;
      _$priceAtom.reportChanged();
    }, _$priceAtom, name: '${_$priceAtom.name}_set');
  }

  final _$quantityAtom = Atom(name: '_PartModelStore.quantity');

  @override
  int get quantity {
    _$quantityAtom.context.enforceReadPolicy(_$quantityAtom);
    _$quantityAtom.reportObserved();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.context.conditionallyRunInAction(() {
      super.quantity = value;
      _$quantityAtom.reportChanged();
    }, _$quantityAtom, name: '${_$quantityAtom.name}_set');
  }

  final _$completedOrdersAtom = Atom(name: '_PartModelStore.completedOrders');

  @override
  ObservableList<RepairWorkModelStore> get completedOrders {
    _$completedOrdersAtom.context.enforceReadPolicy(_$completedOrdersAtom);
    _$completedOrdersAtom.reportObserved();
    return super.completedOrders;
  }

  @override
  set completedOrders(ObservableList<RepairWorkModelStore> value) {
    _$completedOrdersAtom.context.conditionallyRunInAction(() {
      super.completedOrders = value;
      _$completedOrdersAtom.reportChanged();
    }, _$completedOrdersAtom, name: '${_$completedOrdersAtom.name}_set');
  }

  final _$categoryAtom = Atom(name: '_PartModelStore.category');

  @override
  BaseModelStore get category {
    _$categoryAtom.context.enforceReadPolicy(_$categoryAtom);
    _$categoryAtom.reportObserved();
    return super.category;
  }

  @override
  set category(BaseModelStore value) {
    _$categoryAtom.context.conditionallyRunInAction(() {
      super.category = value;
      _$categoryAtom.reportChanged();
    }, _$categoryAtom, name: '${_$categoryAtom.name}_set');
  }

  final _$unitAtom = Atom(name: '_PartModelStore.unit');

  @override
  String get unit {
    _$unitAtom.context.enforceReadPolicy(_$unitAtom);
    _$unitAtom.reportObserved();
    return super.unit;
  }

  @override
  set unit(String value) {
    _$unitAtom.context.conditionallyRunInAction(() {
      super.unit = value;
      _$unitAtom.reportChanged();
    }, _$unitAtom, name: '${_$unitAtom.name}_set');
  }

  final _$_PartModelStoreActionController =
      ActionController(name: '_PartModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_PartModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_PartModelStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String value) {
    final _$actionInfo = _$_PartModelStoreActionController.startAction();
    try {
      return super.setQuantity(value);
    } finally {
      _$_PartModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
