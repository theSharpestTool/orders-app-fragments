// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cost_model_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CostModelStore on _CostModelStore, Store {
  Computed<ObservableList<String>> _$filesGalleryComputed;

  @override
  ObservableList<String> get filesGallery => (_$filesGalleryComputed ??=
          Computed<ObservableList<String>>(() => super.filesGallery))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$descriptionAtom = Atom(name: '_CostModelStore.description');

  @override
  String get description {
    _$descriptionAtom.context.enforceReadPolicy(_$descriptionAtom);
    _$descriptionAtom.reportObserved();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.context.conditionallyRunInAction(() {
      super.description = value;
      _$descriptionAtom.reportChanged();
    }, _$descriptionAtom, name: '${_$descriptionAtom.name}_set');
  }

  final _$isAddedAtom = Atom(name: '_CostModelStore.isAdded');

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

  final _$amountAtom = Atom(name: '_CostModelStore.amount');

  @override
  double get amount {
    _$amountAtom.context.enforceReadPolicy(_$amountAtom);
    _$amountAtom.reportObserved();
    return super.amount;
  }

  @override
  set amount(double value) {
    _$amountAtom.context.conditionallyRunInAction(() {
      super.amount = value;
      _$amountAtom.reportChanged();
    }, _$amountAtom, name: '${_$amountAtom.name}_set');
  }

  final _$filesAtom = Atom(name: '_CostModelStore.files');

  @override
  ObservableList<FileModelStore> get files {
    _$filesAtom.context.enforceReadPolicy(_$filesAtom);
    _$filesAtom.reportObserved();
    return super.files;
  }

  @override
  set files(ObservableList<FileModelStore> value) {
    _$filesAtom.context.conditionallyRunInAction(() {
      super.files = value;
      _$filesAtom.reportChanged();
    }, _$filesAtom, name: '${_$filesAtom.name}_set');
  }

  final _$userFilesAtom = Atom(name: '_CostModelStore.userFiles');

  @override
  ObservableList<Uint8List> get userFiles {
    _$userFilesAtom.context.enforceReadPolicy(_$userFilesAtom);
    _$userFilesAtom.reportObserved();
    return super.userFiles;
  }

  @override
  set userFiles(ObservableList<Uint8List> value) {
    _$userFilesAtom.context.conditionallyRunInAction(() {
      super.userFiles = value;
      _$userFilesAtom.reportChanged();
    }, _$userFilesAtom, name: '${_$userFilesAtom.name}_set');
  }

  final _$_CostModelStoreActionController =
      ActionController(name: '_CostModelStore');

  @override
  void serialize(Map<String, dynamic> data) {
    final _$actionInfo = _$_CostModelStoreActionController.startAction();
    try {
      return super.serialize(data);
    } finally {
      _$_CostModelStoreActionController.endAction(_$actionInfo);
    }
  }
}
